import 'package:flutter/material.dart';
import 'package:thriftcycle/wigedts/detaiview.dart';
import '../screens/homepage.dart';
import '../service/model/product.dart';

class DetailProduct extends StatefulWidget {
  final int idProduct;
  const DetailProduct({super.key, required this.idProduct});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FutureBuilder<Product>(
            future: Product.getProduct(widget.idProduct),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 1000,
                    ),
                    Center(child: CircularProgressIndicator())
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Terjadi kesalahan: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final product = snapshot.data!;
                return Detailview(product: product);
              } else {
                return const Center(child: Text('Data tidak ditemukan.'));
              }
            },
          )),
    );
  }
}
