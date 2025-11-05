1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget Tree (Pohon Widget) adalah sebutan untuk seluruh struktur hierarki dari widget-widget yang disusun.

Hubungan Parent-Child (Induk-Anak):
* Parent (Induk): Adalah widget yang membungkus atau berisi widget lain. Contoh di kode: `Column` adalah parent dari `Row` dan `Center`.
* Child (Anak): Adalah widget yang dibungkus atau berada di dalam widget lain. Contoh: `Text` adalah child dari `AppBar`.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
* `MyHomePage` (Custom): Widget buatan sendiri yang menjadi "halaman" utama.
* `InfoCard` (Custom): Widget buatan untuk menampilkan kartu info (NPM, Nama, Kelas).
* `ItemCard` (Custom): Widget buatan untuk tombol-tombol di grid (All Products, dll.).
* `StatelessWidget`: Tipe widget dasar untuk semua widget custom, yang berarti tampilannya tidak bisa berubah dari dalam dirinya sendiri.
* `Scaffold`: Kerangka dasar halaman. Ini yang menyediakan "kanvas" untuk meletakkan `AppBar` dan `body`.
* `AppBar`: Bilah (bar) aplikasi di bagian atas yang menampilkan judul.
* `Text`: Widget paling dasar untuk menampilkan teks.
* `TextStyle`: Digunakan di dalam `Text` untuk mengatur gaya (warna, ketebalan, ukuran font).
* `Theme`: Digunakan untuk mengakses skema warna aplikasi secara global (misal: `Theme.of(context).colorScheme.primary`).
* `Padding`: Memberikan jarak (ruang kosong) di sekeliling widget `child`-nya.
* `Column`: Menyusun widget-widget `children`-nya secara vertikal (dari atas ke bawah).
* `Row`: Menyusun widget-widget `children`-nya secara horizontal (dari kiri ke kanan).
* `SizedBox`: Sebuah kotak kosong yang tak terlihat. Biasanya dipakai untuk memberi jarak/spasi antar widget (misal: `const SizedBox(height: 16.0)`).
* `Center`: Mendorong `child`-nya agar berada persis di tengah-tengah area yang tersedia.
* `GridView` (via `GridView.count`): Menyusun widget-widget `children`-nya dalam format kotak-kotak (grid). `count` menentukan jumlah kolom.
* `Card`: Membuat sebuah kotak dengan desain Material (sedikit terangkat, ada bayangan, dan sudut melengkung). Digunakan di dalam `InfoCard`.
* `Container`: Widget "kotak serbaguna". Bisa dipakai untuk memberi padding, margin, warna latar, ukuran, dll. (Digunakan di `InfoCard` dan `ItemCard`).
* `MediaQuery`: Digunakan untuk mendapatkan informasi tentang perangkat, seperti ukuran layar (dipakai di `InfoCard` untuk `MediaQuery.of(context).size.width`).
* `Material`: "Kertas" dasar dari Material Design. Dipakai di `ItemCard` untuk memberi warna latar (`color`) dan sudut melengkung (`borderRadius`).
* `InkWell`: Membuat `child`-nya (dalam hal ini `Container` di `ItemCard`) bisa ditekan (tappable) dan memberikan efek riak air (ripple effect) saat disentuh.
* `ScaffoldMessenger`: Pengelola untuk menampilkan notifikasi singkat di bagian bawah layar, seperti `SnackBar`.
* `SnackBar`: Notifikasi pesan yang muncul sementara di bagian bawah (misal: "Kamu telah menekan tombol...").
* `Icon`: Untuk menampilkan ikon (misal: `Icons.list`).

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
`MaterialApp` adalah widget inti yang membungkus seluruh aplikasi. Widget ini tidak ada di file `MyHomePage.dart`, tapi pasti ada di file `main.dart` yang memanggil `MyHomePage`.

Fungsinya:
1.  Menyediakan Tema: `MaterialApp` yang mendefinisikan `ThemeData` (skema warna, jenis font, dll.) untuk seluruh aplikasi. Inilah alasan mengapa bisa memanggil `Theme.of(context).colorScheme.primary` di `AppBar`; `MaterialApp` yang menyediakannya dari "atas" pohon widget.
2.  Manajemen Navigasi (Halaman): Ia mengelola tumpukan halaman (disebut "routes"). Saat pindah dari satu halaman ke halaman lain (`Navigator.push`), `MaterialApp` yang mengaturnya.
3.  Menentukan Halaman `home`: Ia memberi tahu Flutter halaman mana yang harus ditampilkan pertama kali saat aplikasi dibuka.

