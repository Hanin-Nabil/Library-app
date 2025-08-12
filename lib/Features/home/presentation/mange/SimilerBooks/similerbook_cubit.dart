import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/home_repo.dart';

part 'similerbook_state.dart';

class SimilerbookCubit extends Cubit<SimilerbookState> {
  SimilerbookCubit(this.homeRepo) : super(SimilerbookInitial());
  final HomeRepo homeRepo;

  Future<void> fechSimilerBook({required String category}) async {
    emit(SimilerbookLoading());
    var result = await homeRepo.fechSimilerBook(Category: category);
    result.fold((Failure) {
      emit(SimilerbookFailure(Failure.errorMessage));
    }, (books) {
      emit(SimilerbookSuccess(books));
    });
  }
}
