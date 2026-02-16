import 'package:book_store/src/core/errors/failure.dart';
import 'package:book_store/src/features/home/domain/entities/book_entity.dart';
import 'package:book_store/src/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchBookListUseCase {
  final HomeRepo homeRepo;

  FetchBookListUseCase({required this.homeRepo});

  Future<Either<Failure, List<BookEntity>>> fetchBookList(){
    return homeRepo.fetchBookList();
  }
}
