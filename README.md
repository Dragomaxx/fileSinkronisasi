program sederhan untuk melakukan file sinkronisasi


%source_folder% dan %destination_folder%: Ini adalah variabel yang Anda tetapkan sebelumnya dengan nilai path dari folder sumber dan tujuan. Variabel ini digunakan untuk memberikan alamat folder yang akan disalin dan di mana hasil salinannya akan ditempatkan.

/s: Opsi ini menyertakan subfolder dalam proses penyalinan. Ini akan menyalin semua file dan subfolder dari folder sumber, termasuk subfolder kosong.

/e: Opsi ini juga menyertakan subfolder dalam proses penyalinan, bahkan subfolder kosong. Namun, ini juga akan menyalin folder kosong di dalam folder sumber.

/d: Opsi ini hanya akan menyalin file yang lebih baru dari sumber daripada yang ada di tujuan. Ini memungkinkan Anda untuk melakukan salinan inkremental berdasarkan tanggal modifikasi.

/i: Opsi ini memungkinkan xcopy untuk beroperasi dalam mode "interaktif". Jika tujuan adalah sebuah direktori yang belum ada, perintah akan meminta konfirmasi untuk membuat direktori tujuan.
