import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newestbooks_state.dart';

class NewestbooksCubit extends Cubit<NewestbooksState> {
  final HomeRepo homeRepo;
  NewestbooksCubit(this.homeRepo) : super(NewestbooksInitial());
  Future<void> fetchNewsBook() async {
    emit(NewestbooksLoading());
    var result = await homeRepo.fetchNewsBook();
    result.fold((Failure) {
    (NewestbooksFailure(Failure.errorMessage));
    }, (books) {
      emit(NewestbooksSuccess(books));
    });
  }
}
