import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thriftcycle/service/model/product.dart';
import 'package:thriftcycle/wigedts/cardproduct.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List<Product> favoriteProducts = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Product> allProducts = await Product.fetchProducts();
    List<Product> tempFavorites = [];
    for (var product in allProducts) {
      String key = 'favorite_${product.id}';
      bool isFavorite = prefs.getBool(key) ?? false;
      if (isFavorite) {
        product.isFavorite = true;
        tempFavorites.add(product);
      }
    }
    setState(() {
      favoriteProducts = tempFavorites;
    });
  }

  Future<void> _toggleFavorite(Product product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = 'favorite_${product.id}';
    setState(() {
      // Toggle the favorite status
      product.isFavorite = !product.isFavorite;

      // Update the list of favorites accordingly
      if (product.isFavorite) {
        favoriteProducts.add(product);
      } else {
        favoriteProducts.remove(product);
      }

      // Save the new favorite status to SharedPreferences
      prefs.setBool(key, product.isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "Favorite",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    SizedBox(height: 4), // Untuk menyesuaikan posisi vertikal
                    Text(
                      "your favorite Here",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                    ),
                    const SizedBox(height: 20),
                    //TODO : List Product
                    FutureBuilder<List<Product>>(
                      future: Product.fetchProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          ); // Menunggu data dimuat
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("Harapkan periksa koneksi internet"),
                          );
                        } else if (snapshot.hasData) {
                          // Jika ada data
                          if (favoriteProducts.isEmpty) {
                            return const Center(
                              child: Padding(
                                 padding: const EdgeInsets.only(top: 200),
                                child: Text(
                                  "No Favorite Here", // Tampilkan pesan jika tidak ada produk favorit
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            );
                          }
                          return SizedBox(
                            height: 400,
                            child: GridView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: favoriteProducts.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 0,
                                childAspectRatio: 0.95,
                              ),
                              itemBuilder: (context, index) {
                                final product = favoriteProducts[index];
                                return Stack(
                                  clipBehavior: Clip.none, // Ensures the positioned widget is outside bounds
                                  children: [
                                    CardProduct(product: product),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: IconButton(
                                        icon: Icon(
                                          product.isFavorite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: product.isFavorite
                                              ? Colors.red // Red when favorite
                                              : Colors.grey, // Grey when not favorite
                                        ),
                                        onPressed: () => _toggleFavorite(product),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        } else {
                          return const Center(
                            child: Text("No data available"),
                          ); // Jika tidak ada data
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: FavoriteScreen(),
  ));
}
