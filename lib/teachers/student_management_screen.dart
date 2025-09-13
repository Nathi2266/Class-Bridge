import 'package:flutter/material.dart';
import 'dart:ui'; // Import for ImageFilter
import 'teacher_base_screen.dart'; // Import TeacherBaseScreen

class TeacherStudentManagementScreen extends StatelessWidget {
  const TeacherStudentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TeacherBaseScreen(
      appBarTitle: 'Student Management',
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 3, // Placeholder for number of students
        itemBuilder: (context, index) {
          // Placeholder student data
          final studentName = 'Student ${String.fromCharCode(65 + index)}';
          final studentProgress = '${85 + index * 2}%';

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
                child: ListTile(
                  title: Text(studentName),
                  subtitle: Text('Progress: $studentProgress'),
                  // Add other student management options here
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
