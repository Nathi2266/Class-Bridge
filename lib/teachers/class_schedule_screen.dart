import 'package:flutter/material.dart';
import 'dart:ui'; // Import for ImageFilter
import 'teacher_base_screen.dart'; // Import TeacherBaseScreen

class TeacherClassScheduleScreen extends StatefulWidget {
  const TeacherClassScheduleScreen({super.key});

  @override
  State<TeacherClassScheduleScreen> createState() => _TeacherClassScheduleScreenState();
}

class _TeacherClassScheduleScreenState extends State<TeacherClassScheduleScreen> {
  final List<String> _classes = ['Math Grade 10', 'English Grade 9', 'History Grade 11'];

  void _addClass() {
    // Implement logic to add a new class
    // For now, just add a placeholder
    setState(() {
      _classes.add('New Class ${(_classes.length + 1)}');
    });
  }

  void _manageStudents(String className) {
    // Implement logic to manage students for a specific class
    // Navigator.push(context, MaterialPageRoute(builder: (context) => StudentManagementScreen(className: className)));
  }

  @override
  Widget build(BuildContext context) {
    return TeacherBaseScreen(
      appBarTitle: 'Classes',
      floatingActionButton: FloatingActionButton(
        onPressed: _addClass,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      child: _classes.isEmpty
          ? const Center(child: Text('No classes added yet. Tap + to add one!'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _classes.length,
              itemBuilder: (context, index) {
                final className = _classes[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Card(
                      elevation: 0,
                      color: Colors.white.withAlpha((255 * 0.3).round()),
                      margin: const EdgeInsets.only(bottom: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              className,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Students: 25'), // Placeholder
                                ElevatedButton(
                                  onPressed: () => _manageStudents(className),
                                  child: const Text('Manage Students'),
                                ),
                              ],
                            ),
                          ],
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
