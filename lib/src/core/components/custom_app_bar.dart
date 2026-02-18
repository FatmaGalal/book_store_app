import 'package:book_store/src/core/components/custom_text_field.dart';
import 'package:book_store/src/core/components/custom_icon.dart';
import 'package:book_store/src/core/constants/constants.dart';
import 'package:book_store/src/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.icon,
    required this.title,
    this.onPress,
    this.isSearch = false,
    this.onTextChanged,
    this.hasBackButton = false,
    this.onBackPressed,
  });
  final IconData icon;
  final String title;
  final bool isSearch;
  final bool hasBackButton;
  final void Function()? onPress;
  final void Function(String?)? onTextChanged;
  final void Function()? onBackPressed;
  @override
  Widget build(BuildContext context) {
    //final canGoBack = Navigator.canPop(context);
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if(hasBackButton)
          IconButton(
            icon: const Icon(Icons.arrow_back, color: kPrimaryColor,),
            onPressed: onBackPressed,
          ),
         
          /// -- logo------
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Image.asset(AssetsData.book, width: 60, height: 60),
          ),

          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),

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
