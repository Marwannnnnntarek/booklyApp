import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/best_seller_list_view.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/books_list_view.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: BooksListView()),
        SliverToBoxAdapter(child: BestSellerListView()),
      ],
    );
  }
}
