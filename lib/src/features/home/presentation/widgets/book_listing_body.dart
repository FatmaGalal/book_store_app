import 'package:book_store/src/core/components/custom_app_bar.dart';

import 'package:flutter/material.dart';

class BookListingBody extends StatelessWidget{
  const BookListingBody({super.key});

  @override
  Widget build(BuildContext context) {
   
   return Column(
    children: [
      CustomAppBar(icon: Icons.search, onPress: (){}, title: 'Books', isSearch: true,),
      TextField(),
    ],
   );
  }
}