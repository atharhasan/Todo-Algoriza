part of 'tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksInitial extends TasksState {}

class IntialDataBase extends TasksState {}

class AddTaskUpdateValue extends TasksState {}

class CreateDBTable extends TasksState {}

class GetAllNotes extends TasksState {}

class AddNotes extends TasksState {}

class UpdateNotes extends TasksState {}
