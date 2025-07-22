import 'package:bookly/core/data/models/book_model/item.dart';
import 'package:bookly/feature/books_details/presentation/views/widgets/books_details_app_bar.dart';
import 'package:bookly/feature/books_details/presentation/views/widgets/books_details_info.dart';
import 'package:flutter/material.dart';

class BooksDetailsView extends StatefulWidget {
  final Item item;
  const BooksDetailsView({super.key, required this.item});

  @override
  State<BooksDetailsView> createState() => _BooksDetailsViewState();
}

class _BooksDetailsViewState extends State<BooksDetailsView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff6B5FF8),
        appBar: BooksDetailsAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.01,
            vertical: size.height * 0.01,
          ),
          child: SingleChildScrollView(
            child: BooksDetailsInfo(item: widget.item),
          ),
        ),
      ),
    );
  }
}
