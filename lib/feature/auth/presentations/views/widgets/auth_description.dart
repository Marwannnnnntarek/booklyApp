import 'package:flutter/material.dart';

class AuthDescription extends StatelessWidget {
  const AuthDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Dive back into your reading world.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xaaffffff),
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
