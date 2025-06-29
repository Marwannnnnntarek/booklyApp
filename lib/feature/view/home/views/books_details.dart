import 'package:bookly/feature/view/home/views/widgets/book_details_app_bar.dart';
import 'package:bookly/feature/view/home/views/widgets/books_details_widgets/books_details_info/books_details_info.dart';
import 'package:bookly/feature/view/home/views/widgets/books_details_widgets/books_details_List_view/books_details_list_view.dart';
import 'package:flutter/material.dart';

class BooksDetails extends StatelessWidget {
  const BooksDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BookDetailsAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            spacing: 50,
            children: [BooksDetailsInfo(), BooksDetailsListView()],
          ),
        ),
      ),
    );
  }
}
