import 'package:bookly/feature/home/data/models/book_model/item.dart';
import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_bar.dart';
import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_rating.dart';
import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_text.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/books_images.dart';
import 'package:flutter/material.dart';

class BooksDetailsInfo extends StatelessWidget {
  const BooksDetailsInfo({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        SizedBox(
          height: 300,
          child: BooksImages(
            imageUrl: item.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        BooksDetailsText(
          title: item.volumeInfo.title!,
          subTitle: item.volumeInfo.authors![0],
        ),
        BooksDetailsRating(
          rating: item.volumeInfo.maturityRating!,
          count: '87585',
        ),
        BooksDetailsBar(item: item),
      ],
    );
  }
}
