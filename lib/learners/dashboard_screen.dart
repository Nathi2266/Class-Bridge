import 'package:flutter/material.dart';
import 'assignments_screen.dart';
import 'class_materials_screen.dart';
import 'profile_screen.dart';

class LearnerDashboardScreen extends StatelessWidget {
  const LearnerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learner Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text('Assignments'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LearnerAssignmentsScreen()),
            ),
          ),
          ListTile(
            title: const Text('Class Materials'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LearnerClassMaterialsScreen()),
            ),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LearnerProfileScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
