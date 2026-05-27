// db.js

// Konfigurasi URL dan API Key Supabase yang Sesuai dengan .env Anda
const supabaseUrl = 'https://safbzgsfjwuuosuvzgbe.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlncmhoeHl4amlxaGFyYmd5ZmF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk4MDA3NTMsImV4cCI6MjA5NTM3Njc1M30.LfKfEtnPwQ37OCLc7xzrP5cb-iI6nseJMYSy2l59Li4';

// Membuat client Supabase dan menyimpannya ke objek window agar bisa diakses global oleh script lain
window.supabaseClient = supabase.createClient(supabaseUrl, supabaseKey);

// Salinan variabel tanpa window untuk menjaga kecocokan dengan kode lama
const supabaseClient = window.supabaseClient;