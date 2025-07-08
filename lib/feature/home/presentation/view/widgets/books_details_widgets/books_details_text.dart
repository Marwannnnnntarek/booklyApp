import 'package:flutter/material.dart';

class BooksDetailsText extends StatelessWidget {
  const BooksDetailsText({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          subTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
