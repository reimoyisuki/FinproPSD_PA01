# LED Dot Matrix Controller - FinproPSD_PA01
Proyek Akhir Praktikum PSD - Kelompok PA01

- Farhan Ramadhani Zakiyyandi
- Arsinta Kirana Nisa
- Raka Arrayan Muttaqien
- Salim


## Latar belakang

LED Dot Matrix Controller adalah sebuah kode yang dirancang untuk mengontrol tampilan karakter pada layar LED dot-matrix 8x8. Kode ini menerima input berupa sinyal clock (clk), karakter ASCII (char_in), dan sinyal matrix_ready, kemudian menghasilkan pola kolom matriks (column_out) yang sesuai dengan karakter tersebut. Selain itu, controller ini juga menyediakan sinyal untuk memproses karakter berikutnya (next_char) serta menandakan status output_ready. Di dalamnya, terdapat matriks penyimpanan pola visual yang telah diinisialisasi, yang berfungsi agar setiap karakter ASCII diterjemahkan langsung ke dalam pola tampilan yang siap dikirim ke dot-matrix.

Cara kerja kontroler ini diatur oleh sebuah state machine dengan tiga status utama yaitu Idle, LoadCharacter, dan OutputColumn. Status Idle menunggu input karakter baru, LoadCharacter bertugas memuat pola karakter ke dalam memori, sementara OutputColumn bertanggung jawab mengirim pola tersebut ke dot-matrix secara bertahap kolom per kolom.


## CARA KERJA

LED Dot Matrix Controller bekerja dengan menerjemahkan karakter ASCII yang dimasukkan menjadi pola visual yang ditampilkan pada matriks LED 8x8. Sistem ini menggunakan state machine dengan tiga keadaan utama: Idle, LoadCharacter, dan OutputColumn. Pada keadaan Idle, Controller menunggu sinyal matrix_ready dan karakter input yang valid (char_in). Setelah menerima input, sistem beralih ke keadaan LoadCharacter untuk mengambil pola kolom karakter dari memori berdasarkan tabel ASCII yang telah didefinisikan.

Setelah pola karakter diambil, sistem memasuki keadaan OutputColumn, di mana setiap kolom pola dikirimkan secara berurutan ke matriks LED. Proses ini diatur oleh sinyal clock, yang berfungsi untuk memastikan  bahwa kolom-kolom tersebut dinyalakan secara bergantian,Siklus ini berulang setiap kali sinyal baru diterima.

## Cara Penggunaan

Untuk menggunakan LED Dot Matrix Controller yang telah diprogram dengan ModelSim dan VSCode, pengguna perlu memasukkan input berupa karakter atau simbol yang ingin ditampilkan pada matriks LED. Input ini berupa kode ASCII yang diterjemahkan oleh sistem untuk menghasilkan pola pada matriks LED. 

Setelah itu, output yang dihasilkan adalah matriks LED 8x8, yang menggambarkan karakter atau simbol yang diminta. Output ini dapat dilihat melalui simulasi di ModelSim. Ketika simulasi berjalan dengan sukses, pola yang muncul di layar simulasi ModelSim akan mencocokkan tampilan yang diinginkan pada matriks LED. Dengan menggunakan input berupa kode ASCII yang tepat, pengguna dapat melihat simbol atau teks yang sesuai ditampilkan secara visual pada output matriks LED.

## STATE DIAGRAM



## TESTING & RESULT
