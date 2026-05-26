// admin.js
async function tambahProduk() {
    // 1. AMBIL NILAI DARI INPUT HTML (Sudah disesuaikan dengan ID di admin.html)
    const nama = document.getElementById('nama_produk').value;
    const harga = document.getElementById('harga').value;
    const deskripsi = document.getElementById('deskripsi').value;

    try {
        // 2. KIRIM KE SUPABASE
        const { data, error } = await supabaseClient
            .from('produk')
            .insert([
                { 
                    nama_produk: nama,       
                    harga: parseInt(harga),  // diubah ke angka (integer)
                    deskripsi: deskripsi 
                }
            ]);

        if (error) throw error;

        alert('Produk berhasil disimpan ke Cloud Supabase Singapore!');
        
        // Mengosongkan form kembali setelah sukses (Sesuai ID form-produk)
        document.getElementById('form-produk').reset();

    } catch (err) {
        console.error('Error saat menyimpan:', err.message);
        alert('Gagal menyimpan produk: ' + err.message);
    }
}