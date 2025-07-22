import 'package:bookly/core/helpers/failure.dart';
import 'package:bookly/core/data/models/book_model/item.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Item>>> fetchBooks();
}
