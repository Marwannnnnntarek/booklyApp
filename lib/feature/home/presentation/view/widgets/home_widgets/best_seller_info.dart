import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/home/data/models/book_model/item.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/best_seller_rating.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/best_seller_text.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/books_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerInfo extends StatelessWidget {
  const BestSellerInfo({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.booksDetails),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: SizedBox(
          height: 110,
          child: Row(
            spacing: 20,
            children: [
              BooksImages(imageUrl: item.volumeInfo.imageLinks.thumbnail),
              Expanded(
                child: Column(
                  spacing: 40,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BestSellerText(
                      title: item.volumeInfo.title!,

                      subTitle:
                          item.volumeInfo.authors?.join(', ') ??
                          'Unknown Author',
                    ),
                    BestSellerRating(
                      rate: item.volumeInfo.maturityRating!,
                      count: item.volumeInfo.pageCount!,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
