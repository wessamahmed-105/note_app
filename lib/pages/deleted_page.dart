import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/note_model.dart';

class DeletedPage extends StatelessWidget {
  const DeletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notesBox = Hive.box<NoteModel>('notesBox');
    final deletedNotes = notesBox.values.where((n) => n.isDeleted).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Deleted Notes"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: deletedNotes.length,
        itemBuilder: (context, index) {
          final note = deletedNotes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
          );
        },
      ),
    );
  }
}
