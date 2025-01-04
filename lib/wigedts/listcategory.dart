import 'package:flutter/material.dart';
import 'package:thriftcycle/screens/detail_product.dart';
import '../../service/model/category.dart';

class ListCategory extends StatefulWidget {
  final Category category; // Tipe data ditentukan

  const ListCategory({super.key, required this.category});

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const DetailProduct(product:product.id, )),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: 90,
          height: 50,
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.category.icon, // Akses dengan `widget`
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  widget.category.name, // Akses dengan `widget`
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
