import 'package:flutter/material.dart';
import 'package:footballshop/models/shop_entry.dart';
import 'package:footballshop/widgets/left_drawer.dart';
import 'package:footballshop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:footballshop/screens/product_detail.dart';


class ProductEntryListPage extends StatefulWidget {
  final bool initialUserOnly;
  const ProductEntryListPage({super.key, this.initialUserOnly = false});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  late bool showUserOnly;
  @override
  void initState() {
    super.initState();
    showUserOnly = widget.initialUserOnly; 
  }
  Future<List<ProductEntry>> fetchProductEntries(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000

    String url;
    
    if (showUserOnly) {
      url = 'http://localhost:8000/json-by-user/'; 
    } else {
      url = 'http://localhost:8000/json/';
    }
    
    final response = await request.get(url);
    
    // Decode response to json format
    var data = response;
    
    // Convert json data to ProductEntry objects
    List<ProductEntry> listProductEntries = [];
    for (var d in data) {
      if (d != null) {
        listProductEntries.add(ProductEntry.fromJson(d));
      }
    }
    return listProductEntries;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Theme.of(context).cardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  showUserOnly ? "My Products" : "All Products",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: showUserOnly,
                  activeColor: Colors.deepPurple,
                  onChanged: (bool value) {
                    setState(() {
                      showUserOnly = value;
                    });
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: FutureBuilder(
              future: fetchProductEntries(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } 
                
                if (snapshot.hasError) {
                   return Center(
                     child: Text("Error: ${snapshot.error}", style: const TextStyle(color: Colors.red)),
                   );
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tidak ada data produk.',
                          style: TextStyle(fontSize: 20, color: Colors.deepPurpleAccent),
                        ),
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => ProductEntryCard(
                      product: snapshot.data![index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductEntryDetailPage(
                              product: snapshot.data![index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}