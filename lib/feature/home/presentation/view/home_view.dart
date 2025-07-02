import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/best_seller_list_view.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar(),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: BooksListView()),
            SliverToBoxAdapter(child: BestSellerListView()),
          ],
        ),
      ),
    );
  }
}
