import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/view/home/views/widgets/home_widgets/best_seller/best_seller_image.dart';
import 'package:bookly/feature/view/home/views/widgets/home_widgets/best_seller/best_seller_rating.dart';
import 'package:bookly/feature/view/home/views/widgets/home_widgets/best_seller/best_seller_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerInfo extends StatelessWidget {
  const BestSellerInfo({super.key});

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
              BestSellerImage(),
              Expanded(
                child: Column(
                  spacing: 40,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [BestSellerText(), BestSellerRating()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
