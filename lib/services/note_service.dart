import 'package:hive_flutter/hive_flutter.dart';

import '../models/note_model.dart';

class NoteService {
  final Box _notesBox = Hive.box('notesBox');

  void addNote(NoteModel note) {
    _notesBox.add(note);
  }

  void deleteNote(int index) {
    final note = _notesBox.getAt(index) as NoteModel;
    note.isDeleted = true;
    _notesBox.putAt(index, note);
  }

  void archiveNote(int index) {
    final note = _notesBox.getAt(index) as NoteModel;
    note.isArchived = true;
    _notesBox.putAt(index, note);
  }

  void setReminder(int index) {
    final note = _notesBox.getAt(index) as NoteModel;
    note.isReminder = true;
    _notesBox.putAt(index, note);
  }
}
