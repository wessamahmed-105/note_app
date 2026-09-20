import 'package:flutter/material.dart';
import 'package:note_app/pages/account_page.dart';
import 'package:note_app/pages/archived_page.dart';
import 'package:note_app/pages/deleted_page.dart';
import 'package:note_app/pages/reminder_page.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = List.generate(20, (index) => "Note ${index + 1}");

    return Scaffold(
      appBar: AppBar(title: const Text("My Notes")),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.yellow),
              child: Text(
                "Note App Menu",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.archive, color: Colors.blueGrey),
              title: const Text("Archived"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ArchivedPage()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.redAccent),
              title: const Text("Deleted"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DeletedPage()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.alarm, color: Colors.orange),
              title: const Text("Reminders"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReminderPage()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.green),
              title: const Text("Account"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AccountPage()),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Card(child: ListTile(title: Text(notes[index])));
        },
      ),
    );
  }
}
