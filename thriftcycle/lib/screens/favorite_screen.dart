import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Map<String, dynamic>> favoriteItems = [
    {
      "name": "Baju Batik MU",
      "imageUrl":
          "https://3.bp.blogspot.com/-RU5Mx3pA_DA/T3qtuStvLMI/AAAAAAAAATk/lBsHPUgIn00/s1600/danil+babol+mu-6.jpg",
    },
    {
      "name": "Kemeja Batik Solo",
      "imageUrl":
          "https://asset.kompas.com/crops/vxDS6EXoOszoJu_rY2NEfQoC4iY=/0x0:1000x667/750x500/data/photo/2022/11/25/63800dc339b10.jpg",
    },
  ];

  void removeFavorite(int index) {
    setState(() {
      favoriteItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: const Color(0xFF2C7C7D),
      ),
      body: favoriteItems.isEmpty
          ? const Center(
              child: Text(
                "Tidak ada item favorit",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item["imageUrl"]),
                    ),
                    title: Text(item["name"]),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        removeFavorite(index);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
