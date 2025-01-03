import 'package:flutter/material.dart';
import '../screens/homepage.dart';
import '../main.dart';

class DetailProduct extends StatefulWidget {
   final Map<String, dynamic> product;

  const DetailProduct({super.key, required this.product});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                ),
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 370,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Baju Batik MU",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                        width: 190,
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          "Kemeja",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 137, 136, 136)
                                .withOpacity(0.5),
                            blurRadius: 3,
                            offset: const Offset(5, 5),
                          )
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://3.bp.blogspot.com/-RU5Mx3pA_DA/T3qtuStvLMI/AAAAAAAAATk/lBsHPUgIn00/s1600/danil+babol+mu-6.jpg"),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 24,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 15),
                  child: Text(
                    "Detail Produk",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 20),
                  child: SizedBox(
                    width:
                        MediaQuery.of(context).size.width, // Buat lebar dinamis
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //TODO Nama Donasi
                        const Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nama Donasi "),
                              SizedBox(width: 20),
                              Text("Bambam Marwan"),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.blueGrey[100],
                          thickness: 2,
                        ),
                        // TODO NO Telepon
                        const Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("No Telepon "),
                              SizedBox(width: 32),
                              Text("123456789011"),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.blueGrey[100],
                          thickness: 2,
                        ),
                        //TODO Alamat
                        const Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alamat "),
                              SizedBox(width: 59),
                              Expanded(
                                child: Text(
                                  "Jl.Margonda No.1dddddddddddddddddddddddddddddddddddddddddddddddd",
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.blueGrey[100],
                          thickness: 2,
                        ),
                        //TODO Deskripsi
                        const Padding(
                          padding: EdgeInsets.all(2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Deskripsi "),
                              SizedBox(width: 40),
                              Expanded(
                                child: Text(
                                  "Barang masih bagus warna masih cerah dan kain masih bagusppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp",
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
