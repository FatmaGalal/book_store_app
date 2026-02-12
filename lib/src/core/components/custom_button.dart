
import 'package:book_store/src/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
 const CustomButton({super.key,  this.onTab, required  this.buttonText});
 final dynamic buttonText;
 final VoidCallback? onTab;
 
  @override
  Widget build(BuildContext context) {
   
   return  GestureDetector(
    onTap: onTab,
     child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kPrimaryColor,
                  ),
                  child: Center(child: Text('$buttonText',style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),)),
                ),
   );
  }
}