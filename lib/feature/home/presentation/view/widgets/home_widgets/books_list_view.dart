import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/books_images.dart';
import 'package:bookly/feature/home/presentation/view_model/books_cubit/books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        if (state is BooksSuccess) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
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
                child: BooksImages(
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
