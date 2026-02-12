import 'package:book_store/src/features/authentcation/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  static String id = 'Signup Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, LoginPage.id);
        },
        child: Center(child: Text('Sign up'))),
    );
  }
}
