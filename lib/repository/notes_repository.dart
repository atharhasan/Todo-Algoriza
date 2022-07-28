import 'package:todo_app/db/notes_dao.dart';
import 'package:todo_app/models/notes.dart';

class NotesRepository {
  final NotesDao notesDao = NotesDao();

  Future getAllNotes() => notesDao.getAllNotes();

  // Future insertNotes(Notes notes) => notesDao.createTask(notes);

  Future updateNotes(Notes notes) => notesDao.updateNotes(notes);

  Future deleteNotes(int id) => notesDao.deleteNotes(id);

  Future deleteAllNotes() => notesDao.deleteAllNotes();
}
