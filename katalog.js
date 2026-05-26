// katalog.js

// Fungsi untuk mengambil data dari Supabase
async function tampilkanKatalog() {
    const container = document.getElementById('container-produk');

    try {
        // Ambil semua data dari tabel 'produk'
        const { data: listProduk, error } = await supabaseClient
            .from('produk')
            .select('*');

        if (error) throw error;

        // Kosongkan tulisan "Memuat produk..."
        container.innerHTML = '';

        // Jika data kosong
        if (listProduk.length === 0) {
            container.innerHTML = '<p style="text-align: center; width: 100%;">Belum ada produk yang dijual.</p>';
            return;
        }

        // Looping data untuk dimasukkan ke dalam HTML
        listProduk.forEach(produk => {
            const card = document.createElement('div');
            card.className = 'card';

            card.innerHTML = `
                <div class="card-image">
                    <img src="https://via.placeholder.com/150/FAFD FC/5D4037?text=Nusantara+Cuy" alt="${produk.nama_produk}">
                </div>

                <div class="card-content">
                    <h3>${produk.nama_produk}</h3>
                    <p class="deskripsi">${produk.deskripsi || 'Tidak ada deskripsi.'}</p>
                    <p class="harga">Rp ${Number(produk.harga).toLocaleString('id-ID')}</p>
                    <a href="#" class="btn-beli">Beli Sekarang</a>
                </div>
            `;

            container.appendChild(card);
        });

    } catch (err) {
        console.error('Gagal memuat katalog:', err.message);
        container.innerHTML = `<p style="color: red; text-align: center; width: 100%;">Error: ${err.message}</p>`;
    }
}

// Jalankan fungsi begitu halaman web selesai dimuat
document.addEventListener('DOMContentLoaded', tampilkanKatalog);