import 'package:bookly/feature/home/views/widgets/books_details_widgets/books_details_bar.dart';
import 'package:bookly/feature/home/views/widgets/books_details_widgets/books_details_image.dart';
import 'package:bookly/feature/home/views/widgets/books_details_widgets/books_details_rating.dart';
import 'package:bookly/feature/home/views/widgets/books_details_widgets/books_details_text.dart';
import 'package:flutter/material.dart';

class BooksDetailsInfo extends StatelessWidget {
  const BooksDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        BooksDetailsImage(),
        BooksDetailsText(),
        BooksDetailsRating(),
        BooksDetailsBar(),
      ],
    );
  }
}
