-- ============================================================
-- SQL untuk Database Supabase
-- Sumber: BP.xlsx
-- Dibuat: 2026-05-27
-- ============================================================

-- ============================================================
-- 1. STOK BARANG
-- ============================================================
DROP TABLE IF EXISTS stok_barang CASCADE;

CREATE TABLE stok_barang (
    id SERIAL PRIMARY KEY,
    nama_barang VARCHAR(100) NOT NULL,
    jumlah NUMERIC(10, 2),
    satuan VARCHAR(20),
    updated_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO stok_barang (nama_barang, jumlah, satuan) VALUES
    ('Gula Aren', 0, 'Gram'),
    ('Gula Pasir', 889.6, 'Gram'),
    ('Longan', 4, 'Kaleng'),
    ('Nutrijell Leci', 16, 'Bungkus'),
    ('Nutrijell Kopi', 10, 'Bungkus'),
    ('Nutrijell Cincau', 12, 'Bungkus'),
    ('Selasih', 87, 'Gram'),
    ('Susu UHT', 17, 'Botol'),
    ('Susu Evaporasi', 8, 'Kaleng'),
    ('Bunga Telang', 71, 'Gram'),
    ('Sedotan', 4, 'Bungkus'),
    ('Plastik', 8, 'Bungkus'),
    ('Cup Minuman', 396, 'Pcs'),
    ('Tutup Cup Minuman', 374, 'Pcs'),
    ('Lemon Kering', 500, 'Gram');


-- ============================================================
-- 2. LIST HARGA BAHAN BAKU (dari sheet HPP NEW)
-- ============================================================
DROP TABLE IF EXISTS list_harga CASCADE;

CREATE TABLE list_harga (
    id SERIAL PRIMARY KEY,
    nama_barang VARCHAR(150) NOT NULL,
    harga_beli NUMERIC(12, 2),
    jumlah_beli NUMERIC(12, 2),
    satuan VARCHAR(20),
    harga_per_qty NUMERIC(12, 4),
    updated_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO list_harga (nama_barang, harga_beli, jumlah_beli, satuan, harga_per_qty) VALUES
    ('Stiker Logo', 180000, 400, 'pcs', 450),
    ('Cup Injection 12 Oz + Tutup', 470000, 500, 'pcs', 940),
    ('Gula Putih', 17500, 1000, 'gram', 17.5),
    ('Air Galon AG', 6000, 20000, 'ml', 0.3),
    ('Nutrijell Kopi', 5750, 20, 'gram', 287.5),
    ('Nutrijell Leci', 5500, 15, 'gram', 366.6667),
    ('Cendol', 50000, 2500, 'gram', 20),
    ('Gula Merah Rengat', 102000, 3400, 'gram', 30),
    ('Carnation Susu Evaporasi', 18900, 380, 'ml', 49.7368),
    ('Indomilk Susu UHT', 22000, 950, 'ml', 23.1579),
    ('Bunga Telang Kering', 22500, 100, 'gram', 225),
    ('Lemon', 34798, 260, 'gram', 133.8385),
    ('Kunyit', 1000, 45, 'gram', 22.2222),
    ('Jahe', 8000, 200, 'gram', 40),
    ('Soda Polaris', 5600, 330, 'ml', 16.9697),
    ('Es Batu', 15000, 17000, 'ml', 0.8824),
    ('Nata De Coco', 10900, 642, 'gram', 16.9782),
    ('Selasih', 10000, 50, 'gram', 200),
    ('Longan', 34000, 31, 'pcs', 1096.7742),
    ('Pipet', 17000, 100, 'pcs', 170),
    ('Plastik Bening', 4750, 255, 'pcs', 18.6275),
    ('Plastik Hijau Biru', 4250, 255, 'pcs', 16.6667);


-- ============================================================
-- 3. PENGELUARAN (semua sesi belanja)
-- ============================================================
DROP TABLE IF EXISTS pengeluaran CASCADE;

CREATE TABLE pengeluaran (
    id SERIAL PRIMARY KEY,
    sesi VARCHAR(30) NOT NULL,
    tanggal DATE,
    nama_item VARCHAR(150) NOT NULL,
    harga NUMERIC(12, 2),
    qty VARCHAR(50),
    keterangan VARCHAR(200),
    status_uang VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO pengeluaran (sesi, tanggal, nama_item, harga, qty, keterangan, status_uang) VALUES
-- BELANJA 1
    ('BELANJA 1', '2026-02-27', 'Sunbay Evaporated Milk', 16800, '380 gram', NULL, NULL),
    ('BELANJA 1', '2026-02-27', 'Acaraki Golden Spark', 11400, NULL, NULL, NULL),
    ('BELANJA 1', '2026-02-27', 'Jeruk Lemon', 17361, '352 gram', '5480/100gr, disc 10%', NULL),
    ('BELANJA 1', '2026-02-27', 'Nutrijell Coffee', 6600, NULL, NULL, NULL),
    ('BELANJA 1', '2026-02-27', 'Nata De Coco Mini', 14100, NULL, NULL, NULL),
    ('BELANJA 1', '2026-02-27', 'Ultra Sari Asem Asli', 6100, NULL, NULL, NULL),
    ('BELANJA 1', '2026-02-27', 'Zoda', 5600, NULL, NULL, NULL),
    ('BELANJA 1', '2026-02-27', 'Parkir Pasar Buah Sudirman', 2000, NULL, NULL, 'Starla'),
    ('BELANJA 1', '2026-02-27', 'Bunga Telang', 22500, '100 gram', NULL, NULL),
-- BELANJA 2
    ('BELANJA 2', '2026-03-01', 'Cendol', 12000, '2 bungkus', NULL, 'Starla'),
    ('BELANJA 2', '2026-03-01', 'Gula Aren', 18000, '600 gram', NULL, NULL),
    ('BELANJA 2', '2026-03-01', 'Jamu', 25000, NULL, NULL, NULL),
    ('BELANJA 2', '2026-03-01', 'Cup 16 oz', 8000, '50 pcs', NULL, NULL),
    ('BELANJA 2', '2026-03-01', 'Tutup Cup', 4000, '50 pcs', NULL, NULL),
    ('BELANJA 2', '2026-03-01', 'Susu Evaporasi', 16000, '1 kaleng', NULL, NULL),
    ('BELANJA 2', '2026-03-01', 'Nutrijell Leci', 5000, '1 bungkus', NULL, NULL),
    ('BELANJA 2', '2026-03-01', 'Susu UHT Diamond', 22700, '1 botol', NULL, 'Maria'),
    ('BELANJA 2', '2026-03-01', 'Groovy Soda Water', 33250, '5 botol', NULL, NULL),
    ('BELANJA 2', '2026-03-01', 'Kunyit', 5000, '1.5 ons', NULL, NULL),
    ('BELANJA 2', '2026-03-01', 'Jahe', 7000, '2 ons', NULL, NULL),
    ('BELANJA 2', '2026-03-01', 'Parkir Pasar Buah 88', 4000, NULL, NULL, NULL),
    ('BELANJA 2', '2026-03-01', 'Es Batu', 4000, '2 bungkus', NULL, 'Hepryzal'),
-- BELANJA 3
    ('BELANJA 3', '2026-03-17', 'Logo Stiker', 23000, '1 lembar A3', '50 pcs', NULL),
    ('BELANJA 3', '2026-03-17', 'Gula Pasir', 17500, '1 kg', NULL, NULL),
    ('BELANJA 3', '2026-03-17', 'Jeruk Lemon', 20332, '340 gr', '100 gram = 5.980', NULL),
    ('BELANJA 3', '2026-03-17', 'Nata De Coco Inaco', 54500, '5 bks', '1 bks = 10.900', NULL),
    ('BELANJA 3', '2026-03-17', 'Kunyit', 1000, '49 gr', NULL, NULL),
    ('BELANJA 3', '2026-03-17', 'Selasih', 2000, NULL, NULL, NULL),
    ('BELANJA 3', '2026-03-17', 'Es Batu Kristal', 4000, '2 kantong', NULL, NULL),
    ('BELANJA 3', '2026-03-17', 'Leci Kaleng', 31000, NULL, NULL, 'Maria'),
    ('BELANJA 3', '2026-03-17', 'Cup Minuman', 18000, '1 pack isi 25', NULL, NULL),
    ('BELANJA 3', '2026-03-17', 'Tutup Cup', 8000, '1 pack isi 25', NULL, NULL),
    ('BELANJA 3', '2026-03-17', 'Nutrijell Kopi', 66000, '1 pack isi 12', NULL, NULL),
    ('BELANJA 3', '2026-03-17', 'Cendol', 5000, '1 bks', NULL, NULL),
    ('BELANJA 3', '2026-03-17', 'Nutrijell Leci', 66000, '1 pack isi 12', NULL, 'Hep'),
    ('BELANJA 3', '2026-03-17', 'Polaris Soda', 11200, '2 kaleng', NULL, NULL),
    ('BELANJA 3', '2026-03-17', 'Parkir Angel', 11000, NULL, NULL, 'Angel'),
    ('BELANJA 3', '2026-03-17', 'Gelas Takar', 11000, NULL, NULL, 'Starla'),
    ('BELANJA 3', '2026-03-17', 'Jahe', 7000, '2 ons', NULL, NULL),
    ('BELANJA 3', '2026-03-17', 'Gula Merah Rengat', 13000, '500gr', NULL, NULL),
    ('BELANJA 3', '2026-03-17', 'Susu Evaporasi + UHT', 37500, NULL, NULL, NULL),
-- BELANJA PO 1
    ('BELANJA PO 1', '2026-04-07', 'Pipet', 51000, '3 bks', '300 pcs', 'Uang Ange'),
    ('BELANJA PO 1', '2026-04-07', 'Naraya Longan', 136000, '4 kaleng', NULL, NULL),
    ('BELANJA PO 1', '2026-04-07', 'Koepoe Koepoe Pasta Pandan', 6500, '1 btl', NULL, NULL),
    ('BELANJA PO 1', '2026-04-07', 'Plastik Asoy Hijau Biru', 21250, '5 bks', NULL, NULL),
    ('BELANJA PO 1', '2026-04-07', 'Plastik Asoy Bening', 23750, '5 bks', NULL, NULL),
    ('BELANJA PO 1', '2026-04-07', 'UHT Indomilk', 264000, '12 btl', NULL, NULL),
    ('BELANJA PO 1', '2026-04-07', 'Lemon Kering', 72000, '500 gram', NULL, NULL),
    ('BELANJA PO 1', '2026-04-07', 'Parkir Pasar Buah Nangka', 3000, NULL, NULL, NULL),
    ('BELANJA PO 1', '2026-04-07', 'Stiker Logo', 180000, '400 pcs', NULL, NULL),
    ('BELANJA PO 1', '2026-04-07', 'Parkir Pasar Buah', 3000, NULL, NULL, NULL),
    ('BELANJA PO 1', '2026-04-08', 'Cup + Tutup', 470000, '500 pcs', NULL, NULL),
    ('BELANJA PO 1', '2026-04-09', 'Lemon', 34798, '635 gram', NULL, 'Uang Deposit'),
    ('BELANJA PO 1', '2026-04-09', 'Carnation Evaporasi', 378000, '20 kaleng', NULL, NULL),
    ('BELANJA PO 1', '2026-04-09', 'Gula Pasir', 17500, '1 kg', NULL, NULL),
    ('BELANJA PO 1', '2026-04-09', 'Parkir Pasar Buah', 2000, NULL, NULL, NULL),
    ('BELANJA PO 1', '2026-04-09', 'Jahe', 8000, '2 ons', NULL, 'Uang Starla'),
    ('BELANJA PO 1', '2026-04-09', 'Kunyit', 1000, '4,5 gram', NULL, NULL),
    ('BELANJA PO 1', '2026-04-09', 'Gula Aren', 102000, '3400 gram', NULL, NULL),
    ('BELANJA PO 1', '2026-04-09', 'Selasih Kupu Kupu', 10000, '50 gram', NULL, NULL),
    ('BELANJA PO 1', '2026-04-10', 'Tepung Tapioka Rose Brand', 12000, '1 kg', NULL, 'Uang Deposit'),
    ('BELANJA PO 1', '2026-04-10', 'Tepung Beras Rose Brand', 19200, '1 kg', NULL, NULL),
    ('BELANJA PO 1', '2026-04-10', 'Groovy Zoda', 39900, '6 botol', NULL, NULL),
    ('BELANJA PO 1', '2026-04-12', 'Cendol', 50000, '2500 gram', NULL, 'Uang Maria'),
    ('BELANJA PO 1', '2026-04-12', 'Es Batu', 15000, '17 kg', NULL, NULL),
-- BELANJA PO CENDOL
    ('BELANJA PO CENDOL', '2026-04-17', 'Jelly Kopi', 11500, '2 bks', NULL, 'Uang Ange'),
    ('BELANJA PO CENDOL', '2026-04-17', 'Jelly Cincau', 10000, '2 bks', NULL, NULL),
    ('BELANJA PO CENDOL', '2026-04-17', 'Sedotan', 34000, '2 bks', '200 pcs', NULL),
    ('BELANJA PO CENDOL', '2026-04-17', 'Biji Selasih', 10000, '1 pcs', '10 gram', NULL),
    ('BELANJA PO CENDOL', '2026-04-17', 'Admin MDR', 1000, NULL, NULL, NULL),
    ('BELANJA PO CENDOL', '2026-04-18', 'Cendol', 20000, '2 bks', NULL, 'Uang Starla'),
    ('BELANJA PO CENDOL', '2026-04-18', 'Cendol', 5000, '1 bks', 'Bks kecil', 'Uang Maria'),
    ('BELANJA PO CENDOL', '2026-04-18', 'Es Batu', 15000, '17 kg', NULL, 'Uang Maria'),
    ('BELANJA PO CENDOL', '2026-04-18', 'Admin BCA', 10000, NULL, NULL, 'Uang Starla'),
-- BELANJA PO 2
    ('BELANJA PO 2', NULL, 'Nutrijell Kopi', 60806, '12 pcs', '20gr 1 bks', 'Uang Starla'),
    ('BELANJA PO 2', NULL, 'Parkir Kurir Hypermart', 2000, NULL, NULL, NULL),
    ('BELANJA PO 2', NULL, 'Es Batu Hr Jumat', 8000, '4 ktg', '2rb 1 bks', NULL),
    ('BELANJA PO 2', NULL, 'Nutrijell Leci', 54000, '12 pcs', '15 gr 1 bks', 'Uang Ange'),
    ('BELANJA PO 2', NULL, 'Nutrijell Cincau', 54000, '12 pcs', '15 gr 1 bks', NULL),
    ('BELANJA PO 2', NULL, 'Parkir Toko Abadi Baru', 3000, NULL, NULL, NULL),
    ('BELANJA PO 2', NULL, 'Susu Ultramilk', 120000, '6 pcs', '20000/pcs', NULL),
    ('BELANJA PO 2', NULL, 'Susu Diamond', 75248, '4 pcs', '18812/pcs', NULL),
    ('BELANJA PO 2', NULL, 'Susu Diamond', 19890, '1 pcs', '19890/pcs', NULL),
    ('BELANJA PO 2', NULL, 'Susu Diamond', 17890, '1 pcs', '17890/pcs', NULL),
    ('BELANJA PO 2', '2026-05-06', 'Tutup Cup + Zip Lock', 13800, NULL, NULL, 'Uang Deposit'),
    ('BELANJA PO 2', '2026-05-06', 'Polaris Soda 14 Kaleng', 71489, NULL, NULL, NULL),
    ('BELANJA PO 2', '2026-05-07', 'Gula Merah', 21000, '700 gram', NULL, 'Uang Deposit'),
    ('BELANJA PO 2', '2026-05-07', 'Gula Pasir', 35000, '2 kg', NULL, 'Uang Deposit'),
    ('BELANJA PO 2', '2026-05-07', 'Lemon', 30140, '550 gram', NULL, 'Uang Deposit'),
    ('BELANJA PO 2', '2026-05-09', 'Jelly Plain', 13600, '30 gr, 2 bks', NULL, 'Uang Ange'),
    ('BELANJA PO 2', '2026-05-09', 'Jahe', 8000, NULL, NULL, 'Uang Starla'),
    ('BELANJA PO 2', '2026-05-09', 'Lemon', 10000, '200 gr', NULL, NULL),
    ('BELANJA PO 2', '2026-05-09', 'Parkir Pasar Buah', 2000, NULL, NULL, NULL),
    ('BELANJA PO 2', '2026-05-10', 'Kunyit', 2000, '100 gram', NULL, NULL),
    ('BELANJA PO 2', '2026-05-10', 'Es Batu', 15000, '17 kg', NULL, NULL),
    ('BELANJA PO 2', '2026-05-21', 'Susu Evaporasi Carnation', 67600, '4 kaleng', '16900/pcs', 'Uang Deposit'),
    ('BELANJA PO 2', '2026-05-22', 'Cendol', 15000, NULL, NULL, 'Uang Maria');


-- ============================================================
-- 4. KAS BP (Buku Kas / Ledger)
-- ============================================================
DROP TABLE IF EXISTS kas_bp CASCADE;

CREATE TABLE kas_bp (
    id SERIAL PRIMARY KEY,
    tanggal DATE,
    keterangan VARCHAR(200) NOT NULL,
    debit NUMERIC(12, 2) DEFAULT 0,
    kredit NUMERIC(12, 2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO kas_bp (tanggal, keterangan, debit, kredit) VALUES
    ('2026-02-23', 'Deposit 1 Angelina', 100000, 0),
    ('2026-02-23', 'Deposit 1 Starla', 100000, 0),
    ('2026-02-23', 'Deposit 1 Maria', 100000, 0),
    ('2026-02-23', 'Deposit 1 Hepryzal', 100000, 0),
    ('2026-02-27', 'Belanja 1', 0, 102460),
    ('2026-02-28', 'Bunga', 156.1, 0),
    ('2026-03-01', 'Belanja 2', 0, 164000),
    ('2026-03-17', 'Deposit 2 Angelina', 100000, 0),
    ('2026-03-17', 'Deposit 2 Starla', 100000, 0),
    ('2026-03-17', 'Deposit 2 Maria', 100000, 0),
    ('2026-03-17', 'Deposit 2 Hep', 100000, 0),
    ('2026-03-17', 'Belanja 3', 0, 407032),
    ('2026-03-31', 'Bunga', 396.3, 0),
    ('2026-04-01', 'Deposit 3 Angelina', 100000, 0),
    ('2026-04-01', 'Deposit 3 Starla', 100000, 0),
    ('2026-04-01', 'Deposit 3 Maria', 100000, 0),
    ('2026-04-04', 'Ongkir Celemek + Parkir', 0, 25000),
    ('2026-04-04', 'Deposit 3 Hepryzal', 100000, 0),
    ('2026-04-09', 'Star PO 1', 0, 430298),
    ('2026-04-10', 'Mar PO 1', 0, 71100),
    ('2026-04-23', 'Sisa Uang PO', 257000, 0),
    ('2026-04-30', 'Bunga', 393.31, 0),
    ('2026-05-06', 'Polaris, Tutup Cup, Plastik', 0, 85289),
    ('2026-05-07', 'Gula Merah, Putih, Lemon', 0, 86140),
    ('2026-05-11', 'Capcut Pro', 0, 16650),
    ('2026-05-14', 'Penjualan PO Batch 2', 1005000, 0),
    ('2026-05-14', 'Refund Uang Sania', 0, 45000),
    ('2026-05-15', 'Jahe, Lemon, Jelly Kopi', 0, 82806),
    ('2026-05-15', 'Jelly, Susu, Kunyit, Es Batu', 0, 376928),
    ('2026-05-21', 'Susu Evaporasi', 0, 67600),
    ('2026-05-22', 'Mar PO 2', 0, 15000),
    ('2026-05-25', 'Es Batu Starla', 0, 8000);


-- ============================================================
-- 5. PESANAN (PO BATCH 2 - Header)
-- ============================================================
DROP TABLE IF EXISTS pesanan CASCADE;

CREATE TABLE pesanan (
    id SERIAL PRIMARY KEY,
    sesi VARCHAR(30) NOT NULL,
    nomor_urut INTEGER,
    kelompok VARCHAR(100),
    nama_pemesan VARCHAR(100) NOT NULL,
    total_bayar NUMERIC(12, 2),
    status_pembayaran VARCHAR(20),
    metode_pembayaran VARCHAR(50),
    no_hp VARCHAR(20),
    kelompok_antar VARCHAR(50),
    alamat_pengiriman VARCHAR(300),
    catatan VARCHAR(200),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO pesanan (sesi, nomor_urut, kelompok, nama_pemesan, total_bayar, status_pembayaran, metode_pembayaran, no_hp, kelompok_antar, alamat_pengiriman, catatan) VALUES
-- ORDERAN HARI MINGGU
    ('MINGGU', 1, NULL, 'Yulia', 102000, 'Lunas', 'BCA (Yulia Yani)', '08992188599', NULL, 'Pick up - 15.30 Jemput', 'Es jadikan satu plastik'),
    ('MINGGU', 2, NULL, 'Ce Helvi', 57000, 'Lunas', 'BCA', NULL, 'Starla', 'Riau Ujung', NULL),
    ('MINGGU', 3, NULL, 'Candice', 68000, 'Lunas', 'BCA (Candice)', '082392073871', NULL, 'Jl. Angkasa No. 36G', 'Gula dipisah'),
    ('MINGGU', 4, NULL, 'Hans Anderson', 30000, 'Lunas', 'BCA', '081261146563', 'Starla', 'Jalan Pemudi Gang Kukuh', NULL),
    ('MINGGU', 5, NULL, 'Ce Viony', 30000, 'Lunas', 'BCA', NULL, NULL, 'Riau', NULL),
    ('MINGGU', 6, NULL, 'Ce Angelina', 34000, 'Lunas', 'BCA', '082382228081', NULL, 'Jalan Senapelan No 32 (Belakang Ucha Parfum, garasi hijau)', NULL),
    ('MINGGU', 7, NULL, 'Kristin', 126000, 'Lunas', 'Cash (Sama Ange)', '081993835418', NULL, 'Toko Aki Kawan Sejati (Jalan Nangka)', NULL),
    ('MINGGU', 8, NULL, 'Cecilia Liem', 24000, 'Lunas', 'BCA', NULL, NULL, 'Dekat Rumah Starla', NULL),
    ('MINGGU', 9, NULL, 'AM', 15000, 'Lunas', 'BCA', '081478671528', NULL, 'Jalan Riau Komp Teladan No 25B', NULL),
    ('MINGGU', 10, NULL, 'Hariyati', 108000, 'Lunas', 'Cash (Sama Ange)', '085213068237', NULL, 'Toko Aki Berdikari (Jalan Nangka)', NULL),
    ('MINGGU', 11, NULL, 'Silvia', 17000, 'Lunas', 'Cash (Sama Starla)', NULL, NULL, NULL, NULL),
    ('MINGGU', 12, NULL, 'Suryadi', 12000, 'Lunas', 'BCA', '085923701522', NULL, 'Soekarno Hatta', NULL),
    ('MINGGU', 13, NULL, 'Kuma', 27000, 'Lunas', 'Cash', NULL, NULL, 'Rumah Starla', NULL),
    ('MINGGU', 14, NULL, 'Rizzo', 47000, 'Lunas', 'BCA', NULL, 'Starla', 'Starla yang antar', NULL),
-- ORDERAN HARI JUMAT
    ('JUMAT', 1, 'Accounting', 'Kak Tia', 15000, 'Lunas', 'BCA', NULL, NULL, 'Kantor Primanusa', NULL),
    ('JUMAT', 1, 'Accounting', 'Kak Siti', 15000, 'Lunas', 'BCA', NULL, NULL, 'Kantor Primanusa', NULL),
    ('JUMAT', 1, 'Accounting', 'Kak Maya', 15000, 'Lunas', 'BCA', NULL, NULL, 'Kantor Primanusa', NULL),
    ('JUMAT', 1, 'Accounting', 'Kak Linda', 30000, 'Lunas', 'BCA', NULL, NULL, 'Kantor Primanusa', NULL),
    ('JUMAT', 1, 'Accounting', 'Ce Helvi', 12000, 'Lunas', 'BCA', NULL, NULL, 'Kantor Primanusa', NULL),
    ('JUMAT', 2, 'Marketing', 'Nurul Mut Mainnah', 15000, 'Lunas', 'BCA', NULL, NULL, 'Kantor Primanusa', NULL),
    ('JUMAT', 3, 'Logistik', 'Jaysen', 47000, 'Lunas', 'BCA', NULL, NULL, 'Kantor Primanusa', NULL),
    ('JUMAT', 4, 'Pajak', 'Rita', 15000, 'Lunas', 'BCA', NULL, NULL, 'Kantor Primanusa', NULL),
    ('JUMAT', 4, 'Pajak', 'Vany', 15000, 'Lunas', 'BCA', NULL, NULL, 'Kantor Primanusa', NULL),
    ('JUMAT', 4, 'Pajak', 'Ko Ahen', 15000, 'Lunas', 'BCA', NULL, NULL, 'Kantor Primanusa', NULL),
    ('JUMAT', 4, 'Pajak', 'Ce Nely', 15000, 'Lunas', 'BCA', NULL, NULL, 'Kantor Primanusa', NULL),
    ('JUMAT', 4, 'Pajak', 'Wati', 15000, 'Lunas', 'BCA', NULL, NULL, 'Kantor Primanusa', NULL),
    ('JUMAT', 5, 'Admin HRD', 'Kak Della', 15000, 'Lunas', 'Qris', NULL, NULL, 'Kantor Primanusa', NULL),
    ('JUMAT', 6, NULL, 'Yunita', 24000, 'Lunas', 'BCA', NULL, NULL, 'GoSend', NULL);


-- ============================================================
-- 6. ITEM PESANAN (PO BATCH 2 - Detail)
-- ============================================================
DROP TABLE IF EXISTS item_pesanan CASCADE;

CREATE TABLE item_pesanan (
    id SERIAL PRIMARY KEY,
    pesanan_id INTEGER REFERENCES pesanan(id),
    nama_minuman VARCHAR(100) NOT NULL,
    qty INTEGER,
    harga_per_item NUMERIC(10, 2),
    subtotal NUMERIC(12, 2),
    catatan VARCHAR(200),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO item_pesanan (pesanan_id, nama_minuman, qty, harga_per_item, subtotal, catatan) VALUES
-- Yulia (pesanan_id=1)
    (1, 'Cendol Sultan Cincau', 2, 15000, 30000, 'Es jadikan satu plastik'),
    (1, 'Cendol Sultan Kopi', 2, 15000, 30000, NULL),
    (1, 'Kunyit Soda Nusantara', 2, 15000, 30000, NULL),
    (1, 'Telang Citrus Breeze', 1, 12000, 12000, NULL),
-- Ce Helvi (pesanan_id=2)
    (2, 'Kunyit Soda Nusantara', 1, 15000, 15000, NULL),
    (2, 'Cendol Sultan Kopi', 1, 15000, 15000, NULL),
    (2, 'Telang Citrus Breeze', 1, 12000, 12000, NULL),
    (2, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
-- Candice (pesanan_id=3)
    (3, 'Telang Citrus Breeze', 3, 12000, 36000, 'Gula dipisah'),
    (3, 'Cendol Sultan Kopi', 2, 15000, 30000, 'Gula dipisah'),
    (3, 'Plastik', 2, 1000, 2000, '2 pcs plastik'),
-- Hans Anderson (pesanan_id=4)
    (4, 'Cendol Sultan Kopi', 1, 15000, 15000, NULL),
    (4, 'Kunyit Soda Nusantara', 1, 15000, 15000, NULL),
-- Ce Viony (pesanan_id=5)
    (5, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
    (5, 'Kunyit Soda Nusantara', 1, 15000, 15000, NULL),
-- Ce Angelina (pesanan_id=6)
    (6, 'Telang Citrus Breeze', 2, 12000, 24000, NULL),
    (6, 'Longan', 2, 5000, 10000, NULL),
-- Kristin (pesanan_id=7)
    (7, 'Cendol Sultan Kopi', 3, 15000, 45000, NULL),
    (7, 'Kunyit Soda Nusantara', 3, 15000, 45000, NULL),
    (7, 'Telang Citrus Breeze', 3, 12000, 36000, NULL),
-- Cecilia Liem (pesanan_id=8)
    (8, 'Telang Citrus Breeze', 2, 12000, 24000, NULL),
-- AM (pesanan_id=9)
    (9, 'Telang Citrus Breeze', 1, 12000, 12000, NULL),
    (9, 'Longan', 1, 3000, 3000, NULL),
-- Hariyati (pesanan_id=10)
    (10, 'Cendol Sultan Kopi', 4, 15000, 60000, NULL),
    (10, 'Telang Citrus Breeze', 4, 12000, 48000, NULL),
-- Silvia (pesanan_id=11)
    (11, 'Telang Citrus Breeze', 1, 12000, 12000, NULL),
    (11, 'Longan', 1, 5000, 5000, NULL),
-- Suryadi (pesanan_id=12)
    (12, 'Telang Citrus Breeze', 1, 12000, 12000, NULL),
-- Kuma (pesanan_id=13)
    (13, 'Cendol Sultan Kopi', 1, 15000, 15000, NULL),
    (13, 'Telang Citrus Breeze', 1, 12000, 12000, NULL),
-- Rizzo (pesanan_id=14)
    (14, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
    (14, 'Kunyit Soda Nusantara', 1, 15000, 15000, NULL),
    (14, 'Telang Citrus Breeze', 1, 12000, 12000, 'Less sugar'),
    (14, 'Longan', 1, 5000, 5000, NULL),
-- JUMAT: Kak Tia (pesanan_id=15)
    (15, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
-- Kak Siti (pesanan_id=16)
    (16, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
-- Kak Maya (pesanan_id=17)
    (17, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
-- Kak Linda (pesanan_id=18)
    (18, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
    (18, 'Cendol Sultan Kopi', 1, 15000, 15000, NULL),
-- Ce Helvi Jumat (pesanan_id=19)
    (19, 'Telang Citrus Breeze', 1, 12000, 12000, NULL),
-- Nurul (pesanan_id=20)
    (20, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
-- Jaysen (pesanan_id=21)
    (21, 'Telang Citrus Breeze', 1, 12000, 12000, NULL),
    (21, 'Longan', 1, 5000, 5000, NULL),
    (21, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
    (21, 'Cendol Sultan Kopi', 1, 15000, 15000, NULL),
-- Rita (pesanan_id=22)
    (22, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
-- Vany (pesanan_id=23)
    (23, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
-- Ko Ahen (pesanan_id=24)
    (24, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
-- Ce Nely (pesanan_id=25)
    (25, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
-- Wati (pesanan_id=26)
    (26, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
-- Kak Della (pesanan_id=27)
    (27, 'Cendol Sultan Cincau', 1, 15000, 15000, NULL),
-- Yunita (pesanan_id=28)
    (28, 'Telang Citrus Breeze', 2, 12000, 24000, NULL);

