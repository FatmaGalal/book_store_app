import 'package:book_store/src/core/constants/constants.dart';
import 'package:book_store/src/core/helpers/init_hive.dart';
import 'package:book_store/src/features/authentication/presentation/pages/signup_page.dart';
import 'package:book_store/src/features/home/presentation/pages/book_details_page.dart';
import 'package:book_store/src/features/home/presentation/pages/book_listing_page.dart';
import 'package:book_store/src/features/home/presentation/pages/home_page.dart';
import 'package:book_store/src/features/authentication/presentation/pages/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(child: BookStoreApp()));
}

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SignUpPage.id: (context) => SignUpPage(),
        LoginPage.id: (context) => LoginPage(),
        BookListingPage.id: (context) => BookListingPage(),
        BookDetailsPage.id: (context) => BookDetailsPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ).copyWith(scaffoldBackgroundColor: kLightBGColor),

      home: const BookListingPage(),
    );
  }
}
