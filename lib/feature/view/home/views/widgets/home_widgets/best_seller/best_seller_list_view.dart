import 'package:bookly/feature/view/home/views/widgets/home_widgets/best_seller/best_seller_info.dart';
import 'package:bookly/feature/view/home/views/widgets/home_widgets/best_seller/best_seller_list_view_header.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        spacing: 10,
        children: [
          BestSellerListViewHeader(),
          ListView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // disable inner scroll
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return BestSellerInfo();
            },
          ),
        ],
      ),
    );
  }
}
