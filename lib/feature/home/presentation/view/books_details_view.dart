import 'package:bookly/feature/home/data/models/book_model/item.dart';
import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_app_bar.dart';
import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_info.dart';
import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_list_view.dart';
import 'package:bookly/feature/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksDetailsView extends StatefulWidget {
  final Item item;
  const BooksDetailsView({super.key, required this.item});

  @override
  State<BooksDetailsView> createState() => _BooksDetailsViewState();
}

class _BooksDetailsViewState extends State<BooksDetailsView> {
  @override
  void initState() {
    context.read<SimilarBooksCubit>().fetchSimilarBoosk(
      category:
          widget.item.volumeInfo.categories?.isNotEmpty == true
              ? widget.item.volumeInfo.categories![0]
              : 'Unknown',
    );
    super.initState();
  }

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
