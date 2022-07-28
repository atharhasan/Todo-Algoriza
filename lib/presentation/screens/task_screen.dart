import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/business_logic/cubit/cubit/tasks_cubit.dart';
import 'package:todo_app/business_logic/cubit/notes_cubit.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/models/notes.dart';
import 'package:todo_app/presentation/widgets/check_color_btn.dart';
import 'package:todo_app/presentation/widgets/custom_button.dart';
import 'package:todo_app/presentation/widgets/remind_drop_down.dart';
import 'package:todo_app/presentation/widgets/custom_text.dart';
import 'package:todo_app/presentation/widgets/date_picker_form.dart';
import 'package:todo_app/presentation/widgets/repeat_drop_down.dart';
import 'package:todo_app/presentation/widgets/text_form_widget.dart';
import 'package:todo_app/presentation/widgets/time_picker_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController addTitleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController remindController = TextEditingController();
  TextEditingController repeateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomText(
            txt: 'Add Task',
            fontSize: 25,
            fontColor: Colors.black,
          ),
          toolbarHeight: 100,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(homeScreen);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ))),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormWidget(
                txt: 'Title',
                hint: 'Add your Task',
                textController: addTitleController,
              ),
              const DatePickerForm(),
              const TimePickerForm(),
              const RemindDropDown(),
              const RepeatDropDown(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          txt: 'Select Color',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CheckColorBtn(),
                      ],
                    ),
                  ),
                  Expanded(
                      child: CustomButton(
                          txt: 'Create a task',
                          onPress: () {
                            BlocProvider.of<TasksCubit>(context).addNewTask();
                            Navigator.of(context).pushNamed(scheduleScreen);
                          })),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
