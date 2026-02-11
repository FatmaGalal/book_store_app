import 'package:book_store/src/core/components/custom_form_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            CustomFormTextfield(
              textFieldHint: 'User Name',
              onChanged: (data) {},
            ),
            SizedBox(height: 12),
            CustomFormTextfield(
              textFieldHint: 'Password',
              onChanged: (data) {},
              obscarText: true,
            ),
          ],
        ),
      ),
    );
  }
}
