import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewsBook();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBook();
  Future<Either<Failure, List<BookModel>>> fechSimilerBook(
      {required String Category});
  Future<Either<Failure, List<BookModel>>> fetchSearchBook({required String query});   
}