Mengapa sering jadi root?
Karena `MaterialApp` menyediakan semua *konteks* dan *layanan* dasar (seperti tema, navigasi, dan info media) yang dibutuhkan oleh widget-widget Material Design lainnya (`Scaffold`, `AppBar`, `Card`, dll.) untuk berfungsi dengan benar. Tanpa `MaterialApp` sebagai pembungkus terluar, sebagian besar widget di aplikasi akan error.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
* `StatelessWidget` (Widget Statis)
    * Apa itu? Widget yang immutable.
    * Kapan dipakai? Saat tampilan widget hanya bergantung pada konfigurasi awal yang dimasukkan ke dalamnya.
    * Contoh di kode: `InfoCard`. Sebuah `InfoCard` dibuat dengan `title` dan `content`. Setelah dibuat, `InfoCard` itu tidak akan pernah mengubah `title` atau `content`-nya sendiri. 

* `StatefulWidget` (Widget Dinamis)
    * Apa itu? Widget yang mutable selama aplikasi berjalan.
    * Bagaimana bisa berubah? Ia memiliki objek internal khusus yang disebut `State`. "State" adalah data/informasi yang bisa berubah.
    * Kapan dipakai? Saat tampilan widget perlu berubah berdasarkan interaksi pengguna (misal: mengetik di form, mencentang checkbox, menekan tombol counter) atau data yang masuk (misal: data dari internet).
    * Contoh: Jika ingin membuat counter di mana angka bertambah setiap kali tombol ditekan, maka harus pakai `StatefulWidget`. Angka (misal: `int count = 0;`) akan disimpan di dalam `State`. Saat tombol ditekan, fungsi `setState(() { count++; })` dipanggil. Memanggil `setState` akan memberi tahu Flutter untuk menjalankan ulang metode `build()` dengan nilai `count` yang baru.

Kapan memilih?
* Pilih `StatelessWidget` jika halaman atau komponen hanya untuk menampilkan data yang tidak berubah (seperti `InfoCard`, `ItemCard`, atau `MyHomePage` di kodemu saat ini).
* Pilih `StatefulWidget` jika perlu mengelola data yang berubah di dalam widget itu sendiri (seperti formulir input, animasi, atau tombol like).

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
`BuildContext` (yang biasa dinamai `context`) adalah parameter yang selalu ada di setiap metode `build(BuildContext context)`. Secara sederhana, `BuildContext` adalah "alamat" atau "lokasi" dari sebuah widget di dalam Widget Tree.

Mengapa penting?
`BuildContext` adalah cara bagi sebuah widget untuk berinteraksi dengan "lingkungan" di sekitarnya, terutama dengan parent atau ancestornya di dalam pohon.

Bagaimana penggunaannya di metode `build`?
Tidak digunakan secara langsung, tetapi diserahkan ke method lain untuk "mencari sesuatu":
1.  Mencari Tema:
    * `Theme.of(context)`
2.  Mencari Ukuran Layar:
    * `MediaQuery.of(context)`
3.  Mencari `Scaffold` untuk `SnackBar`:
    * `ScaffoldMessenger.of(context)`

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
* Hot Reload (Muat Ulang Instan)
    * Apa yang dilakukan? Menyuntikkan kode baru yang disimpan ke dalam aplikasi yang sedang berjalan tanpa restart aplikasi.
    * Bagaimana? Flutter hanya menjalankan ulang metode `build()` dari widget yang berubah dan widget di bawahnya.
    * Kelebihan: Sangat cepat.
    * Yang Penting: State aplikasi tetap terjaga! Jika sedang mengisi formulir atau berada di halaman ketiga, maka akan tetap di sana dengan data yang sudah terisi.
    * Kapan dipakai? 95% waktu development. Dipakai untuk mengubah UI, layout, warna, dan logika di dalam method.

* Hot Restart (Mulai Ulang Instan)
    * Apa yang dilakukan? Mematikan aplikasi dan memulainya lagi dari awal (menjalankan ulang dari `main()`).
    * Bagaimana? Ini membangun ulang seluruh widget tree dari awal.
    * Kekurangan: Lebih lambat dari Hot Reload.
    * Yang Penting: State aplikasi hilang/direset! Aplikasi akan kembali ke halaman `home` seolah-olah baru dibuka.
    * Kapan dipakai? Saat mengubah sesuatu yang tidak bisa di-handle Hot Reload.