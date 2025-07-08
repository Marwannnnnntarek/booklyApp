import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_list_view_header.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/books_images.dart';
import 'package:bookly/feature/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksDetailsListView extends StatelessWidget {
  const BooksDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return Column(
            spacing: 10,
            children: [
              BooksDetailsListViewHeader(),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return BooksImages(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                          '',
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is SimilarBooksFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is SimilarBooksLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return SizedBox.shrink();
      },
    );
  }
}
