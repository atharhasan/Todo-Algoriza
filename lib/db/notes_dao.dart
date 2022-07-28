import 'package:flutter/material.dart';
import 'package:todo_app/db/database_provider.dart';
import 'package:todo_app/models/notes.dart';

class NotesDao {
  final dbProvider = DatabaseProvider.dbProvider;

  // Future<int> createTask(Notes notes) async {
  //   final db = await dbProvider.database;
  //   var result = db.insert(tableNotes, notes.toJson());
  //   debugPrint('create new note');
  //   return result;
  // }

  Future<List<Notes>> getAllNotes() async {
    final db = await dbProvider.database;

    final orderBy = '${NotesField.title} ASC';

    final result = await db.query(tableNotes, orderBy: orderBy);

    return result.map((json) => Notes.fromJson(json)).toList();
  }

  Future<int> updateNotes(Notes notes) async {
    final db = await dbProvider.database;

    var result = await db.update(tableNotes, notes.toJson(),
        where: "id = ?", whereArgs: [notes.id]);

    return result;
  }

  Future<int> deleteNotes(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(tableNotes, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  Future deleteAllNotes() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      tableNotes,
    );

    return result;
  }
}
