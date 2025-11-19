import 'package:flutter/material.dart';
import 'package:footballshop/screens/login.dart';
import 'package:footballshop/screens/menu.dart';
import 'package:footballshop/screens/productlist_form.dart';
import 'package:footballshop/screens/product_entry_list.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart'; // Wajib ada
import 'package:provider/provider.dart'; // Wajib ada

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. AMBIL VARIABLE REQUEST DARI PROVIDER
    final request = context.watch<CookieRequest>();

    return Drawer(
      // Mengatur warna background Drawer agar sesuai tema gelap
      backgroundColor: Theme.of(context).colorScheme.surface, 
      
      child: ListView(
        children: [
          DrawerHeader(
            // Menggunakan warna primary dari tema (atau hardcode hitam/ungu)
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Football Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Seluruh produk sepak bola terbaik di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Product'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProductFormPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt), // Icon list lebih cocok
            title: const Text('Product List'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            
            onTap: () async {
              final response = await request.logout(
                  "http://localhost:8000/auth/logout/");
              String message = response["message"];
              if (context.mounted) {
                  if (response['status']) {
                      String uname = response["username"];
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$message See you again, $uname."),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                  } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(message),
                          ),
                      );
                  }
              }
            },
          ),
        ],
      ),
    );
  }
}