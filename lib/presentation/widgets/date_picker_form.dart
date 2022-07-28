// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/presentation/widgets/text_form_widget.dart';

class DatePickerForm extends StatefulWidget {
  const DatePickerForm({Key? key}) : super(key: key);

  @override
  State<DatePickerForm> createState() => _DatePickerFormState();
}

class _DatePickerFormState extends State<DatePickerForm> {
  TextEditingController inputDate = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selecteDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2121));
    if (picked != null && picked != selectedDate) {
      String formatDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        inputDate.text = formatDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    inputDate.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormWidget(
      txt: 'Date',
      hint: 'Select Date',
      suffixIcon: Icon(
        Icons.calendar_month_rounded,
        color: Colors.grey,
      ),
      textController: inputDate,
      onTap: () {
        _selecteDate(context);
      },
    );
  }
}
