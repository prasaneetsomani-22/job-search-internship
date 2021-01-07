import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final bool isbackgroundcolor;
  final Function onPressed;
  CustomButton({this.title,this.isbackgroundcolor,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: isbackgroundcolor?Colors.blueAccent:Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isbackgroundcolor? Colors.transparent:Colors.black,
              width: 2
            )
          ),
          alignment: Alignment.center,
          child: Text(title,style: TextStyle(color: isbackgroundcolor?Colors.white:Colors.black,fontSize: 24,fontWeight: FontWeight.w600),)
        ),
      ),
    );
  }
}
