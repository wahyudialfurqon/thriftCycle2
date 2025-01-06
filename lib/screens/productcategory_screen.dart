import 'package:flutter/material.dart';
import '../../service/model/product.dart';
import 'package:thriftcycle/wigedts/cardproduct.dart';

class ProductByCategoryScreen extends StatelessWidget {
  final String category;

  const ProductByCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produk - $category"),
      ),
      body: FutureBuilder<List<Product>>(
        future: Product.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text("Harapkan periksa koneksi internet"));
          } else if (snapshot.hasData) {
            List<Product> filteredProducts = snapshot.data!
                .where((product) => 
                  product.category.toLowerCase() == category.toLowerCase())
                .toList();

            if (filteredProducts.isEmpty) {
              return const Center(child: Text("Produk tidak ditemukan"));
            }

            return GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return CardProduct(product: product);
              },
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
