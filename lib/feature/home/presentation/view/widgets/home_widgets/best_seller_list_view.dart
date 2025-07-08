import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/best_seller_info.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/best_seller_list_view_header.dart';
import 'package:bookly/feature/home/presentation/view_model/best_seller_books_cubit/best_seller_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerBooksCubit, BestSellerBooksState>(
      builder: (context, state) {
        if (state is BestSellerBooksSuccess) {
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
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return BestSellerInfo(item: state.books[index]);
                  },
                ),
              ],
            ),
          );
        } else if (state is BestSellerBooksFailure) {
          return Text('Error');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
