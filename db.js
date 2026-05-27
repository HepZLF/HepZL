// db.js

// Konfigurasi URL dan API Key Supabase yang Valid
const supabaseUrl = 'https://safbzgsfjwuuosuvzgbe.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlncmhoeHl4amlxaGFyYmd5ZmF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk4MDA3NTMsImV4cCI6MjA5NTM3Njc1M30.LfKfEtnPwQ37OCLc7xzrP5cb-iI6nseJMYSy2l59Li4'; // <--- Tempelkan anon key baru di sini, pastikan tetap di dalam tanda kutip tunggal

// Membuat client Supabase global
window.supabaseClient = supabase.createClient(supabaseUrl, supabaseKey);
const supabaseClient = window.supabaseClient;