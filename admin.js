// Fungsi untuk mengirim data dari form HTML ke database Supabase
async function tambahProduk() {
    // Mengambil data dari inputan form HTML Anda
    const nama = document.getElementById('inputNamaProduk').value;
    const harga = document.getElementById('inputHargaProduk').value;
    const deskripsi = document.getElementById('inputDeskripsiProduk').value;

    // Proses memasukkan data ke tabel 'produk' di Supabase
    const { data, error } = await supabase
      .from('produk')
      .insert([
        { nama_produk: nama, harga: parseInt(harga), deskripsi: deskripsi }
      ]);

    if (error) {
        console.error('Gagal menyimpan data ke cloud:', error);
        alert('Gagal menyimpan produk!');
    } else {
        alert('Produk berhasil disimpan ke Cloud Supabase!');
        // Mengosongkan form kembali setelah sukses
        document.getElementById('formProduk').reset();
    }
}