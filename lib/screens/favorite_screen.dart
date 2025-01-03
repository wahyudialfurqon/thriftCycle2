import 'package:flutter/material.dart';
import 'package:thriftcycle/screens/detail_product.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<Map<String, dynamic>> favoriteProducts = List.generate(
    10,
    (index) => {
      "name": "Product ${index + 1}",
      "image":
          "https://s4.bukalapak.com/img/9766095992/w-1000/LOKAL_Jersey_Baju_MU_Manchester_United_Home_Merah_2018_2019_.jpg",
      "price": "\$${(index + 1) * 10}",
      "isFavorite": true,
    },
  );

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
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: favoriteProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.95,
                  ),
                  itemBuilder: (context, index) {
                    final product = favoriteProducts[index];
                    return InkWell(
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => DetailProduct(product: product),
                      //     ),
                      //   );
                      // },
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    product["image"],
                                    width: double.infinity,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5, top: 5),
                                        child: Container(
                                          width: 5,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10, top: 5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product["name"],
                                              style: const TextStyle(
                                                fontFamily: 'Rewals',
                                                fontSize: 16,
                                              ),
                                            ),
                                            const Text(
                                              "Category",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: IconButton(
                              icon: Icon(
                                product["isFavorite"] ? Icons.favorite : Icons.favorite_border,
                                color: product["isFavorite"] ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  product["isFavorite"] = !product["isFavorite"];
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
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
