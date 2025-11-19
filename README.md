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

<details>
<Summary><b>Tugas 9</b></Summary>

1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Membuat model Dart (kelas kustom) alih-alih menggunakan Map<String, dynamic> mentah sangat krusial untuk kesehatan kode jangka panjang.

Type Safety (Keamanan Tipe):
* Dengan Model: Compiler tahu bahwa product.price adalah int. Jika mencoba memasukkan String, editor akan langsung error (merah) sebelum aplikasi dijalankan.

* Tanpa Model (Map): data['price'] dianggap dynamic. Jika tidak sengaja memasukkan String ke variabel int, error baru muncul saat aplikasi dijalankan (Runtime Error), yang bisa menyebabkan aplikasi crash tiba-tiba.

Null Safety & Validasi:
Model memungkinkan kita mendefinisikan mana field yang boleh kosong (nullable ?) dan mana yang wajib ada. Jika API mengembalikan data yang tidak lengkap, proses konversi fromJson di model bisa menangani error tersebut dengan lebih elegan dibandingkan akses Map manual yang berisiko null pointer exception.

Maintainability (Kemudahan Pemeliharaan) & Autocomplete:
Dengan Model, IDE (seperti VS Code) bisa memberikan fitur autocomplete (IntelliSense). Cukup ketik product. lalu muncul pilihan name, price, dll.

Dengan Map, harus menghafal string key (data['nama_produk'] atau data['name']?). Typo satu huruf saja (misal data['pric']) akan menyebabkan nilai null tanpa peringatan error yang jelas.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
Dalam konteks tugas ini (biasanya menggunakan package pbp_django_auth):

Package http:
Ini adalah pustaka dasar untuk melakukan permintaan jaringan (GET, POST, PUT, DELETE).

* Sifat: Stateless. Setiap permintaan dianggap baru. Ia tidak menyimpan informasi sesi (cookies) secara otomatis. Jika login menggunakan http biasa, server memberikan cookie sesi, tapi http tidak menyimpannya untuk request berikutnya. Akibatnya, server menganggap belum login di request kedua.

CookieRequest:
Ini adalah wrapper (pembungkus) di atas http.

* Fungsi Utama: Menangani manajemen Cookies dan Session. Saat login berhasil, Django mengirimkan sessionid dan csrftoken. CookieRequest menyimpan token ini di memori lokal aplikasi.

* Peran: Setiap kali melakukan request selanjutnya (misal: request.get(...)), CookieRequest otomatis menyertakan cookies tersebut di header. Ini membuat Django mengenali bahwa "request ini datang dari user yang sudah login tadi".

3.  Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest menyimpan data sesi (token login) di dalam variabel instance-nya.

Masalah jika tidak dibagikan: Jika membuat new CookieRequest() di Halaman Login, lalu membuat new CookieRequest() lagi di Halaman Home, maka Halaman Home memiliki instance baru yang kosong (tidak punya cookie hasil login tadi). Akibatnya, user dianggap belum login.

Solusi (Provider): Dengan membagikan satu instance yang sama (Singleton) menggunakan Provider ke seluruh aplikasi (root), semua halaman mengakses objek yang sama. Jadi, cookie yang didapat saat login bisa dipakai oleh halaman daftar produk, profil, atau logout.

4.  Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Agar HP/Emulator bisa bicara dengan Server Django di Laptop, konfigurasi ini wajib:

* 10.0.2.2 pada ALLOWED_HOSTS:
Emulator Android berjalan di "dunia virtual" sendiri. Bagi emulator, localhost (127.0.0.1) adalah dirinya sendiri (HP itu sendiri).

Untuk mengakses laptop (host) tempat Django berjalan, Android menyediakan IP alias spesial: 10.0.2.2.

Django secara keamanan memblokir request dari host yang tidak dikenal. Kita harus menambahkan 10.0.2.2 di settings.py agar Django mau menerima tamu dari alamat tersebut.

* CORS (Cross-Origin Resource Sharing):
Jika mengembangkan versi Web atau situasi tertentu di mobile, browser/klien memblokir akses resource dari domain berbeda (beda port dihitung beda domain). Mengaktifkan django-cors-headers memberi tahu browser/klien bahwa "Aman mengambil data dari server ini".

