import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/notes.dart';
import 'package:todo_app/repository/notes_repository.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  static Database? database;

  final _notesRepository = NotesRepository();
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  final List<String> repeatItem = [
    'None',
    'Daily',
    'Weekly',
    'Monthly',
  ];

  final List<String> remindItem = [
    '10 minutes before',
    '30 minutes before',
    '1 hour before',
    '1 day before'
  ];

  String? remindValue;
  String? repeatValue;

  changeValue(String newValue, String title) {
    if (title == "Remind") {
      remindValue = newValue;
      emit(AddTaskUpdateValue());
    } else {
      repeatValue = newValue;
      emit(AddTaskUpdateValue());
    }
  }

  Future createDB(Database db, int version) async {
    await db.execute('CREATE TABLE $tableNotes ('
        'id INTEGER PRIMARY KEY,'
        'title TEXT,date TEXT,'
        'startTime TEXT,'
        'endTime TEXT,'
        'remind TEXT,'
        'repeat TEXT)');
    debugPrint('Table Created');
  }

  addNewTask() async {
    await database?.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO Tasks(title,date,startTime,endTime,remind,repeat) VALUES("${titleController.text}","${dateController.text}","${startTimeController.text}","${endTimeController.text}","$remindValue","$repeatValue",)');
    });
    emit(AddNotes());
    debugPrint('create new note');
  }

  getAllTasks() {
    database?.rawQuery('SELECT * FROM Tasks').then((value) {
      debugPrint('Users Data Fetched');
      debugPrint(value.toString());
      emit(GetAllNotes());
    });
  }
}
