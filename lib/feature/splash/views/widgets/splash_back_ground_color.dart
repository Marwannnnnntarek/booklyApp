import 'package:flutter/material.dart';

class SplashBackGroundColor extends StatelessWidget {
  const SplashBackGroundColor({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x006B5FF8),
            Color(0xff6B5FF8), // Same as background
          ],
          stops: [0.45, 0.65],
        ),
      ),
    );
  }
}
