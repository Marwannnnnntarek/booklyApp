import 'package:bookly/feature/auth/presentations/views/widgets/auth_logout.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/best_seller_list_view.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/books_list_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff6B5FF8),
        appBar: AppBar(
          backgroundColor: Color(0xff6B5FF8),
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/Logo.png'),
              ),
              AuthLogout(),
            ],
          ),
        ),
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
