import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/constants/appColors.dart';

class CheckColorBtn extends StatefulWidget {
  const CheckColorBtn({Key? key}) : super(key: key);

  @override
  State<CheckColorBtn> createState() => _CheckColorBtnState();
}

class _CheckColorBtnState extends State<CheckColorBtn> {
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedColor = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: index == 0
                  ? AppColors.appBlue
                  : index == 1
                      ? AppColors.appRed
                      : index == 2
                          ? AppColors.appPurple
                          : index == 3
                              ? AppColors.appOrange
                              : AppColors.appGreen,
              child: selectedColor == index
                  ? Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 16,
                    )
                  : Container(),
            ),
          ),
        );
      }),
    );
  }
}
