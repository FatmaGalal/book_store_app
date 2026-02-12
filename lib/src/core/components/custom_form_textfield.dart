import 'package:book_store/src/core/constants/constants.dart';
import 'package:flutter/material.dart';


class CustomFormTextfield extends StatelessWidget {
  CustomFormTextfield({
    super.key,
    required this.textFieldHint,
    this.obscarText = false,
    this.onChanged,
  });
  final String textFieldHint;
  Function(String)? onChanged;

  bool obscarText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscarText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
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
