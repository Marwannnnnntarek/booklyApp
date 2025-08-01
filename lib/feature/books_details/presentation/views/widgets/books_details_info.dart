import 'package:bookly/core/data/models/book_model/item.dart';
import 'package:bookly/feature/books_details/presentation/views/widgets/books_details_bar.dart';
import 'package:bookly/feature/books_details/presentation/views/widgets/books_details_text.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_books_images.dart';
import 'package:flutter/material.dart';

class BooksDetailsInfo extends StatelessWidget {
  const BooksDetailsInfo({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeBooksImages(imageUrl: item.volumeInfo.imageLinks?.thumbnail ?? ''),
        SizedBox(height: 10),
        BooksDetailsText(
          title: item.volumeInfo.title!,
          subTitle:
              item.volumeInfo.authors?.isNotEmpty == true
                  ? item.volumeInfo.authors![0]
                  : 'Unknown',
        ),
        SizedBox(height: 10),

        BooksDetailsBar(item: item),
      ],
    );
  }
}
