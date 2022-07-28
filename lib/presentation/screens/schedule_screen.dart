import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/business_logic/cubit/cubit/tasks_cubit.dart';
import 'package:todo_app/constants/appColors.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/models/notes.dart';
import 'package:todo_app/presentation/widgets/calender_bar.dart';
import 'package:todo_app/presentation/widgets/custom_text.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/widgets/schedul_item.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({Key? key}) : super(key: key);

  List<Notes> notes = [];

  Widget buildListItem(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(builder: (context, index) {
      if (State is GetAllNotes) {
        return SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: notes.length,
              itemBuilder: ((context, index) {
                return SchedulItem(
                    startTimeTxt: notes[index].startTime.toString(),
                    titleTxt: notes[index].title);
              })),
        );
      } else {
        return Container(
            child: CustomText(
          txt: 'No Tasks',
          fontSize: 35,
          textAlign: TextAlign.center,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomText(
            txt: 'Schedule',
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
      body: Column(
        children: [
          const CalenderBar(),
          const SizedBox(
            height: 20,
          ),
          buildListItem(context),
        ],
      ),
    );
  }
}
