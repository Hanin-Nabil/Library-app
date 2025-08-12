import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';

part 'searchbook_state.dart';

class SearchbookCubit extends Cubit<SearchbookState> {
  SearchbookCubit(this.homeRepo) : super(SearchbookInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSearchBook(String query) async {
    emit(SearchbookLoading());
    var result = await homeRepo.fetchSearchBook(query: query);
    result.fold((Failure) {
      emit(SearchbookFailure(Failure.errorMessage));
    }, (books) {
      emit(SearchtbookSuccess(books));
    });
  }
}
