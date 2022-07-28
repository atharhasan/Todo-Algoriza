import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/models/notes.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await intialDataBase('notes.db');
    return _database!;
  }

  Future<Database> intialDataBase(String filePath) async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, filePath);
    debugPrint('intialDatabase');
    return await openDatabase(path, version: 1, onCreate: createDB);
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
}
