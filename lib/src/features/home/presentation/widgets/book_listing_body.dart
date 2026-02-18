import 'package:book_store/src/core/components/custom_app_bar.dart';
import 'package:book_store/src/features/home/presentation/widgets/book_listing_view.dart';
import 'package:flutter/material.dart';

class BookListingBody extends StatelessWidget {
  const BookListingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomAppBar(
            title: 'BOOK STORE',

            icon: Icons.bookmark,
            onPress: () {
              //TODO: Nativagte to bookmark page
            },
          ),

          Expanded(child: BooksListView()),
        ],
      ),
    );
  }
}
