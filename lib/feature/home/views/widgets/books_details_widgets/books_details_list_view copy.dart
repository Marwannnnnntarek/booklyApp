import 'package:bookly/feature/home/views/widgets/books_details_widgets/books_details_List_view/books_details_list_view_header%20copy.dart';
import 'package:bookly/feature/home/views/widgets/home_widgets/books_images.dart';
import 'package:flutter/material.dart';

class BooksDetailsListView extends StatelessWidget {
  const BooksDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
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
              return BooksImages();
            },
          ),
        ),
      ],
    );
  }
}
