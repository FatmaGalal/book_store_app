
import 'package:book_store/src/features/home/presentation/widgets/custom_card.dart';

import 'package:book_store/src/features/home/presentation/providers/books_list_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BooksListView extends ConsumerStatefulWidget {
  const BooksListView({super.key});

  @override
  ConsumerState<BooksListView> createState() =>
      _BooksListPageState();
}

class _BooksListPageState extends ConsumerState<BooksListView> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(booksListProvider.notifier).fetchBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(booksListProvider);

    if (state.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.error != null) {
      return Scaffold(
        body: Center(
          child: Text(state.error!),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Books")),
      body: ListView.builder(
        itemCount: state.books.length,
        itemBuilder: (context, index) {
          final book = state.books[index];

          return CustomCard(book: book);
        },
      ),
    );
  }
}