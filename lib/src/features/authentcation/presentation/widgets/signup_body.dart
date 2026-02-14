import 'package:book_store/src/core/components/custom_button.dart';
import 'package:book_store/src/features/authentcation/domain/validators.dart';
import 'package:book_store/src/features/authentcation/presentation/widgets/custom_form_textfield.dart';
import 'package:book_store/src/core/constants/constants.dart';
import 'package:book_store/src/core/utils/assets_data.dart';
import 'package:book_store/src/core/utils/helpers/show_snak_bar_message.dart';
import 'package:book_store/src/features/authentcation/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  String? email, password, confirmPassword;
  bool isLoading = false;
  
  GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormFieldState<String>> confirmPasswordKey =
      GlobalKey<FormFieldState<String>>();

  

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
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
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                   
                    textFieldHint: 'User Name',
                    onChanged: (data) {
                      email = data;
                    },
                    validator: Validators.email,
                  ),

                  SizedBox(height: 12),

                  CustomFormTextfield(
                    controller: _passwordController,
                    textFieldHint: 'Password',
                    onChanged: (data) {
                      password = data;
                      confirmPasswordKey.currentState?.validate();
                      
                    },
                    obscureText: true,
                    validator: Validators.password,
                  ),

                  SizedBox(height: 12),

                  CustomFormTextfield(
                    formFieldKey: confirmPasswordKey,
                    controller: _confirmPasswordController,
                    textFieldHint: 'Confirm Password',
                    onChanged: (data) {
                      confirmPassword = data;
                    },
                    
                    obscureText: true,
                    validator:(value) => Validators.confirmPassword(value, _passwordController.text),
                  ),

                  SizedBox(height: 24),

                  CustomButton(
                    buttonText: 'Sign Up',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {});

                        try {
                          await registerNewUser();
                          showMessage(context, 'success!');
                          Navigator.pushNamed(context, LoginPage.id);
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
                        'You already have an account! ',
                        style: TextStyle(fontSize: 16, color: kPrimaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginPage.id);
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

  Future<void> registerNewUser() async {
    var firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
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
