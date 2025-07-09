import 'package:bookly/feature/home/data/models/book_model/item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksDetailsBar extends StatelessWidget {
  const BooksDetailsBar({super.key, required this.item});
  final Item item;
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
          child: const Text('Free'),
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
          onPressed: () async {
            Uri uri = Uri.parse(item.volumeInfo.previewLink!);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
          child: Text(getText(item)),
        ),
      ],
    );
  }

  String getText(Item item) {
    if (item.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
