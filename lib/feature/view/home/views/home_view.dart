import 'package:bookly/feature/view/home/views/widgets/best_seller_list_view.dart';
import 'package:bookly/feature/view/home/views/widgets/books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:bookly/feature/view/home/views/widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BooksListView(),
                  Text(
                    'Best Sellers',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  BestSellerListView(),
                ],
              ),
            ),
            SliverToBoxAdapter(child: BestSellerListView()),
          ],
        ),
      ),
    );
  }
}
