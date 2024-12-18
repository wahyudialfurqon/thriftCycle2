import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  double _x1 = 300.0;
  double _x2 = 350.0;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _x1 = 800.0;
        _x2 = -500.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 5000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Stack(
                      children: [
                        Center(
                          child: Text("test"),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 5000),
                          curve: Curves.fastLinearToSlowEaseIn,
                          top: 0,
                          left: 65,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 5000),
                            curve: Curves.ease,
                            height: MediaQuery.of(context).size.height * 2,
                            width: MediaQuery.of(context).size.width * 1,
                            color: Colors.red,
                            transform: Matrix4.identity()
                              ..rotateZ(
                                  0.530) // Rotasi (dalam radian) untuk memiringkan container
                              ..translate(
                                  _x1, -400.0), // Pindahkan posisi container
                          ),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 5000),
                          curve: Curves.fastLinearToSlowEaseIn,
                          top: -8,
                          left: -460,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 5000),
                            curve: Curves.ease,
                            height: MediaQuery.of(context).size.height * 2,
                            width: MediaQuery.of(context).size.width * 1,
                            color: Colors.blue,
                            transform: Matrix4.identity()
                              ..rotateZ(
                                  0.5250) // Rotasi (dalam radian55) untuk memiringkan container
                              ..translate(
                                  _x2, -500.0), // Pindahkan posisi container
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
