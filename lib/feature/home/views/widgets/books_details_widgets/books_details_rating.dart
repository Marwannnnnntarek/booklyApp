import 'package:flutter/material.dart';

class BooksDetailsRating extends StatelessWidget {
  const BooksDetailsRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 16),
        Text('4.8', style: const TextStyle(fontSize: 14)),
        Text(
          '(7654)',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
