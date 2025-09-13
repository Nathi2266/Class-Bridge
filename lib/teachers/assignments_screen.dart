// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui'; // Import for ImageFilter
import 'teacher_base_screen.dart'; // Import TeacherBaseScreen

class TeacherAssignmentsScreen extends StatefulWidget {
  const TeacherAssignmentsScreen({super.key});

  @override
  State<TeacherAssignmentsScreen> createState() => _TeacherAssignmentsScreenState();
}

class _TeacherAssignmentsScreenState extends State<TeacherAssignmentsScreen> {
  List<Map<String, String>> _assignments = [];

  @override
  void initState() {
    super.initState();
    _loadAssignments();
  }

  Future<void> _loadAssignments() async {
    final prefs = await SharedPreferences.getInstance();
    final savedAssignments = prefs.getStringList("assignments") ?? [];
    setState(() {
      _assignments = savedAssignments.map((e) => Map<String, String>.from(json.decode(e))).toList();
    });
  }

  Future<void> _saveAssignments() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedAssignments = _assignments.map((e) => json.encode(e)).toList();
    await prefs.setStringList("assignments", encodedAssignments);
  }

  Future<String?> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      return "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
    }
    return null;
  }

  void _showAssignmentDialog({Map<String, String>? existing, int? index}) {
    final titleController = TextEditingController(text: existing?["title"]);
    final descriptionController = TextEditingController(text: existing?["description"]);
    final notesController = TextEditingController(text: existing?["notes"]);
    String? dueDate = existing?["dueDate"];
    String? submissionDate = existing?["submissionDate"];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(existing == null ? "Create Assignment" : "Edit Assignment"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: "Description"),
                  maxLines: 3,
                ),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Due Date",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () async {
                        final date = await _pickDate(context);
                        if (date != null) {
                          setState(() => dueDate = date);
                        }
                      },
                    ),
                  ),
                  controller: TextEditingController(text: dueDate),
                ),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Submission Date",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () async {
                        final date = await _pickDate(context);
                        if (date != null) {
                          setState(() => submissionDate = date);
                        }
                      },
                    ),
                  ),
                  controller: TextEditingController(text: submissionDate),
                ),
                TextField(
                  controller: notesController,
                  decoration: const InputDecoration(
                    labelText: "Notes (max 200 chars)",
                  ),
                  maxLength: 200,
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                final newAssignment = {
                  "title": titleController.text,
                  "description": descriptionController.text,
                  "dueDate": dueDate ?? "",
                  "submissionDate": submissionDate ?? "",
                  "notes": notesController.text,
                };

                setState(() {
                  if (existing != null && index != null) {
                    _assignments[index] = newAssignment; // update
                  } else {
                    _assignments.add(newAssignment); // create
                  }
                });

                await _saveAssignments();
                Navigator.pop(context);
              },
              child: const Text("Done"),
            ),
          ],
        );
      },
    );
  }

  void _deleteAssignment(int index) async {
    setState(() {
      _assignments.removeAt(index);
    });
    await _saveAssignments();
  }

  @override
  Widget build(BuildContext context) {
    return TeacherBaseScreen(
      appBarTitle: "Assignments",
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAssignmentDialog(),
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      child: _assignments.isEmpty
          ? const Center(child: Text("No assignments yet. Tap + to add one."))
          : ListView.builder(
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
                      margin: const EdgeInsets.all(8),
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
                        trailing: PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == "edit") {
                              _showAssignmentDialog(existing: assignment, index: index);
                            } else if (value == "delete") {
                              _deleteAssignment(index);
                            }
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(value: "edit", child: Text("Edit")),
                            const PopupMenuItem(value: "delete", child: Text("Delete")),
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
