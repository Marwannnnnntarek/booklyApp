import 'package:bookly/feature/view/home/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(), // disable inner scroll
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return BestSellerItem(
          imageUrl: 'assets/images/test_image.png',
          title: 'The Flutter Journey',
          subtitle: 'John Doe',
          price: '\$19.99',
          rating: 4.8,
        );
      },
    );
  }
}
