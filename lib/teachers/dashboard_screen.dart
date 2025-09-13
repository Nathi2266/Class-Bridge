import 'package:flutter/material.dart';
import 'assignments_screen.dart';
import 'class_schedule_screen.dart';
import 'student_management_screen.dart';
import 'notifications_screen.dart';

class TeacherDashboardScreen extends StatelessWidget {
  const TeacherDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teacher Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text('Assignments'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TeacherAssignmentsScreen()),
            ),
          ),
          ListTile(
            title: const Text('Class Schedule'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TeacherClassScheduleScreen()),
            ),
          ),
          ListTile(
            title: const Text('Student Management'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TeacherStudentManagementScreen()),
            ),
          ),
          ListTile(
            title: const Text('Notifications'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TeacherNotificationsScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
