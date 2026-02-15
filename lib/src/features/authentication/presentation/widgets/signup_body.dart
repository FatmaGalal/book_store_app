import 'package:book_store/src/core/components/custom_button.dart';
import 'package:book_store/src/features/authentication/presentation/providers/validators.dart';
import 'package:book_store/src/features/authentication/presentation/providers/authentication_provider.dart';
import 'package:book_store/src/features/authentication/presentation/widgets/custom_form_textfield.dart';
import 'package:book_store/src/core/constants/constants.dart';
import 'package:book_store/src/core/utils/assets_data.dart';
import 'package:book_store/src/core/helpers/show_snak_bar_message.dart';
import 'package:book_store/src/features/authentication/presentation/pages/login_page.dart';
import 'package:book_store/src/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  bool isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final AuthenticationProvider _authenticationProvider =
      AuthenticationProvider();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
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
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textFieldHint: 'User Name',
                    onChanged: (data) {
                      _emailController.text = data;
                    },
                    validator: Validators.email,
                  ),

                  SizedBox(height: 12),

                  CustomFormTextfield(
                    controller: _passwordController,
                    textFieldHint: 'Password',
                    textInputAction: TextInputAction.next,
                    onChanged: (data) {
                      _passwordController.text = data;
                    },
                    obscureText: true,
                    validator: Validators.password,
                  ),

                  SizedBox(height: 12),

                  CustomFormTextfield(
                    controller: _confirmPasswordController,
                    textFieldHint: 'Confirm Password',
                    textInputAction: TextInputAction.done,
                    onChanged: (data) {
                      _confirmPasswordController.text = data;
                    },

                    obscureText: true,
                    validator: (value) => Validators.confirmPassword(
                      value,
                      _passwordController.text.trim(),
                    ),
                  ),

                  SizedBox(height: 24),

                  CustomButton(
                    buttonText: 'Sign Up',
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => isLoading = true);

                        try {
                          await _authenticationProvider.registerNewUser(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                          showMessage(context, 'success!');
                          Navigator.pushReplacementNamed(context, HomePage.id);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            showMessage(
                              context,
                              'The password provided is too weak.!',
                            );
                          } else if (ex.code == 'email-already-in-use') {
                            showMessage(
                              context,
                              'The account already exists for that email.',
                            );
                          }
                        } catch (ex) {
                          showMessage(context, 'Error!');
                        } finally {
                          if (mounted) {
                            setState(() => isLoading = false);
                          }
                        }
                      }
                    },
                  ),

                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You already have an account! ',
                        style: TextStyle(fontSize: 16, color: kPrimaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, LoginPage.id);
                        },
                        child: Text(
                          ' Login',
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
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
