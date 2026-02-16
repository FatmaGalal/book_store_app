import 'package:book_store/src/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchBookList();
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchBookList() {
    // TODO: implement fetchBookList
    throw UnimplementedError();
  }
  
}