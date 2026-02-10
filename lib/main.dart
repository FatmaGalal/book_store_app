import 'package:book_store/constants.dart';
import 'package:book_store/views/home_page/home_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const BookStoreApp());
}

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id: (context)=> HomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      theme: ThemeData().copyWith(scaffoldBackgroundColor: kLightBGColor),
      home: const HomePage(),
    );
  }
}
