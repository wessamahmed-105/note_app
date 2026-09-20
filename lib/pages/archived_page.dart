import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/note_model.dart';

class ArchivedPage extends StatelessWidget {
  const ArchivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notesBox = Hive.box<NoteModel>('notesBox');
    final archivedNotes = notesBox.values.where((n) => n.isArchived).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Archived Notes"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: archivedNotes.length,
        itemBuilder: (context, index) {
          final note = archivedNotes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
          );
        },
      ),
    );
  }
}
