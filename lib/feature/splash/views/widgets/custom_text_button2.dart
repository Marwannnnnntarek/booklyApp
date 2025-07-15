import 'package:flutter/material.dart';

class CustomTextButton2 extends StatelessWidget {
  const CustomTextButton2({
    super.key,
    required this.onPressed2,
    required this.textButton2,
  });

  final void Function()? onPressed2;
  final String textButton2;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed2,
      child: Text(
        textButton2,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
