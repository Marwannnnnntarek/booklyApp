import 'package:flutter/material.dart';

class BooksDetailsListViewHeader extends StatelessWidget {
  const BooksDetailsListViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'You can also like',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
