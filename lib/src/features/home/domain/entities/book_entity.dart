import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class BookEntity {
@HiveType(typeId: 0)
  final String? bookId;
@HiveType(typeId: 1)
  final String? kind;
@HiveType(typeId: 2)
  final String? title;
@HiveType(typeId: 3)
  final String? authors;
@HiveType(typeId: 4)
  final String? categories;
@HiveType(typeId: 5)
  final String? imageLink;

  const BookEntity({
    required this.bookId,
    required this.kind,
    required this.title,
    required this.authors,
    required this.categories,
    required this.imageLink,
  });
}
