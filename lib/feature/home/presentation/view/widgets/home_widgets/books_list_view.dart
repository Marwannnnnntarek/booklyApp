import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/books_images.dart';
import 'package:bookly/feature/home/presentation/view_model/books_cubit/books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        if (state is BooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return BooksImages(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks.thumbnail,
                  );
                },
              ),
            ),
          );
        } else if (state is BooksFailure) {
          return Text('Error');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
