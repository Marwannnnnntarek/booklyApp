import 'package:bookly/feature/view/home/views/widgets/home_widgets/best_seller/best_seller_list_view.dart';
import 'package:bookly/feature/view/home/views/widgets/home_widgets/books/books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:bookly/feature/view/home/views/widgets/home_widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: BooksListView()),
            SliverToBoxAdapter(child: BestSellerListView()),
          ],
        ),
      ),
    );
  }
}
