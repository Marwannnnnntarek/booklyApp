part of 'best_seller_books_cubit.dart';

sealed class BestSellerBooksState extends Equatable {
  const BestSellerBooksState();

  @override
  List<Object> get props => [];
}

final class BestSellerBooksInitial extends BestSellerBooksState {}

final class BestSellerBooksLoading extends BestSellerBooksState {}

final class BestSellerBooksSuccess extends BestSellerBooksState {
  final List<Item> books;

  const BestSellerBooksSuccess(this.books);
}

final class BestSellerBooksFailure extends BestSellerBooksState {
  final String errMessage;

  const BestSellerBooksFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
