import 'package:flutter/material.dart';

class TeacherStudentManagementScreen extends StatelessWidget {
  const TeacherStudentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Management')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            title: Text('Student A'),
            subtitle: Text('Progress: 85%'),
          ),
          ListTile(
            title: Text('Student B'),
            subtitle: Text('Progress: 92%'),
          ),
          ListTile(
            title: Text('Student C'),
            subtitle: Text('Progress: 70%'),
          ),
        ],
      ),
    );
  }
}
