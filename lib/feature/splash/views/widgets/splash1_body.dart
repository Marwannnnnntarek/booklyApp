import 'package:flutter/material.dart';

class Splash1Body extends StatelessWidget {
  const Splash1Body({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff6B5FF8),
      body: Image.asset(
        'assets/images/image 5 (1).png',
        // width: screenWidth, // ✅ Full width
        // height: screenHeight,
      ),
    );
  }
}
