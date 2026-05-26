// Menginisialisasi koneksi ke Supabase
const supabaseUrl = 'https://safbzgsfjwuuosuvzgbe.supabase.co';
// Ganti dengan anon key Anda yang dari file .env tadi
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNhZmJ6Z3Nmand1dW9zdXZ6Z2JlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk3OTI4ODcsImV4cCI6MjA5NTM2ODg4N30.e8qKMyA9-3pmI0ueDpAJHOkZYyS2dTdYJzWzcDKUQZw'; 

const supabase = supabaseJs.createClient(supabaseUrl, supabaseKey);

// Sekarang variabel 'supabase' sudah siap digunakan di file JS Anda yang lain!