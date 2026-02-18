import 'package:book_store/src/core/constants/constants.dart';
import 'package:book_store/src/features/home/domain/entities/book_entity.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hive/hive.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<BookEntity>>(
  (ref) => FavoritesNotifier(),
);

class FavoritesNotifier extends StateNotifier<List<BookEntity>> {
  FavoritesNotifier() : super([]) {
    _loadFavorites();
  }

  Box<BookEntity> get _box =>
      Hive.box<BookEntity>(kfavoriteBooksBox);

  /// Load from Hive
  void _loadFavorites() {
    state = _box.values.toList();
  }

  /// Check if book is favorite
  bool isFavorite(String bookId) {
    return state.any((book)=>book.bookId==bookId);
  }

  /// Toggle Favorite
  Future<void> toggleFavorite(BookEntity book) async {
    if (_box.containsKey(book.bookId)) {
      await _box.delete(book.bookId);
    } else {
      await _box.put(book.bookId, book);
    }

    _loadFavorites();
  }
}