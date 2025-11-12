<details>
<Summary><b>Tugas 7</b></Summary>
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
</details>

<details>
<Summary><b>Tugas 8</b></Summary>

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Perbedaan utama terletak pada pengelolaan tumpukan (stack) navigasi.

`Navigator.push()`
  * Mekanisme: Metode ini menambahkan halaman baru di atas tumpukan. Halaman sebelumnya tetap ada di tumpukan, memungkinkan pengguna untuk kembali.
  * Contoh dalam Kode saya:
    ```
    // [lib/widgets/news_card.dart]
    onTap: () {
      // ...
      if (item.name == "Add Product") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductFormPage()),
        );
      }
    },
    ```
  * Kasus Penggunaan (Sesuai Kode): Saat pengguna berada di `MyHomePage` dan menekan kartu "Add Product", aplikasi akan membuka `ProductFormPage`. Pengguna diharapkan dapat menekan tombol "Back" (yang otomatis muncul di `AppBar`) untuk kembali ke `MyHomePage`.

`Navigator.pushReplacement()`
  * Mekanisme: Metode ini mengganti halaman saat ini dengan halaman baru. Halaman saat ini (yang memanggil navigasi) akan dihapus dari tumpukan, sehingga pengguna tidak dapat kembali ke halaman tersebut.
  * Contoh dalam Kode saya:
    ```
    // [lib/widgets/left_drawer.dart]
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    },
    ```
  * Kasus Penggunaan (Sesuai Kode): saya menggunakan ini untuk navigasi dari `LeftDrawer`. Tujuannya adalah untuk mencegah penumpukan halaman yang tidak perlu. Jika pengguna berada di `ProductFormPage` lalu membuka drawer dan menekan "Home", aplikasi akan mengganti `ProductFormPage` dengan `MyHomePage`. Menekan tombol "Back" dari `MyHomePage` tidak akan mengembalikan pengguna ke `ProductFormPage`, yang merupakan perilaku yang diinginkan untuk navigasi root dari drawer.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

  * `Scaffold`:
      * Fungsi: Bertindak sebagai kerangka (template) dasar untuk setiap halaman Material Design.
      * Implementasi: saya menggunakannya sebagai widget terluar di `MyHomePage` (dalam `lib/screens/menu.dart`) dan di `ProductFormPage` (dalam `lib/screens/productlist_form.dart`).

  * `AppBar`:
      * Fungsi: Ditempatkan di slot `appBar` milik `Scaffold` untuk menyediakan bilah judul yang konsisten.
      * Implementasi: Di `MyHomePage`, `AppBar` menampilkan judul 'Football Shop'. Di `ProductFormPage`, `AppBar` menampilkan 'Add Product Form'. Karena `ProductFormPage` dipanggil menggunakan `Navigator.push()`, `AppBar`-nya secara otomatis menerima fungsionalitas tombol "Back" tanpa perlu kode tambahan.

  * `Drawer`:
      * Fungsi: Menyediakan menu navigasi samping yang konsisten.
      * Implementasi: saya memanggil widget `LeftDrawer()` yang sama di dalam properti `drawer` pada `Scaffold` di `MyHomePage` dan `ProductFormPage`. 

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Analisis berikut didasarkan pada file `productlist_form.dart`.

  * `Padding`:
      * Kelebihan: Memberikan ruang kosong (whitespace) di sekitar elemen UI, meningkatkan keterbacaan dan estetika, serta mencegah elemen menempel pada tepi layar atau satu sama lain.
      * Contoh Penggunaan: saya telah membungkus setiap elemen form (seperti `TextFormField` untuk "Nama Produk", "Harga Produk", dll.) di dalam widget `Padding`. Contohnya, `Padding(padding: const EdgeInsets.all(8.0), child: TextFormField(...))`. Ini secara efektif memberikan jarak 8 piksel di sekeliling setiap bidang input, memisahkannya secara visual.

  * `SingleChildScrollView`:
      * Kelebihan: Esensial untuk form. Saat keyboard virtual muncul, ruang layar yang tersedia akan berkurang. `SingleChildScrollView` memastikan konten di dalamnya dapat digulir (scrollable), sehingga mencegah *overflow error* dan memastikan pengguna dapat mengakses semua bidang form.
      * Contoh Penggunaan: Di `ProductFormPage`, saya membungkus seluruh `Column` yang berisi elemen-elemen form saya di dalam `SingleChildScrollView`. Ini sangat penting karena form saya cukup panjang (Nama, Harga, Deskripsi, Kategori, Thumbnail, Switch, Tombol). Tanpa `SingleChildScrollView`, bidang di bagian bawah (seperti tombol "Save") kemungkinan besar tidak akan dapat diakses saat keyboard aktif.

  * `ListView`:
      * Kelebihan: Mirip dengan `SingleChildScrollView`, `ListView` menyediakan fungsionalitas scrolling secara otomatis. `ListView` pada dasarnya menggabungkan fungsionalitas `Column` (menyusun anak-anaknya secara vertikal) dengan scrolling.
      * Contoh Penggunaan: Meskipun `ProductFormPage` saya menggunakan `SingleChildScrollView` + `Column` (yang merupakan pola yang valid), `ListView` digunakan di `lib/widgets/left_drawer.dart` untuk menyusun `DrawerHeader` dan `ListTile`. Dalam konteks form, saya *bisa* mengganti `SingleChildScrollView` dan `Column` di dalam `Form` saya dengan satu `ListView` yang berisi `Padding` dan `TextFormField` sebagai children-nya untuk mencapai hasil fungsional yang sama (konten form yang dapat digulir).

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Konsistensi brand dicapai dengan mendefinisikan tema terpusat di `lib/main.dart`.
  * Cara Kerja: Di dalam `MaterialApp`, saya mengatur properti `theme`. Flutter kemudian menyebarkan `ThemeData` ini ke seluruh widget tree, sehingga semua widget di bawahnya (seperti `AppBar`, `Button`, dll.) akan menggunakan warna dan gaya dari tema ini secara default.

  * Implementasi dalam Kode:
    ```
    // [lib/main.dart]
    theme: ThemeData(
       colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
           .copyWith(secondary: Colors.blueAccent[400]),
    ),
    ```

      * `ColorScheme.fromSwatch(primarySwatch: Colors.blue)` secara otomatis menghasilkan palet warna lengkap (termasuk `primary`, `secondary`, `surface`, `onPrimary`, dll.) berdasarkan warna dasar `Colors.blue`.
      * Inilah sebabnya `AppBar` di `lib/screens/menu.dart` (yang menggunakan `Theme.of(context).colorScheme.primary`) dan `DrawerHeader` di `lib/widgets/left_drawer.dart` (yang menggunakan `Colors.blue`) memiliki warna biru yang konsisten.
</details>