Berikut penjelasan singkat dan terstruktur untuk file:
dart_application_1.dart

Ringkasan
Program itu adalah permainan tebak angka (CLI) dengan pilihan tingkat kesulitan.
Pengguna memilih tingkat, lalu menebak angka acak sampai habis kesempatan atau benar.
Program menyediakan umpan balik (lebih besar / lebih kecil) dan opsi main lagi.
Alur utama (main)

Cetak judul permainan.
- Buat Random rng untuk angka acak.
- Loop utama while(true) untuk mengulang permainan sampai pemain memilih keluar.
- Tampilkan pilihan tingkat: 1 (Mudah), 2 (Sedang), 3 (Sulit), 0 (Keluar).
- Baca input tingkat menggunakan _readLine().
- Jika input '0' → cetak pesan terima kasih dan keluar dari loop.
- Tentukan parameter permainan berdasarkan tingkat
  - Mudah: max = 50, maxAttempts = 8
  - Sedang: max = 100, maxAttempts = 7
  - Sulit: max = 500, maxAttempts = 6
  - Pilihan lain → tampilkan "Pilihan tidak valid." dan ulangi pemilihan tingkat.
- Pilih angka target acak: rng.nextInt(max) + 1 (rentang 1..max).
- Beri tahu pemain rentang dan jumlah kesempatan.
- Loop tebakan hingga attempts mencapai maxAttempts:
  - Tambah attempts.
  - Baca tebakan lewat _readInt() (memaksa input integer).
  - Jika tebakan sama dengan target → tampilkan kemenangan dan keluar loop tebakan.
  - Jika tebakan < target → tampilkan "Lebih besar."
  - Jika tebakan > target → tampilkan "Lebih kecil."
  - Tampilkan jumlah kesempatan tersisa bila ada.
- Jika kehabisan kesempatan tanpa menang → tampilkan angka benar.
- Tanyakan apakah ingin main lagi (y/n). Jika bukan 'y' → keluar loop utama.

Fungsi pembantu
- String _readLine(String prompt)
  - Menulis prompt ke stdout tanpa newline, membaca input dari stdin.
  - Jika stdin.readLineSync() mengembalikan null, fungsi mengembalikan string kosong.
- int _readInt(String prompt)
  - Loop sampai input yang valid (parseable ke int) diterima.
  - Memanggil _readLine(prompt), trim, lalu int.tryParse. Jika berhasil kembalikan int.
  - Jika tidak valid, tampilkan pesan error dan ulangi.

Catatan / perbaikan potensial
- _readLine mengembalikan '' saat EOF; _readInt akan terus looping jika EOF terjadi. Bisa tangani EOF dengan keluar atau melempar exception.
- Tidak ada validasi bahwa tebakan berada di rentang 1..max — bisa ditambahkan.
- Nilai default max dan maxAttempts diinisialisasi dua kali untuk tingkat 1; efektif tapi redundant.
- Pesan dan I/O sudah eksplisit; bisa ditambahkan sanitasi input lebih kuat atau batas waktu.
