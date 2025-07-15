import 'package:flutter/material.dart';

class CustomText1 extends StatelessWidget {
  const CustomText1({super.key, required this.text1});

  final String text1;

  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
