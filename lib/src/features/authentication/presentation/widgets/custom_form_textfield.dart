import 'package:book_store/src/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomFormTextfield extends StatelessWidget {
  const CustomFormTextfield({
    super.key,
    required this.textFieldHint,
    this.obscureText = false,
    this.onChanged,
    this.controller, this.validator, this.keyboardType, this.formFieldKey,
  });

  final String textFieldHint;
  final Key? formFieldKey;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  
  final TextInputType? keyboardType;
 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formFieldKey,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
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
