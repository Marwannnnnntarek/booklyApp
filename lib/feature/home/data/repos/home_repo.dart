import 'package:bookly/core/helpers/failure.dart';
import 'package:bookly/feature/home/data/models/book_model/item.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Item>>> fetchBestSellersBooks();
  Future<Either<Failure, List<Item>>> fetchBoosk();
}
