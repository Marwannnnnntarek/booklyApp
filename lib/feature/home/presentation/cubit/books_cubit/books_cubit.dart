import 'package:bloc/bloc.dart';
import 'package:bookly/core/data/models/book_model/item.dart';
import 'package:bookly/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.homeRepo) : super(BooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchBoosk() async {
    emit(BooksLoading());
    final result = await homeRepo.fetchBooks();
    result.fold(
      (failure) => emit(BooksFailure(failure.errMessage)),
      (books) => emit(BooksSuccess(books)),
    );
  }
}
