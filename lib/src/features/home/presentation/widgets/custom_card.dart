import 'package:book_store/src/core/constants/constants.dart';
import 'package:book_store/src/features/home/domain/entities/book_entity.dart';
import 'package:book_store/src/features/home/presentation/pages/book_details_page.dart';
import 'package:book_store/src/features/home/presentation/widgets/favorite_icon_widget.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final BookEntity book;

  const CustomCard({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          BookDetailsPage.id,
          arguments: book,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black12,
                    spreadRadius: 0,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              height: 200,
              width: 200,
              child: Card(
                elevation: 3,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        book.title!,
                        maxLines: 2,
                        style: TextStyle(color: Colors.black38),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text('', style: TextStyle(color: kTextDarkColor)),

                          FavoritIcon(book: book),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              left: 70,
              bottom: 100,
              child: Image.network(book.imageLink ?? '', height: 80, width: 80),
            ),
          ],
        ),
      ),
    );
  }
}

