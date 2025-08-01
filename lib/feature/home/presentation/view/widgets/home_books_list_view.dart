import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_books_images.dart';
import 'package:bookly/feature/home/presentation/cubit/books_cubit/books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeBooksListView extends StatelessWidget {
  const HomeBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        if (state is BooksSuccess) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            physics: BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap:
                    () => context.push(
                      AppRoutes.booksDetails,
                      extra: state.books[index],
                    ),
                child: HomeBooksImages(
                  imageUrl:
                      state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                ),
              );
            },
          );
        } else if (state is BooksFailure) {
          return Text('Error');
        }
        return SizedBox.shrink();
      },
    );
  }
}
