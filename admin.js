// Contoh di dalam fungsi tambahProduk() kamu:
async function tambahProduk() {
    // ... kode mengambil data input ...

    // PASTIKAN MENGGUNAKAN supabaseClient
    const { data, error } = await supabaseClient
        .from('produk')
        .insert([
            { nama_produk: nama, harga: harga, deskripsi: deskripsi }
        ]);

    // ... kode alert sukses / error ...
}