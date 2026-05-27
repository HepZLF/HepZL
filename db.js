// db.js

// Konfigurasi URL dan API Key Supabase yang Valid
const supabaseUrl = 'https://safbzgsfjwuuosuvzgbe.supabase.co';
const supabaseKey = 'TEMPEL_ANON_KEY_ANDA_DI_SINI'; // <--- Tempelkan anon key baru di sini, pastikan tetap di dalam tanda kutip tunggal

// Membuat client Supabase global
window.supabaseClient = supabase.createClient(supabaseUrl, supabaseKey);
const supabaseClient = window.supabaseClient;