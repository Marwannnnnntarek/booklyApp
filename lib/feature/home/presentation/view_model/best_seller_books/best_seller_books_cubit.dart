import 'package:bloc/bloc.dart';
import 'package:bookly/feature/home/data/models/book_model/item.dart';
import 'package:bookly/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_seller_books_state.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  BestSellerBooksCubit(this.homeRepo) : super(BestSellerBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchBestSellerBoosk() async {
    emit(BestSellerBooksLoading());
    final result = await homeRepo.fetchBestSellersBooks();
    result.fold(
      (failure) => emit(BestSellerBooksFailure(failure.errMessage)),
      (books) => emit(BestSellerBooksSuccess(books)),
    );
  }
}
