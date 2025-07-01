import 'package:flutter/material.dart';

class BestSellerRating extends StatelessWidget {
  const BestSellerRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$19.99',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),

        Row(
          spacing: 6,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 16),
            Text('4.8', style: const TextStyle(fontSize: 14)),
            Text(
              '(7654)',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
