import 'package:book_store/src/core/components/custom_button.dart';
import 'package:book_store/src/core/helpers/show_snak_bar_message.dart';
import 'package:book_store/src/features/authentication/presentation/widgets/custom_form_textfield.dart';
import 'package:book_store/src/core/constants/constants.dart';
import 'package:book_store/src/core/utils/assets_data.dart';
import 'package:book_store/src/features/authentication/presentation/pages/signup_page.dart';
import 'package:book_store/src/features/home/presentation/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      color: kPrimaryColor,
      child: Padding(
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
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          isLoading = true;
                          setState(() {});

                          await signIn();
                          showMessage(context, 'success!');
                          Navigator.pushNamed(context, HomePage.id);
                        } on FirebaseAuthException catch (firebaseEx) {
                          if (firebaseEx.code == 'user-not-found') {
                            showMessage(context, 'User not found!');
                          } else if (firebaseEx.code == 'invalid-credential') {
                            showMessage(context, 'Invalid credential');
                          } else if (firebaseEx.code == 'rejected-credential') {
                            showMessage(context, 'rejected credential');
                          } else {
                            showMessage(context, 'Auth Error');
                          }
                        } catch (ex) {
                          showMessage(context, 'Error!');
                        }

                        isLoading = false;
                        setState(() {});
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
                          Navigator.pushReplacementNamed(context, SignUpPage.id);
                        },
                        child: Text(
                          ' Sign Up ',
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
      ),
    );
  }

  Future<void> signIn() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
