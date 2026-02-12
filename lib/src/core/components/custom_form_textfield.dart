import 'package:book_store/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
class CustomFormTextfield extends StatelessWidget {
  const CustomFormTextfield({
    super.key,
    required this.textFieldHint,
    this.obscureText = false,
    this.onChanged,
  });

  final String textFieldHint;
  final Function(String)? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
        else{
          return null;
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: textFieldHint,
      
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
      ),
      cursorColor: kPrimaryColor,
    );
  }
}
