import 'package:flutter/material.dart';

class BooksDetailsBar extends StatelessWidget {
  const BooksDetailsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
      alignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            foregroundColor: WidgetStatePropertyAll(Colors.black),
          ),
          onPressed: () {},
          child: const Text('\$9.99'),
        ),
        TextButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(Colors.deepOrangeAccent),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
          ),
          onPressed: () {},
          child: const Text('Free Preview'),
        ),
      ],
    );
  }
}
