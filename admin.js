// admin.js

// Fungsi Utama saat Dashboard Dibuka
async function memuatDasborAwal() {
    renderTabelProduk();
    isiDropdownProdukPenjualan();
    
    // Set otomatis kolom input tanggal ke hari ini
    const inputTanggal = document.getElementById('tanggal_penjualan');
    if (inputTanggal) {
        inputTanggal.value = new Date().toISOString().substring(0, 10);
    }
}

// 1. TAMPILKAN TABEL PRODUK
async function renderTabelProduk() {
    const tbody = document.getElementById('tabel-produk');
    if (!tbody) return;

    try {
        const { data: listProduk, error } = await supabaseClient
            .from('produk')
            .select('*')
            .order('id', { ascending: true });
            
        if (error) throw error;

        tbody.innerHTML = '';
        listProduk.forEach(p => {
            const tr = document.createElement('tr');
            tr.innerHTML = `
                <td><strong>${p.nama_produk}</strong></td>
                <td>Rp ${Number(p.harga).toLocaleString('id-ID')}</td>
                <td>${p.deskripsi || '-'}</td>
                <td>
                    <button onclick="isiFormUntukEdit(${p.id}, '${p.nama_produk}', ${p.harga}, '${p.deskripsi}')" style="background:#0288d1; padding:5px 10px; font-size:0.85em; width: auto;">Edit</button>
                </td>
            `;
            tbody.appendChild(tr);
        });
    } catch (err) {
        console.error('Gagal memuat tabel produk:', err.message);
    }
}

// Fungsi Mindahin Data Tabel ke Form Atas untuk Diedit
function isiFormUntukEdit(id, nama, harga, deskripsi) {
    document.getElementById('edit-id-produk').value = id;
    document.getElementById('nama_produk').value = nama;
    document.getElementById('harga').value = harga;
    document.getElementById('deskripsi').value = deskripsi;
    document.getElementById('btn-simpan-produk').innerText = 'Simpan Perubahan (Update Product)';
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

// 2. LOGIKA SIMPAN BARU ATAU UPDATE PRODUK LAMA
async function tambahAtauUpdateProduk() {
    const idProduk = document.getElementById('edit-id-produk').value;
    const nama = document.getElementById('nama_produk').value;
    const harga = parseInt(document.getElementById('harga').value);
    const deskripsi = document.getElementById('deskripsi').value;

    try {
        if (idProduk) {
            // JIKA ID ADA = UPDATE
            const { error } = await supabaseClient
                .from('produk')
                .update({ nama_produk: nama, harga: harga, deskripsi: deskripsi })
                .eq('id', parseInt(idProduk));
                
            if (error) throw error;
            alert('Produk berhasil diperbarui!');
        } else {
            // JIKA ID KOSONG = DATA BARU
            const { error } = await supabaseClient
                .from('produk')
                .insert([{ nama_produk: nama, harga: harga, deskripsi: deskripsi }]);
                
            if (error) throw error;
            alert('Produk baru berhasil ditambahkan!');
        }

        // Reset Form ke awal
        document.getElementById('form-produk').reset();
        document.getElementById('edit-id-produk').value = '';
        document.getElementById('btn-simpan-produk').innerText = 'Simpan Produk Baru';
        
        memuatDasborAwal();
    } catch (err) {
        alert('Gagal memproses produk: ' + err.message);
    }
}

// 3. PASANG DATA PRODUK KE PILIHAN FORM PENJUALAN
async function isiDropdownProdukPenjualan() {
    const select = document.getElementById('pilih_produk');
    if (!select) return;

    try {
        const { data: listProduk, error } = await supabaseClient
            .from('produk')
            .select('id, nama_produk');
            
        if (error) throw error;

        select.innerHTML = '<option value="">-- Pilih Produk Terjual --</option>';
        listProduk.forEach(p => {
            select.innerHTML += `<option value="${p.id}">${p.nama_produk}</option>`;
        });
    } catch (err) {
        console.error('Gagal memuat dropdown produk:', err.message);
    }
}

// 4. SIMPAN DATA TRANSAKSI PENJUALAN DAN HITUNG TOTAL HARGA OTOMATIS
async function simpanPenjualan() {
    const produkId = document.getElementById('pilih_produk').value;
    const jumlah = parseInt(document.getElementById('jumlah_terjual').value);
    const tanggal = document.getElementById('tanggal_penjualan').value;

    if (!produkId) {
        alert('Silakan pilih produk terlebih dahulu!');
        return;
    }

    try {
        // Ambil harga dari DB dulu untuk dikalikan kuantitas
        const { data: produk, error: errProduk } = await supabaseClient
            .from('produk')
            .select('harga')
            .eq('id', parseInt(produkId))
            .single();

        if (errProduk) throw errProduk;

        const totalHarga = produk.harga * jumlah;

        // Masuk ke tabel 'penjualan' lama sesuai nama kolom Anda
        const { error: errInsert } = await supabaseClient
            .from('penjualan')
            .insert([
                { 
                    produk_id: parseInt(produkId), 
                    jumlah_terjual: jumlah, 
                    total_harga: totalHarga, 
                    tanggal: tanggal 
                }
            ]);

        if (errInsert) throw errInsert;

        alert(`Transaksi sukses dicatat!\nTotal Pendapatan: Rp ${totalHarga.toLocaleString('id-ID')}`);
        document.getElementById('form-penjualan').reset();
        
        memuatDasborAwal();
    } catch (err) {
        alert('Gagal mencatat penjualan: ' + err.message);
    }
}