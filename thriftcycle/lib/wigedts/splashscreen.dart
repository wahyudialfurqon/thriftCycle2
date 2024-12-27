import 'package:flutter/material.dart';
import 'package:thriftcycle/main.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  double _x1 = 300.0;
  double _x2 = 350.0;
  double _heightLogo = 0;
  double _dgLogo = 2;
  double _opacity = 1;
  double _widthLogo = 0;
  double _heightContainer = 0;
  double _weidthContainer = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 4500), () {
      setState(() {
        _x1 = 1090.0;
        _x2 = -500.0;
      });
    });
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        _heightLogo = 300.0;
        _widthLogo = 300.0;
        _dgLogo = 0;
      });
    });
    Future.delayed(const Duration(milliseconds: 7000), () {
      setState(() {
        _heightContainer = 1000.0;
        _weidthContainer = 1000.0;
        _opacity = 1;
      });
    });
    Future.delayed(const Duration(milliseconds: 8000), () {
      setState(() {
            Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
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
                        Stack(
                          children: [
                            Center(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 5000),
                                curve: Curves.fastLinearToSlowEaseIn,
                                height: _heightLogo,
                                width: _widthLogo, //_heightLogo,
                                transform: Matrix4.rotationX(_dgLogo),
                                child: const Image(
                                  image: AssetImage('image/logo.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        AnimatedPositioned(
                            duration: const Duration(milliseconds: 5000),
                            curve: Curves.easeOut,
                            width: MediaQuery.of(context).size.width * 2,
                            height: MediaQuery.of(context).size.height * 2,
                            top: -353,
                            left: -207,
                            child: AnimatedOpacity(
                              opacity: _opacity,
                              duration: const Duration(milliseconds: 4000),
                              child: Center(
                                child: AnimatedContainer(
                                  height: _heightContainer,
                                  width: _weidthContainer,
                                  duration: const Duration(milliseconds: 1000),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF2C7C7D),
                                      shape: BoxShape.circle),
                                ),
                              ),
                            )),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 5000),
                          curve: Curves.easeIn,
                          top: 0,
                          left: 68,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 5000),
                            curve: Curves.ease,
                            height: MediaQuery.of(context).size.height * 2,
                            width: MediaQuery.of(context).size.width * 1,
                            color: const Color(0xFF2C7C7D),
                            transform: Matrix4.identity()
                              ..rotateZ(
                                  0.530) // Rotasi (dalam radian) untuk memiringkan container
                              ..translate(
                                  _x1, -400.0), // Pindahkan posisi container
                          ),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 5000),
                          curve: Curves.ease,
                          top: -8,
                          left: -460,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 5000),
                            curve: Curves.ease,
                            height: MediaQuery.of(context).size.height * 2,
                            width: MediaQuery.of(context).size.width * 1,
                            color: const Color(0xFF1B6061),
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
