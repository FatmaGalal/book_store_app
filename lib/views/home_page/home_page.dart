import 'package:book_store/views/home_page/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'Home Page';
  @override
  Widget build(BuildContext context) {
    return HomeViewBody();
  }
}