* Izin Internet (AndroidManifest.xml):
Secara default, aplikasi Android dibatasi aksesnya (Sandbox) demi keamanan user. Kita harus secara eksplisit meminta izin android.permission.INTERNET agar OS Android mengizinkan aplikasi kita menggunakan radio Wi-Fi/Data untuk keluar jaringan.

Konsekuensi jika salah: Aplikasi akan mengalami Connection Refused, SocketException, atau Network Error terus menerus. Login tidak akan pernah sampai ke server.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
a. Input: User mengisi TextFormField di Flutter. Data disimpan di variabel state (misal: _username, _description).

b. Serialisasi: Saat tombol "Simpan" ditekan, data variabel diubah menjadi format JSON (Map). Contoh: {"name": "Baju", "price": 50000}.

c. Request: CookieRequest mengirim method POST ke URL Django (misal: /create-flutter/) membawa body JSON tadi.

d. Processing (Django):
* Django menerima request.
* Membaca body JSON.
* Membuat objek Model Django.
* Menyimpan ke Database (.save()).
* Mengembalikan respon JSON (misal: {"status": "success"}).

e. Fetching (Ambil Data): Flutter melakukan request GET.

f. Deserialisasi: Flutter menerima JSON dari Django, lalu mengonversinya menjadi List of Objects (Model Dart) menggunakan fromJson.

g. Display: Widget FutureBuilder menunggu proses no. 6 selesai, lalu me-render ListView berisi data tersebut ke layar.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

a. Input: User memasukkan username/password di Flutter.

b. Request: Flutter mengirim POST ke endpoint /auth/login/.

c. Verifikasi (Django):
* Django menggunakan authenticate(username, password).
* Jika cocok, Django memanggil auth_login(request, user).
* Django membuat Session ID di database server, dan mengirim ID tersebut dalam bentuk Cookie (sessionid) di header response ke Flutter.

d. Penyimpanan: CookieRequest di Flutter menangkap cookie sessionid tersebut dan menyimpannya di RAM.

e. Akses Menu: Saat user pindah ke halaman menu, Flutter mengecek request.loggedIn. Jika true (karena ada cookie), menu ditampilkan.

f. Logout:
* Flutter mengirim request ke /auth/logout/ membawa cookie tadi.
* Django menghapus sesi di server.
* Flutter menghapus cookie di lokal CookieRequest.
* User diarahkan kembali ke halaman login.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

Tahap 1: Persiapan Backend (Django)
* Saya membuat aplikasi Django baru (authentication) di project yang sudah ada.
* Membuat view untuk login yang mengembalikan JsonResponse.
* Menambahkan URL routing di urls.py.
* Menambahkan corsheaders di INSTALLED_APPS dan MIDDLEWARE, serta mengatur CORS_ALLOW_ALL_ORIGINS = True (untuk dev).

Tahap 2: Integrasi Dasar Flutter
* Menambahkan package provider dan pbp_django_auth ke pubspec.yaml.
* Memodifikasi main.dart untuk membungkus MaterialApp dengan Provider. Ini penting agar objek CookieRequest bisa diakses di mana saja.

Provider(
  create: (_) => CookieRequest(),
  child: MaterialApp(...),
)

Tahap 3: Membuat Model
* Saya mengambil contoh JSON dari endpoint Django (buka di browser).
* Menggunakan situs seperti QuickType atau menulis manual kelas Dart dengan fromJson dan toJson untuk memetakan data tersebut.

Tahap 4: Halaman Login & Register
* Membuat Form dengan validasi TextFormField.
* Di fungsi onPressed tombol Login, saya memanggil request.login(url, credentials).
* Menambahkan logika: Jika success, gunakan Navigator.pushReplacement ke halaman Home (agar tidak bisa back ke login).

Tahap 5: Menampilkan Data
* Membuat file list_product.dart.
* Menggunakan FutureBuilder.
* Di properti future, saya memanggil fungsi fetchProduct() yang menggunakan request.get(url).
* Mengembalikan ListView.builder untuk me-render setiap item dari Model yang didapat.

Tahap 6: Input Data
* Membuat form input baru.
* Mengirim data dengan request.postJson(url, jsonEncode(data)).
* Jika sukses, pop kembali ke halaman list dan refresh data.
</details>
