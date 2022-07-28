import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:todo_app/constants/appColors.dart';

class CalenderBar extends StatefulWidget {
  const CalenderBar({Key? key}) : super(key: key);

  @override
  State<CalenderBar> createState() => _CalenderBarState();
}

class _CalenderBarState extends State<CalenderBar> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        top: 20,
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 2, color: Colors.grey.shade200))),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: AppColors.primaryColor,
        selectedTextColor: Colors.white,
        dateTextStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }
}
