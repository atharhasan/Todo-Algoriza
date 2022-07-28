import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/presentation/widgets/text_form_widget.dart';

class TimePickerForm extends StatefulWidget {
  const TimePickerForm({Key? key}) : super(key: key);

  @override
  State<TimePickerForm> createState() => _TimePickerFormState();
}

class _TimePickerFormState extends State<TimePickerForm> {
  TextEditingController inputStartTime = TextEditingController();
  TextEditingController inputEndTime = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectedTime(
      BuildContext context, TextEditingController inputTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (pickedTime != null) {
      DateTime parsedTime =
          // ignore: use_build_context_synchronously
          DateFormat.jm().parse(pickedTime.format(context).toString());
      String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
      setState(() {
        inputTime.text = formattedTime;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    inputStartTime.text = '';
    inputEndTime.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: TextFormWidget(
            txt: 'Start Time',
            hint: '11 Am',
            suffixIcon: const Icon(
              Icons.watch_later_outlined,
              color: Colors.grey,
            ),
            textController: inputStartTime,
            onTap: () {
              _selectedTime(context, inputStartTime);
            },
          ),
        ),
        Expanded(
          child: TextFormWidget(
            txt: 'End Time',
            hint: '11.30 Am',
            suffixIcon: const Icon(
              Icons.watch_later_outlined,
              color: Colors.grey,
            ),
            textController: inputEndTime,
            onTap: () {
              _selectedTime(context, inputEndTime);
            },
          ),
        ),
      ],
    );
  }
}
