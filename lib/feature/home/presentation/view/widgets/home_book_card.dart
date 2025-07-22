// import 'package:flutter/material.dart';

// class BookCard extends StatelessWidget {
//   final String title;
//   final String author;
//   final String imageUrl;

//   const BookCard({
//     super.key,
//     required this.title,
//     required this.author,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image section fills the top part
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(
//               top: Radius.circular(16),
//             ),
//             child: Image.network(
//               imageUrl,
//               width: double.infinity,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return Container(
//                   color: Colors.grey[200],
//                   child: const Center(
//                     child: Icon(
//                       Icons.broken_image,
//                       size: 48,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           // Text section below the image
//           Expanded(
//             flex: 3,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 Text(
//                   author,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
