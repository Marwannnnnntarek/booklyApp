import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(alignment: Alignment.topRight, child: Image.asset(image)),
        const SizedBox(height: 44),
        Image.asset('assets/images/Logo.png'),
      ],
    );
  }
}
