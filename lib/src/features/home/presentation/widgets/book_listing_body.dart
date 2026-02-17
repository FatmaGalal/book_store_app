import 'package:book_store/src/core/components/custom_app_bar.dart';
import 'package:book_store/src/features/home/presentation/widgets/book_listing_view.dart';
import 'package:book_store/src/features/home/presentation/widgets/custom_card.dart';
import 'package:book_store/src/features/home/data/data_sources/api_service.dart';
import 'package:book_store/src/features/home/data/data_sources/home_local_data_source.dart';
import 'package:book_store/src/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:book_store/src/features/home/domain/entities/book_entity.dart';

import 'package:flutter/material.dart';

class BookListingBody extends StatelessWidget {
  const BookListingBody({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BooksListView(),
    );
  }
}
