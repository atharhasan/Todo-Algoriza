import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {Key? key,
      required this.txt,
      required this.fontSize,
      this.fontWeight,
      this.fontColor,
      this.textAlign})
      : super(key: key);
  final String txt;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor ?? Colors.black),
      textAlign: textAlign,
    );
  }
}
