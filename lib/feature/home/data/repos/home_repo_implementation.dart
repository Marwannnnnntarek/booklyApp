import 'package:bookly/core/services/api_services.dart';
import 'package:bookly/core/helpers/failure.dart';
import 'package:bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:bookly/feature/home/data/models/book_model/item.dart';
import 'package:bookly/feature/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImplementation(this.apiServices);

  @override
  Future<Either<Failure, List<Item>>> fetchBestSellersBooks() async {
    try {
      final data = await apiServices.get(
        endPoint: 'volumes?q=bestseller+subject:fiction&filter=free-ebooks',
      );

      final bookModel = BookModel.fromJson(data);
      return Right(bookModel.items ?? []);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioException(dioError));
    } catch (e, stackTrace) {
      // Log detailed error for debugging
      print('Unexpected error: ${e.runtimeType} - $e');
      print(stackTrace);

      // Return generic error to user
      return Left(
        ServerFailure('Something went wrong. Please try again later.'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Item>>> fetchBooks() async {
    try {
      final data = await apiServices.get(
        endPoint: 'volumes?q=books&filter=free-ebooks&maxResults=40',
      );

      final bookModel = BookModel.fromJson(data);
      return Right(bookModel.items ?? []);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioException(dioError));
    } catch (e, stackTrace) {
      // Log detailed error for debugging
      print('Unexpected error: ${e.runtimeType} - $e');
      print(stackTrace);

      // Return generic error to user
      return Left(
        ServerFailure('Something went wrong. Please try again later.'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Item>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      final data = await apiServices.get(
        endPoint:
            'volumes?q=subject:fiction&filter=free-ebooks&orderBy=relevance',
      );

      final bookModel = BookModel.fromJson(data);
      return Right(bookModel.items ?? []);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioException(dioError));
    } catch (e, stackTrace) {
      // Log detailed error for debugging
      print('Unexpected error: ${e.runtimeType} - $e');
      print(stackTrace);

      // Return generic error to user
      return Left(
        ServerFailure('Something went wrong. Please try again later.'),
      );
    }
  }
}
