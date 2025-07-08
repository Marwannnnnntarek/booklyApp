import 'package:bookly/feature/home/data/models/book_model/item.dart';
import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_app_bar.dart';
import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_info.dart';
import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_list_view.dart';
import 'package:bookly/feature/home/presentation/view_model/similar_books/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksDetails extends StatefulWidget {
  final Item item;
  const BooksDetails({super.key, required this.item});

  @override
  State<BooksDetails> createState() => _BooksDetailsState();
}

class _BooksDetailsState extends State<BooksDetails> {
  @override
  void initState() {
    context.read<SimilarBooksCubit>().fetchSimilarBoosk(
      category: widget.item.volumeInfo.categories![0],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BooksDetailsAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              spacing: 50,
              children: [
                BooksDetailsInfo(item: widget.item),
                BooksDetailsListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
