import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:thriftcycle/screens/profile_screen.dart';
import 'package:thriftcycle/screens/search_screen.dart';
import 'package:thriftcycle/screens/uploadscreen.dart';
import 'package:thriftcycle/wigedts/splashscreen.dart';
import '../screens/homepage.dart';
import '../screens/time_line.dart';
import '../screens/detail_product.dart';


void main() {
  runApp(
    MaterialApp(
        //home : StepsProgres(),
        //home: TimeLine(),
        // home: HomePage(),
        //home:DetailProduct()
        home: Splashscreen(),
        // home : UploadScreen(),
        //  home: SearchScreen(),
        // home: ProfileScreen(),
    
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Hero(tag: "Dash", child: const HomePage())),
    SearchScreen(),
    Center(child: Text('Add Photo Page')),
    Center(child: Text('Bookmark Page')),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Menampilkan halaman sesuai indeks
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        buttonBackgroundColor: const Color(0xFF2C7C7D),
        color: const Color(0xFF2C7C7D),
        animationCurve: Curves.fastEaseInToSlowEaseOut,
        height: 45,
        animationDuration: const Duration(milliseconds: 800),
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          const Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          const Icon(
            Icons.add_a_photo,
            size: 30,
            color: Colors.white,
          ),
          const Icon(
            Icons.bookmark,
            size: 30,
            color: Colors.white,
          ),
          const Icon(
            Icons.person_2_sharp,
            size: 30,
            color: Colors.white,
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Perbarui indeks saat item diklik
          });
        },
      ),
    );
  }
}