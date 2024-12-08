import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {});
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
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 5000),
                          curve: Curves.fastLinearToSlowEaseIn,
                          top: 0,
                          left: -10,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 5000),
                            curve: Curves.ease,
                            height: MediaQuery.of(context).size.height * 2,
                            width: MediaQuery.of(context).size.width * 1,
                            color: Colors.black,
                            transform: Matrix4.identity()
                              ..rotateZ(
                                  -56) // Rotasi (dalam radian) untuk memiringkan container
                              ..translate(
                                  300.0, -400.0), // Pindahkan posisi container
                          ),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 5000),
                          curve: Curves.fastLinearToSlowEaseIn,
                          top: -8,
                          left: -430,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 5000),
                            curve: Curves.ease,
                            height: MediaQuery.of(context).size.height * 2,
                            width: MediaQuery.of(context).size.width * 1,
                            color: Colors.red,
                            transform: Matrix4.identity()
                              ..rotateZ(
                                  0.500) // Rotasi (dalam radian) untuk memiringkan container
                              ..translate(
                                  330.0, -800.0), // Pindahkan posisi container
                          ),
                        ),
                        // )
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
