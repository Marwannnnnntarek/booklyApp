import 'package:flutter/material.dart';

class BestSellerRating extends StatelessWidget {
  const BestSellerRating({super.key, required this.rate, required this.count});
  final String rate;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Free',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),

        Row(
          spacing: 6,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 16),
            Text(rate, style: const TextStyle(fontSize: 14)),
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
