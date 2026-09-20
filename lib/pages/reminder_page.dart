import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/note_model.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notesBox = Hive.box<NoteModel>('notesBox');
    final reminderNotes = notesBox.values.where((n) => n.isReminder).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reminder Notes"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: reminderNotes.length,
        itemBuilder: (context, index) {
          final note = reminderNotes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
          );
        },
      ),
    );
  }
}
