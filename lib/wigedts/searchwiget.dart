import 'package:flutter/material.dart';
import '../screens/detail_product.dart'; // Pastikan DetailProduct sudah diimpor

class SearchWidget extends StatelessWidget {
  final product; // List produk untuk ditampilkan
  const SearchWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailProduct(
                idProduct: product.id,
                product: product,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              const BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: product.imageUri != "" && product.imageUri.isNotEmpty
                      ? Image.network(
                        product.imageUri, // Menggunakan widget.product.imageUri yang sudah berisi URL lengkap
                        width: 300, // Tentukan lebar gambar
                        height: 100, // Tentukan tinggi gambar
                        fit: BoxFit.cover, // Tentukan cara gambar di-fit
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 50, color: Colors.grey), // Penanganan kesalahan jika gambar tidak dapat dimuat
                      )
                      : const Icon(Icons.image_not_supported,
                          size: 50, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.item,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  product.description ?? "No description available",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ));
  }
}
