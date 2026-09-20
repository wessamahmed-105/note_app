import 'package:flutter/material.dart';

import '../pages/archived_page.dart';
import '../pages/deleted_page.dart';
import '../pages/reminder_page.dart';
import '../pages/loading_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  void _navigateWithLoading(BuildContext context, Widget targetPage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoadingPage()),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => targetPage),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onTap: () => _navigateWithLoading(context, const ArchivedPage()),
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.redAccent),
            title: const Text("Deleted"),
            onTap: () => _navigateWithLoading(context, const DeletedPage()),
          ),
          ListTile(
            leading: const Icon(Icons.alarm, color: Colors.orange),
            title: const Text("Reminders"),
            onTap: () => _navigateWithLoading(context, const ReminderPage()),
          ),
        ],
      ),
    );
  }
}
