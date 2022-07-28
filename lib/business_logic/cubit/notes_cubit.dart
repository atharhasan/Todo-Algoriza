// import 'package:flutter/cupertino.dart';
// import 'package:meta/meta.dart';
// import 'package:bloc/bloc.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:todo_app/models/notes.dart';
// import 'package:todo_app/repository/notes_repository.dart';

// part 'notes_state.dart';

// class NotesCubit extends Cubit<NotesState> {
//   NotesCubit() : super(NotesInitial());

//   final _notesRepository = NotesRepository();

//   getAllNotes() async {
//     await _notesRepository.getAllNotes();
//     emit(GetAllNotes());
//   }

//   addNotes(Notes notes) async {
//     await _notesRepository.insertNotes(notes);
//     emit(AddNotes());
//   }

//   updateNotes(Notes notes) async {
//     await _notesRepository.updateNotes(notes);
//     emit(updateNotes(notes));
//   }

//   deleteNote(int id) async {
//     await _notesRepository.deleteNotes(id);
//     emit(DeleteNote());
//   }

//   deleteAllNotes() async {
//     await _notesRepository.deleteAllNotes();
//     emit(DeleteAllNotes());
//   }
// }
