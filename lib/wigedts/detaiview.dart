import 'package:flutter/material.dart';
import 'package:thriftcycle/main.dart';
import '../service/model/product.dart';

class Detailview extends StatefulWidget {
  final Product product;
  const Detailview({super.key, required this.product});

  @override
  State<Detailview> createState() => _DetailviewState();
}

class _DetailviewState extends State<Detailview> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children:[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width , 
                    child: Text(
                      widget.product.item,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        //overflow: TextOverflow.ellipsis
                      ),
                        maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                    width: 190,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(top: 5,),
                    child: Text(
                      widget.product.category,
                      style: const TextStyle(
                        fontSize: 19,
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
          padding: const EdgeInsets.only(top: 0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 137, 136, 136).withOpacity(0.5),
                        blurRadius: 3,
                        offset: const Offset(5, 5),
                      )
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "http://192.168.1.6:8000/storage/${widget.product.imageUri}"),
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
                width: MediaQuery.of(context).size.width, // Buat lebar dinamis
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO Nama Donasi
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Nama Donasi "),
                          const SizedBox(width: 20),
                          Text(widget.product.uploadBy),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                      thickness: 2,
                    ),
                    // TODO NO Telepon
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("No Telepon "),
                          const SizedBox(width: 32),
                          Text(widget.product.phoneNumber),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                      thickness: 2,
                    ),
                    //TODO Alamat
                    Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Alamat "),
                          const SizedBox(width: 59),
                          Expanded(
                            child: Text(
                              widget.product.address,
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
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Deskripsi "),
                          const SizedBox(width: 40),
                          Expanded(
                            child: Text(
                              widget.product.description,
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
    );
  }
}
