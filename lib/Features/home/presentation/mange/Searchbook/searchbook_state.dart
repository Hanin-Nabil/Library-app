part of 'searchbook_cubit.dart';

sealed class SearchbookState extends Equatable {
  const SearchbookState();

  @override
  List<Object> get props => [];
}

final class SearchbookInitial extends SearchbookState {}
final class SearchbookLoading extends SearchbookState {}

final class SearchbookFailure extends SearchbookState {
  final String errorMessage;

  const SearchbookFailure(this.errorMessage);
}

final class SearchtbookSuccess extends SearchbookState {
  List<BookModel> books;
  SearchtbookSuccess(this.books);
}

