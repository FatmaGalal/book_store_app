import 'package:book_store/src/core/components/custom_button.dart';
import 'package:book_store/src/core/helpers/show_snak_bar_message.dart';
import 'package:book_store/src/features/authentication/domain/firebase_auth_errors.dart';
import 'package:book_store/src/features/authentication/presentation/providers/login_provider.dart';
import 'package:book_store/src/features/authentication/presentation/providers/validators.dart';
import 'package:book_store/src/features/authentication/presentation/widgets/custom_form_textfield.dart';
import 'package:book_store/src/core/constants/constants.dart';
import 'package:book_store/src/core/utils/assets_data.dart';
import 'package:book_store/src/features/authentication/presentation/pages/signup_page.dart';
import 'package:book_store/src/features/home/presentation/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginBody extends ConsumerStatefulWidget {
  const LoginBody({super.key});

  @override
  ConsumerState<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends ConsumerState<LoginBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  //bool isLoading = false;

  //final AuthService _authenticationProvider = AuthService();

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(loginProvider);

    ref.listen(loginProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          Navigator.pushReplacementNamed(context, HomePage.id);
        },
        error: (ex, _) {
          showMessage(context, firebaseAuthError(ex as FirebaseAuthException));
        },
      );
    });

    return ModalProgressHUD(
      inAsyncCall: provider.isLoading,
      progressIndicator: CircularProgressIndicator(color: kPrimaryColor),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(height: 170, child: Image.asset(AssetsData.logo)),
                  SizedBox(height: 24),
                  CustomFormTextfield(
                    validator: Validators.requiredField,
                    textFieldHint: 'User Name',
                    onChanged: (data) {
                      // _emailController.text = data;
                    },
                  ),

                  SizedBox(height: 12),

                  CustomFormTextfield(
                    validator: Validators.requiredField,
                    textFieldHint: 'Password',
                    onChanged: (data) {
                      _passwordController.text = data;
                    },
                    obscureText: true,
                  ),

                  SizedBox(height: 24),

                  CustomButton(
                    buttonText: 'Login',
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        ref.read(loginProvider.notifier).login();
                        // setState(() => isLoading = true);
                        // try {
                        //   await _authenticationProvider.signIn(
                        //     email: _emailController.text.trim(),
                        //     password: _passwordController.text.trim(),
                        //   );
                        //   showMessage(context, 'success!');
                        //   Navigator.pushReplacementNamed(context, HomePage.id);
                        // } on FirebaseAuthException catch (firebaseEx) {
                        //   if (firebaseEx.code == 'user-not-found') {
                        //     showMessage(context, 'User not found!');
                        //   } else if (firebaseEx.code == 'invalid-credential') {
                        //     showMessage(context, 'Invalid credential');
                        //   } else if (firebaseEx.code == 'rejected-credential') {
                        //     showMessage(context, 'rejected credential');
                        //   } else {
                        //     showMessage(context, 'Auth Error');
                        //   }
                        // } catch (ex) {
                        //   showMessage(context, 'Error!');
                        // } finally {
                        //   if (mounted) {
                        //   //  setState(() => isLoading = false);
                        //   }
                        // }
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
                          Navigator.pushReplacementNamed(
                            context,
                            SignUpPage.id,
                          );
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
