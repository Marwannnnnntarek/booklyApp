import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_app_bar.dart';
import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_info.dart';
import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_list_view.dart';
import 'package:flutter/material.dart';

class BooksDetails extends StatelessWidget {
  const BooksDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BooksDetailsAppBar(),
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
