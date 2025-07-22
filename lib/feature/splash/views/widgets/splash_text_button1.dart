import 'package:flutter/material.dart';

class CustomTextButton1 extends StatelessWidget {
  const CustomTextButton1({
    super.key,

    required this.textButton1,
    required this.onPressed1,
  });

  final String textButton1;
  final void Function()? onPressed1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed1,
        child: Text(
          textButton1,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
