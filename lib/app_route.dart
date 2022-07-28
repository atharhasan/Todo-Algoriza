import 'package:flutter/material.dart';
import 'package:todo_app/business_logic/cubit/cubit/tasks_cubit.dart';
import 'package:todo_app/business_logic/cubit/notes_cubit.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/presentation/screens/home_screen.dart';
import 'package:todo_app/presentation/screens/schedule_screen.dart';
import 'package:todo_app/presentation/screens/task_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider<TasksCubit>(
                  create: (context) => TasksCubit(),
                  child: const HomeScreen(),
                ));
      case addTaskScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider<TasksCubit>(
                  create: (context) => TasksCubit(),
                  child: const TaskScreen(),
                ));
      case scheduleScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider<TasksCubit>(
                  create: (context) => TasksCubit(),
                  child: ScheduleScreen(),
                ));
    }
  }
}
