import 'package:book_store/src/core/components/custom_app_bar.dart';
import 'package:book_store/src/core/constants/route_constants.dart';
import 'package:book_store/src/features/home/presentation/widgets/book_datils_body.dart';
import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({super.key});
   static String id = RouteConstants.bookDetailsgPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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

              Expanded(child: BookDatilsBody()),
            ],
          ),
        ),
      ),
    );
  }
}
