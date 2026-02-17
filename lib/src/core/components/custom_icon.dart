import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(this.onPress,  {super.key, required this.icon});
final IconData icon;
 final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
  
    return Center(
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
        
        color: Colors.white10, ),
        child: Center(child: IconButton(onPressed:onPress, icon: Icon(icon), iconSize: 28,)),
      ),
    );
  }
}