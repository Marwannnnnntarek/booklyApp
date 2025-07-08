import 'package:bloc/bloc.dart';
import 'package:bookly/feature/home/data/models/book_model/item.dart';
import 'package:bookly/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarBoosk({required String category}) async {
    emit(SimilarBooksLoading());
    final result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) => emit(SimilarBooksFailure(failure.errMessage)),
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }
}
