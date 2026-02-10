import 'dart:async';
import 'package:book_store/utilities/assets_data.dart';
import 'package:book_store/views/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart' show Transition, Get, GetNavigation;


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, HomePage.id);
     //Get.to(HomePage(), transition: Transition.downToUp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        SizedBox(height: 100, child: Image.asset(AssetsData.booklogo)),

        Text(
          'BooK Store',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserra',
          ),
          
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
