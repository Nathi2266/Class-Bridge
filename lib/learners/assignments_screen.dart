import 'package:flutter/material.dart';

class LearnerAssignmentsScreen extends StatelessWidget {
  const LearnerAssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Assignments')),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Math Homework - Due Tomorrow'),
            subtitle: Text('Algebra: Chapter 5'),
          ),
          ListTile(
            title: Text('Science Project - Due Next Week'),
            subtitle: Text('Photosynthesis Experiment'),
          ),
        ],
      ),
    );
  }
}
