import 'package:bookly/feature/home/presentation/view/widgets/books_details_widgets/books_details_list_view_header.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/books_images.dart';
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
              return BooksImages(
                imageUrl:
                    'https://d27jswm5an3efw.cloudfront.net/app/uploads/2019/07/how-to-make-a-url-for-a-picture-on-your-computer-4.jpg',
              );
            },
          ),
        ),
      ],
    );
  }
}
