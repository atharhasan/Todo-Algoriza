import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/presentation/widgets/custom_text.dart';

class HomeItem extends StatelessWidget {
  const HomeItem(
      {Key? key,
      required this.isChecked,
      required this.onChanged,
      required this.txt,
      required this.fontSize})
      : super(key: key);

  final bool isChecked;
  final Function(bool?) onChanged;
  final String txt;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          // activeColor: AppColors.appWhite,
          // fillColor: MaterialStateProperty.all(AppColors.appWhite),
          // checkColor: AppColors.lightBlue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        SizedBox(
          width: width * 0.03,
        ),
        CustomText(txt: txt, fontSize: fontSize)
      ],
    );
  }
}
