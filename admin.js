// admin.js
async function tambahProduk() {
    // 1. AMBIL NILAI DARI INPUT HTML (Perhatikan nama variabelnya)
    const nama = document.getElementById('inputNamaProduk').value;
    const harga = document.getElementById('inputHargaProduk').value;
    const deskripsi = document.getElementById('inputDeskripsiProduk').value;

    try {
        // 2. KIRIM KE SUPABASE (Pastikan nama variabel di atas dipanggil di sini)
        const { data, error } = await supabaseClient
            .from('produk')
            .insert([
                { 
                    nama_produk: nama,       // 'nama' diambil dari variabel di atas
                    harga: parseInt(harga),  // diubah ke angka (integer)
                    deskripsi: deskripsi 
                }
            ]);

        if (error) throw error;

        alert('Produk berhasil disimpan ke Cloud Supabase Singapore!');
        
        // Mengosongkan form kembali setelah sukses
        document.getElementById('formProduk').reset();

    } catch (err) {
        console.error('Error saat menyimpan:', err.message);
        alert('Gagal menyimpan produk: ' + err.message);
    }
}