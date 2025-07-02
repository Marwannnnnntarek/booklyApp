import 'package:flutter/material.dart';

class BooksImages extends StatelessWidget {
  const BooksImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
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
