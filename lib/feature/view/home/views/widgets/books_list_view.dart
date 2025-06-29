import 'package:bookly/feature/view/home/views/widgets/book_image_item.dart';
import 'package:flutter/material.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key, required this.bookImageUrls});

  final List<String> bookImageUrls;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bookImageUrls.length,
        itemBuilder: (context, index) {
          return BookImageItem(imageUrl: bookImageUrls[index]);
        },
      ),
    );
  }
}
