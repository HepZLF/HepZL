// auth.js

// 1. FUNGSI PROSES LOGIN
async function prosesLogin() {
    const email = document.getElementById('loginEmail').value;
    const password = document.getElementById('loginPassword').value;

    try {
        const { data, error } = await supabaseClient.auth.signInWithPassword({
            email: email,
            password: password,
        });

        if (error) throw error;

        alert('Login Berhasil! Selamat Datang Admin.');
        // Alihkan halaman ke dashboard internal admin
        window.location.href = 'dashboard.html';
    } catch (err) {
        alert('Gagal Login: ' + err.message);
    }
}

// 2. FUNGSI CEK PROTEKSI (Mencegah user biasa masuk langsung lewat URL)
async function proteksiHalamanAdmin() {
    const { data: { session } } = await supabaseClient.auth.getSession();
    
    if (!session) {
        alert('Akses Ditolak! Anda harus login terlebih dahulu.');
        window.location.href = 'index.html';
    }
}

// 3. FUNGSI LOGOUT
async function prosesLogout() {
    const { error } = await supabaseClient.auth.signOut();
    if (!error) {
        alert('Berhasil Logout.');
        window.location.href = 'index.html';
    }
}