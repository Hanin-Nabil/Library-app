import 'dart:math';

import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo.dart';
import 'package:booklyapp/core/error/failure.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsBook() async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=newest &q=Programming ");

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(FailureServer.fromDioError(e));
      }
      return Left(FailureServer("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  fetchFeaturedBook() async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=relevance&q=computer science ");

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(FailureServer.fromDioError(e));
      }
      return Left(FailureServer("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fechSimilerBook(
      {required String Category}) async {
    try {
      var data = await apiService.get(
          endPoint: "volumes?Filtering=free-ebooks&q=computer science ");

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(FailureServer.fromDioError(e));
      }
      return Left(FailureServer("Unexpected error: ${e.toString()}"));
    }
  }

  @override
 Future<Either<Failure, List<BookModel>>> fetchSearchBook({required String query}) async {
  try {
    var data = await apiService.get(
      endPoint: "volumes?q=$query&filter=free-ebooks"
    );

    if (!data.containsKey('items')) { // 🔄 التحقق من وجود بيانات
      return left(FailureServer("No books found!"));
    }

    List<BookModel> books = (data['items'] as List).map((item) => BookModel.fromJson(item)).toList();

    return right(books);
  } catch (e) {
    if (e is DioException) {
      return left(FailureServer.fromDioError(e));
    }
    return left(FailureServer("Unexpected error: ${e.toString()}"));
  }
}
}
