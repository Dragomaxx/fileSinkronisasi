

```batch
@echo off
setlocal
```
Baris ini mengatur agar perintah echo dalam skrip batch tidak ditampilkan di jendela perintah saat dijalankan. Kemudian, `setlocal` digunakan untuk memulai ruang lingkup lokal di mana semua perubahan variabel lingkungan yang dilakukan dalam skrip hanya berlaku dalam sesi eksekusi skrip ini dan tidak akan mempengaruhi lingkungan luar setelah skrip selesai.

```batch
set "source_folder=D:\dataFile"
set "destination_folder=F:\dataFile"
```
Dua variabel lingkungan, `source_folder` dan `destination_folder`, dideklarasikan dan diinisialisasi dengan jalur folder sumber dan tujuan. Ini memungkinkan Anda untuk dengan mudah mengubah folder sumber dan tujuan tanpa harus mengedit secara langsung dalam seluruh skrip.

```batch
call :syncFolders "%source_folder%" "%destination_folder%"
```
Ini memanggil subrutin `syncFolders` dengan memberikan jalur folder sumber dan tujuan sebagai argumen. Penggunaan `call` digunakan untuk memanggil subrutin dalam skrip batch.

```batch
set "source_folder=F:\dataFile"
set "destination_folder=D:\dataFile"
```
Ini adalah pengaturan ulang variabel `source_folder` dan `destination_folder` dengan nilai yang berbeda. Subrutin `syncFolders` akan dipanggil lagi dengan folder yang berkebalikan sebagai sumber dan tujuan.

```batch
call :syncFolders "%source_folder%" "%destination_folder%"
```
Pemanggilan subrutin `syncFolders` dengan folder sumber dan tujuan yang telah diubah.

```batch
echo Sinkronisasi selesai.
```
Ini mencetak pesan "Sinkronisasi selesai." di jendela perintah untuk menandakan bahwa operasi sinkronisasi telah selesai.

```batch
endlocal
exit /b
```
`endlocal` digunakan untuk mengakhiri ruang lingkup lokal yang dimulai dengan `setlocal`. `exit /b` digunakan untuk keluar dari skrip batch dengan mengembalikan kontrol ke pemanggil skrip (misalnya, jendela perintah) dan `/b` menunjukkan agar hanya keluar dari subrutin, bukan dari skrip utama.

```batch
:syncFolders
robocopy %1 %2 /E /ZB /COPY:DAT /XO /XD node_modules /MT:12
exit /b
```
Ini adalah definisi subrutin `syncFolders`. Pada baris pertama (`:syncFolders`), subrutin diberi label dengan nama "syncFolders". Subrutin ini menggunakan utilitas `robocopy` untuk melakukan operasi sinkronisasi antara folder sumber dan tujuan. Berikut adalah opsi yang digunakan dalam perintah `robocopy`:

- `%1` dan `%2` adalah argumen yang dilewatkan ke subrutin dan mewakili jalur folder sumber dan tujuan.
- `/E` menunjukkan untuk menyalin semua subfolder, termasuk kosong.
- `/ZB` memastikan copy bypass jika akses ditolak, dan menggunakan hak istimewa Backup.
- `/COPY:DAT` menginstruksikan untuk menyalin atribut Data, Waktu, dan Atribut (tetapi bukan Atribut yang tersembunyi).
- `/XO` menunjukkan untuk menyalin hanya file yang lebih baru atau berbeda dari yang ada di folder tujuan.
- `/XD node_modules` mengecualikan folder "node_modules" dari operasi sinkronisasi.
- `/MT:12` memungkinkan `robocopy` untuk menggunakan 12 thread untuk mempercepat proses.

Kemudian, `exit /b` digunakan untuk mengakhiri subrutin dan kembali ke tempat pemanggil subrutin.

Jadi, secara keseluruhan, skrip ini melakukan operasi sinkronisasi antara dua set folder yang berbeda menggunakan `robocopy` dan mencetak pesan saat selesai. Subrutin `syncFolders` adalah bagian utama yang melakukan pekerjaan aktual operasi sinkronisasi.
