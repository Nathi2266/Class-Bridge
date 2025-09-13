import 'package:flutter/material.dart';

class TeacherAssignmentsScreen extends StatelessWidget {
  const TeacherAssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Assignments')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add assignment creation logic
          },
          child: const Text('Create New Assignment'),
        ),
      ),
    );
  }
}
