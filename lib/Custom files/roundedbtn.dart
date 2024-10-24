import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  // constructer

  final String btnName;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callBack;

  RoundedButton(
      {required this.btnName,
        this.icon,
        this.bgColor = Colors.blue,
        this.textStyle,
        this.callBack});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (


        ) {
      callBack!();
    }, child: icon!=null ? Row(

      children: [
        icon!,
        Text(btnName,style: textStyle,)
      ],
    ):Text(btnName,style: textStyle,),
    style: ElevatedButton.styleFrom(
      shadowColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      )

    ),
    );
  }
}
