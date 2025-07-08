import 'package:flutter/material.dart';

class BooksDetailsRating extends StatelessWidget {
  const BooksDetailsRating({
    super.key,
    required this.rating,
    required this.count,
  });
  final String rating, count;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 16),
        Text(rating, style: const TextStyle(fontSize: 14)),
        Text(count, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
