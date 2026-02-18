import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? kind;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? authors;
  @HiveField(4)
  final String? categories;
  @HiveField(5)
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
