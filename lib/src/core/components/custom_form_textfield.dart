import 'package:book_store/src/core/constants/constants.dart';
import 'package:flutter/material.dart';


class CustomFormTextfield extends StatelessWidget {
 const CustomFormTextfield({
    super.key,
    required this.textFieldHint,
    this.obscarText = false,
    this.onChanged,
  });
  final String textFieldHint;
  final Function(String)? onChanged;

  final bool obscarText;
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
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
      ),
      cursorColor: kPrimaryColor,
    );
  }
}
