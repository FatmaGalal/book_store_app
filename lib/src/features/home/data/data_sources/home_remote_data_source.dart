import 'package:book_store/src/core/constants/api_constants.dart';
import 'package:book_store/src/core/utils/api_service.dart';
import 'package:book_store/src/features/home/data/models/book_model.dart';
import 'package:book_store/src/features/home/domain/entities/book_entity.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchBookList();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchBookList()async{
   
    Response<dynamic> data = await apiService.get(endPoint: ApiConstants.bookList);

    List<BookEntity> books = [];

    for (var bookMap in data.data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
