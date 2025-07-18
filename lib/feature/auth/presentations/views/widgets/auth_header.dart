import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.image, required this.logo});
  final String image, logo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(alignment: Alignment.topRight, child: Image.asset(image)),
        const SizedBox(height: 44),
        Image.asset(logo),
      ],
    );
  }
}
