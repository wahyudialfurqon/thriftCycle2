import 'package:flutter/material.dart';
import 'package:thriftcycle/wigedts/splashscreen.dart';
import '../screens/homepage.dart';
import '../screens/detail_product.dart';
import '../screens/time_line.dart';
//import '../wigedts/steps_screen.dart';

void main() {
  runApp(
    MaterialApp(
      //home : StepsProgres(),
      //home: TimeLine(),
     // home: HomePage(),
      //home:DetailProduct()
      home:Splashscreen()

    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
