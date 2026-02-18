import 'package:book_store/src/core/constants/constants.dart';
import 'package:book_store/src/features/home/domain/entities/book_entity.dart';
import 'package:book_store/src/features/home/presentation/pages/book_details_page.dart';
import 'package:book_store/src/features/home/presentation/providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomCard extends StatelessWidget {
  final BookEntity book;

  const CustomCard({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, BookDetailsPage.id, arguments:  book);
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
                        maxLines: 3,
                        style: TextStyle(color: Colors.black38),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text('', style: TextStyle(color: kTextDarkColor)),
                          // Icon(Icons.favorite, color: kIconActiveColor1),
                           Consumer(
                          builder: (context, ref, _) {
                            final favorites = ref.watch(favoritesProvider);
                            final isFav = favorites.any(
                              (b) => b.bookId == book.bookId,
                            );
                            final notifier = ref.read(
                              favoritesProvider.notifier,
                            );
                           
                            return IconButton(
                              icon: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: isFav
                                    ? kIconActiveColor1
                                    : kIconDimmedColor1,
                              ),
                              onPressed: () {
                                notifier.toggleFavorite(book);
                              },
                            );
                          },
                        ),
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
