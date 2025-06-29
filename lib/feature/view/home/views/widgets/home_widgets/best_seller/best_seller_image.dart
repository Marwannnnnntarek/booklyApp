import 'package:flutter/material.dart';

class BestSellerImage extends StatelessWidget {
  const BestSellerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images/test_image.png'),
          fit: BoxFit.cover, // Makes image fill the container
        ),
      ),
    );
  }
}
