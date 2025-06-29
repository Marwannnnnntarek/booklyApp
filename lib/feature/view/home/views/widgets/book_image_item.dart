import 'package:flutter/material.dart';

class BookImageItem extends StatelessWidget {
  final String imageUrl;

  const BookImageItem({super.key, required this.imageUrl});

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
