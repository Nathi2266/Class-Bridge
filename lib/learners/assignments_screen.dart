import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui'; // Import for ImageFilter
import 'learner_base_screen.dart'; // Import LearnerBaseScreen

class LearnerAssignmentsScreen extends StatefulWidget {
  const LearnerAssignmentsScreen({super.key});

  @override
  State<LearnerAssignmentsScreen> createState() => _LearnerAssignmentsScreenState();
}

class _LearnerAssignmentsScreenState extends State<LearnerAssignmentsScreen> {
  List<Map<String, String>> _assignments = [];

  @override
  void initState() {
    super.initState();
    _loadAssignments(); // Load assignments when screen starts
  }

  Future<void> _loadAssignments() async {
    final prefs = await SharedPreferences.getInstance();
    final savedAssignments = prefs.getStringList("assignments") ?? [];
    setState(() {
      _assignments = savedAssignments.map((e) => Map<String, String>.from(json.decode(e))).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LearnerBaseScreen(
      appBarTitle: 'Assignments',
      child: _assignments.isEmpty
          ? const Center(child: Text('No assignments available.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _assignments.length,
              itemBuilder: (context, index) {
                final assignment = _assignments[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Card(
                      elevation: 0,
                      color: Colors.white.withAlpha((255 * 0.3).round()),
                      margin: const EdgeInsets.only(bottom: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        title: Text(assignment["title"] ?? ""),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (assignment["description"]?.isNotEmpty ?? false)
                              Text("Description: ${assignment["description"]}"),
                            if (assignment["dueDate"]?.isNotEmpty ?? false)
                              Text("Due Date: ${assignment["dueDate"]}"),
                            if (assignment["submissionDate"]?.isNotEmpty ?? false)
                              Text("Submission Date: ${assignment["submissionDate"]}"),
                            if (assignment["notes"]?.isNotEmpty ?? false)
                              Text("Notes: ${assignment["notes"]}"),
                          ],
                        ),
                        // Learner can view, but no edit/delete options here
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
