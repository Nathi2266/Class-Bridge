import 'package:flutter/material.dart';

class TeacherNotificationsScreen extends StatelessWidget {
  const TeacherNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add logic to send notifications
          },
          child: const Text('Send Notification to Students'),
        ),
      ),
    );
  }
}
