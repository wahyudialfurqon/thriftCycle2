import 'package:flutter/material.dart';

class StepsProgress extends StatefulWidget {
  final double progress; // Nilai progress saat ini
  final double steps; // Total langkah

  const StepsProgress({Key? key, required this.progress, required this.steps})
      : super(key: key);

  @override
  State<StepsProgress> createState() => _StepsProgressState();
}

class _StepsProgressState extends State<StepsProgress> {
  @override
  @override
  Widget build(BuildContext context) {
    // Menghitung progress sebagai fraksi (antara 0.0 hingga 1.0)
    final progressFraction = (widget.progress / widget.steps);
    print('Progress Fraction: ${progressFraction}');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
        ),
        // Bar progress
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context)
                .size
                .width, // Menggunakan MediaQuery untuk lebar layar
            height: 20,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Background Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Warna latar progress bar
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // Progress Bar
                AnimatedContainer(
                  width: progressFraction * MediaQuery.of(context).size.width,
                  height: 20,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[600], // Warna progress
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  top: -5,
                  left: 60,
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 30, // Ukuran tinggi dari ListView
                      width: MediaQuery.of(context)
                          .size
                          .width, // Ukuran total lebar ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (widget.steps.toInt()),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 90), // Margin antar item
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white, // Warna item
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: widget.progress > index
                                        ? Colors.deepPurple
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                  // Bentuk lingkaran
                                ),
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      color: widget.progress > index
                                          ? Colors.deepPurple
                                          : Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}