import 'package:book_store/src/core/constants/constants.dart';
import 'package:book_store/src/features/authentcation/presentation/pages/signup_page.dart';
import 'package:book_store/src/features/home/presentation/pages/home_page.dart';
import 'package:book_store/src/features/authentcation/presentation/pages/login_page.dart';
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
        SignupPage.id: (context)=>SignupPage(),
        LoginPage.id:(context)=>LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      theme: ThemeData( fontFamily: 'Montserra').copyWith(scaffoldBackgroundColor: kLightBGColor),
     
      home: const LoginPage(),
    );
  }
}
