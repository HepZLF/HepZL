// admin.js

async function memuatDasborAwal() {
    renderTabelProduk();
    isiDropdownProdukPenjualan();
    const inputTanggal = document.getElementById('tanggal_penjualan');
    if (inputTanggal) {
        inputTanggal.value = new Date().toISOString().substring(0, 10);
    }
}

// Render data tabel produk fiks
async function renderTabelProduk() {
    const tbody = document.getElementById('tabel-produk');
    if (!tbody) return;
    try {
        const { data: listProduk, error } = await supabaseClient.from('produk').select('*').order('id', { ascending: true });
        if (error) throw error;
        tbody.innerHTML = '';
        listProduk.forEach(p => {
            const tr = document.createElement('tr');
            tr.innerHTML = `
                <td><strong>${p.nama_produk}</strong></td>
                <td>Rp ${Number(p.harga).toLocaleString('id-ID')}</td>
                <td style="max-width:200px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${p.foto_url || '-'}</td>
                <td>
                    <button onclick="isiFormUntukEdit(${p.id}, '${p.nama_produk}', ${p.harga}, '${p.deskripsi || ''}', '${p.foto_url || ''}')" style="background:#0288d1; padding:5px 10px; font-size:0.85em; width:auto;">Edit</button>
                </td>
            `;
            tbody.appendChild(tr);
        });
    } catch (err) { console.error(err); }
}

function isiFormUntukEdit(id, nama, harga, deskripsi, foto) {
    document.getElementById('edit-id-produk').value = id;
    document.getElementById('nama_produk').value = nama;
    document.getElementById('harga').value = harga;
    document.getElementById('deskripsi').value = deskripsi;
    document.getElementById('foto_url').value = foto;
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

// Proses update harga & foto produk
async function tambahAtauUpdateProduk() {
    const idProduk = document.getElementById('edit-id-produk').value;
    const harga = parseInt(document.getElementById('harga').value);
    const fotoUrl = document.getElementById('foto_url').value;

    if (!idProduk) {
        alert('Silakan pilih produk yang ingin diedit dari tabel di bawah terlebih dahulu!');
        return;
    }

    try {
        const { error } = await supabaseClient
            .from('produk')
            .update({ harga: harga, foto_url: fotoUrl })
            .eq('id', parseInt(idProduk));
            
        if (error) throw error;
        alert('Data produk berhasil diperbarui!');
        document.getElementById('form-produk').reset();
        document.getElementById('edit-id-produk').value = '';
        memuatDasborAwal();
    } catch (err) { alert(err.message); }
}

// Dropdown pilihan produk fiks yang tersinkron otomatis
async function isiDropdownProdukPenjualan() {
    const select = document.getElementById('pilih_produk');
    if (!select) return;
    try {
        const { data: listProduk, error } = await supabaseClient.from('produk').select('id, nama_produk');
        if (error) throw error;
        select.innerHTML = '<option value="">-- Pilih Produk --</option>';
        listProduk.forEach(p => {
            select.innerHTML += `<option value="${p.id}">${p.nama_produk}</option>`;
        });
    } catch (err) { console.error(err); }
}

// Simpan data penjualan beserta Nama & Alamat Pembeli
async function simpanPenjualan() {
    const produkId = document.getElementById('pilih_produk').value;
    const jumlah = parseInt(document.getElementById('jumlah_terjual').value);
    const tanggal = document.getElementById('tanggal_penjualan').value;
    const namaPembeli = document.getElementById('nama_pembeli').value;
    const alamatPembeli = document.getElementById('alamat_pembeli').value;

    try {
        const { data: produk, error: errProduk } = await supabaseClient.from('produk').select('harga').eq('id', parseInt(produkId)).single();
        if (errProduk) throw errProduk;

        const totalHarga = produk.harga * jumlah;

        const { error: errInsert } = await supabaseClient.from('penjualan').insert([
            { 
                produk_id: parseInt(produkId), 
                jumlah_terjual: jumlah, 
                total_harga: totalHarga, 
                tanggal: tanggal,
                nama_pembeli: namaPembeli,
                alamat_pembeli: alamatPembeli
            }
        ]);
        if (errInsert) throw errInsert;

        alert(`Transaksi penjualan berhasil dicatat!\nTotal: Rp ${totalHarga.toLocaleString('id-ID')}`);
        document.getElementById('form-penjualan').reset();
        memuatDasborAwal();
    } catch (err) { alert(err.message); }
}