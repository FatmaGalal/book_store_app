import 'package:book_store/src/core/components/custom_text_field.dart';
import 'package:book_store/src/core/components/custom_icon.dart';
import 'package:book_store/src/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.icon,
    required this.title,
    this.onPress,
    this.isSearch = false,
    this.onTextChanged,
  });
  final IconData icon;
  final String title;
  final bool isSearch;
  final void Function()? onPress;
  final void Function(String?)? onTextChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: Row(
        
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 20,color: kPrimaryColor, fontWeight: FontWeight.bold)),
      
          isSearch
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: CustomTextField(
                      hint: 'Search',
                      onChanged: onTextChanged,
                    ),
                  ),
                )
              : Spacer(),
          CustomIcon(onPress, icon: icon),
        ],
      ),
    );
  }
}
