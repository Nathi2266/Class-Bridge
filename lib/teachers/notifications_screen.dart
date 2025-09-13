import 'package:flutter/material.dart';
import 'dart:ui'; // Import for ImageFilter
import 'teacher_base_screen.dart'; // Import TeacherBaseScreen

class TeacherNotificationsScreen extends StatefulWidget {
  const TeacherNotificationsScreen({super.key});

  @override
  State<TeacherNotificationsScreen> createState() => _TeacherNotificationsScreenState();
}

class _TeacherNotificationsScreenState extends State<TeacherNotificationsScreen> {
  final List<String> _notifications = [
    'New assignment posted: Math Chapter 5',
    'Reminder: Parent-teacher conference tomorrow at 3 PM',
    'Student John Doe submitted late assignment.',
  ];

  void _sendNotification() {
    // Implement logic to send a new notification
    // For now, add a placeholder notification
    setState(() {
      _notifications.add('New announcement from administrator.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TeacherBaseScreen(
      appBarTitle: 'Notifications',
      floatingActionButton: FloatingActionButton(
        onPressed: _sendNotification,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add_comment),
      ),
      child: _notifications.isEmpty
          ? const Center(child: Text('No notifications yet.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Card(
                      elevation: 0,
                      color: Colors.white.withAlpha((255 * 0.3).round()),
                      margin: const EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          notification,
                          style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
