part of 'similerbook_cubit.dart';

sealed class SimilerbookState extends Equatable {
  const SimilerbookState();

  @override
  List<Object> get props => [];
}

final class SimilerbookInitial extends SimilerbookState {}

final class SimilerbookLoading extends SimilerbookState {}

final class SimilerbookSuccess extends SimilerbookState {
  List<BookModel> books;
  SimilerbookSuccess(this.books);
}

final class SimilerbookFailure extends SimilerbookState {
  final String errorMessage;

  const SimilerbookFailure(this.errorMessage);
}
