class BookEntity {
  final String? bookId;
  final String? kind;
  final String? title;
  final String? authors;
  final String? categories;
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
