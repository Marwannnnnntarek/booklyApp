import 'package:flutter/material.dart';

class CustomText2 extends StatelessWidget {
  const CustomText2({super.key, required this.text2});

  final String text2;

  @override
  Widget build(BuildContext context) {
    return Text(
      text2,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
