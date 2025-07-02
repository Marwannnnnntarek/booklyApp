import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BooksImages extends StatelessWidget {
  const BooksImages({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: CachedNetworkImage(
            placeholder:
                (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.fill,
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
