// ====================================================================
// FUNGSI UTAMA PROSES LOGIN ADMIN
// ====================================================================
async function prosesLogin() {
  const emailInput = document.getElementById('loginEmail').value.trim();
  const passwordInput = document.getElementById('loginPassword').value.trim();

  // Validasi awal input kosong
  if (!emailInput || !passwordInput) {
    alert("Mohon masukkan email dan password Anda terlebih dahulu!");
    return;
  }

  try {
    // Pastikan koneksi Supabase di db.js sudah siap
    if (typeof supabaseClient === 'undefined') {
      throw new Error("Koneksi 'supabaseClient' tidak ditemukan di db.js. Periksa konfigurasi database Anda.");
    }

    // Melakukan proses autentikasi ke Supabase Auth
    const { data, error } = await supabaseClient.auth.signInWithPassword({
      email: emailInput,
      password: passwordInput,
    });

    if (error) {
      // Jika error karena salah sandi/email atau user belum terdaftar
      throw new Error(error.message || "Email atau password yang Anda masukkan salah!");
    }

    // --- KUNCI UTAMA AGAR TIDAK MENTAL ---
    // Menyimpan token akses dan status sesi ke dalam localStorage browser
    if (data && data.session) {
      localStorage.setItem('admin_session', 'true');
      localStorage.setItem('supabase_token', data.session.access_token);
      
      alert("✔️ Login Berhasil! Selamat datang di Panel Admin Nusantara Cuy.");
      
      // Alihkan halaman ke dashboard secara aman
      window.location.replace('dashboard.html');
    } else {
      throw new Error("Gagal membuat sesi login admin. Silakan coba lagi.");
    }

  } catch (err) {
    console.error("Login Error:", err);
    alert("❌ Gagal Masuk: " + err.message);
  }
}

// ====================================================================
// FUNGSI UNTUK MENGECEK STATUS SESI DI DASHBOARD
// ====================================================================
function proteksiHalamanDashboard() {
  const session = localStorage.getItem('admin_session');
  if (!session) {
    // Jika tidak ada sesi aktif, paksa kembali ke index.html
    window.location.replace('index.html');
  }
}

// ====================================================================
// FUNGSI LOGOUT / KELUAR APLIKASI
// ====================================================================
async function logoutAdmin() {
  try {
    if (typeof supabaseClient !== 'undefined') {
      await supabaseClient.auth.signOut();
    }
  } catch (err) {
    console.error("Error saat signout dari Supabase:", err);
  } finally {
    // Hapus semua jejak penyimpanan sesi dari browser
    localStorage.removeItem('admin_session');
    localStorage.removeItem('supabase_token');
    localStorage.clear();
    
    alert("Anda telah berhasil keluar dari sistem.");
    window.location.replace('index.html');
  }
}