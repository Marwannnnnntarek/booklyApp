import 'package:flutter/material.dart';

class BestSellerListViewHeader extends StatelessWidget {
  const BestSellerListViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Best Sellers',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
