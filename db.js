// db.js
const supabaseUrl = 'https://igrhhxyxjiqharbgyfau.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlncmhoeHl4amlxaGFyYmd5ZmF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk4MDA3NTMsImV4cCI6MjA5NTM3Njc1M30.LfKfEtnPwQ37OCLc7xzrP5cb-iI6nseJMYSy2l59Li4';

// GANTI NAMA VARIABEL MENJADI supabaseClient
const supabaseClient = supabase.createClient(supabaseUrl, supabaseKey);