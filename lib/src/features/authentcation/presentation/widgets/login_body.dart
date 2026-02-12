import 'package:book_store/src/core/components/custom_button.dart';
import 'package:book_store/src/core/components/custom_form_textfield.dart';
import 'package:book_store/src/core/constants/constants.dart';
import 'package:book_store/src/core/utils/assets_data.dart';
import 'package:book_store/src/features/authentcation/presentation/pages/signup_page.dart';
import 'package:flutter/cupertino.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SingleChildScrollView(
           
        
          child: Form(
            key: formKey,
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
          
              children: [
                SizedBox(height: 170, child: Image.asset(AssetsData.logo)),
          
                SizedBox(height: 24),
          
                CustomFormTextfield(
                  textFieldHint: 'User Name',
                  onChanged: (data) {
                    email = data;
                  },
                ),
          
                SizedBox(height: 12),
          
                CustomFormTextfield(
                  textFieldHint: 'Password',
                  onChanged: (data) {
                    password = data;
                  },
                  obscureText: true,
                ),
          
                SizedBox(height: 24),
          
                CustomButton(
                  buttonText: 'Login',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                     // TODO: Trigger loading indicator, then submit data to API
                    }
                  },
                ),
          
                SizedBox(height: 16),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You don\'t have an account! ',
                      style: TextStyle(fontSize: 16, color: kPrimaryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignupPage.id);
                      },
                      child: Text(
                        ' Sign-Up ',
                        style: TextStyle(
                          fontSize: 18,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
