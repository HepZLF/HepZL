import csv
import re
import os

def clean_currency(value):
    if not value: return 0
    # Remove 'Rp', '.', and handle potential format
    clean = re.sub(r'[^\d]', '', str(value))
    return int(clean) if clean else 0

def convert_to_sql():
    base_path = "/home/hep/Documents/ASW"
    sql_output = []

    # 1. PENGELUARAN
    sql_output.append("-- Data Pengeluaran")
    with open(f"{base_path}/BP - PENGELUARAN.csv", 'r') as f:
        reader = csv.reader(f)
        next(reader) # skip headers
        for row in reader:
            # Based on file structure: [Tanggal, Keterangan, Debit, Kredit]
            if len(row) >= 9:
                tgl, ket, deb, kre = row[6], row[7], row[8], row[9]
                if tgl: # only insert valid rows
                    sql_output.append(f"INSERT INTO pengeluaran (tanggal, keterangan, debit, kredit) VALUES ('{tgl}', '{ket}', {clean_currency(deb)}, {clean_currency(kre)});")

    # 2. PO BATCH 2
    sql_output.append("\n-- Data PO BATCH 2")
    with open(f"{base_path}/BP - PO BATCH 2.csv", 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            sql_output.append(f"INSERT INTO po_batch_2 (no_pemesan, nama_pelanggan, qty, nama_minuman, catatan, nominal_pembayaran, metode_pembayaran, no_hp, kelompok_antar, pengantaran_jemput) VALUES ('{row['No']}', 'N/A', {row['Qty'] or 0}, '{row['Nama Minuman']}', '{row['Catatan']}', {clean_currency(row['Nominal Pembayaran'])}, '{row['Metode Pembayaran']}', '{row['No Hp']}', '{row['Kelompok Antar']}', '{row['Pengantaran / Jemput']}');")

    # 3. PENJUALAN (simplified logic)
    sql_output.append("\n-- Data Penjualan")
    with open(f"{base_path}/PO BATCH 1 - Laporan Penjualan.csv", 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            sql_output.append(f"INSERT INTO penjualan (no_transaksi, nama_pelanggan, produk, jumlah, harga_satuan, total_harga, alamat, no_hp, status, catatan) VALUES ('{row['No']}', '{row['Nama Pelanggan']}', '{row['Produk']}', {row['Jumlah'] or 0}, {clean_currency(row[' Harga '])}, {clean_currency(row[' Jumlah '])}, '{row['Alamat']}', '{row['No HP']}', '{row['Status']}', '{row['Catatan']}');")

    with open(f"{base_path}/import_data.sql", "w") as f:
        f.write("\n".join(sql_output))

convert_to_sql()
print("SQL file generated at /home/hep/Documents/ASW/import_data.sql")
