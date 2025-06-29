import 'package:bookly/feature/view/home/views/widgets/book_details_app_bar.dart';
import 'package:bookly/feature/view/home/views/widgets/books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  BookDetails({super.key});

  final List<String> bookImageUrls = [
    'assets/images/test_image.png',
    'assets/images/test_image.png',
    'assets/images/test_image.png',
    'assets/images/test_image.png',
    'assets/images/test_image.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BookDetailsAppBar(),
        body: Column(
          spacing: 6,
          children: [
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/images/test_image.png'),
                  fit: BoxFit.cover, // Makes image fill the container
                ),
              ),
            ),
            Text(
              'The Jungle Book',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rudyard Kipling',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            Row(
              spacing: 6,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                Text('4.8', style: const TextStyle(fontSize: 14)),
                Text(
                  '(7654)',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            OverflowBar(
              alignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    foregroundColor: WidgetStatePropertyAll(Colors.black),
                  ),
                  onPressed: () {},
                  child: const Text('\$9.99'),
                ),
                TextButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.deepOrangeAccent,
                    ),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {},
                  child: const Text('Free Preview'),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'You can also like',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            BooksListView(bookImageUrls: bookImageUrls),
          ],
        ),
      ),
    );
  }
}
