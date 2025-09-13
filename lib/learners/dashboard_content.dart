import 'package:flutter/material.dart';
import 'dart:ui'; // Import for ImageFilter

class LearnerDashboardContent extends StatelessWidget {
  const LearnerDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Quick Stats Card
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Card(
              elevation: 0, // Remove elevation as blur handles visual depth
              color: Colors.white.withAlpha((255 * 0.3).round()), // Transparent white
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Stats',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text('3', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              Text('Upcoming Assignments', textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text('5', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              Text('Total Courses', textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text('2', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              Text('Unread Announcements', textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Recent Assignments Card
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Card(
              elevation: 0, // Remove elevation as blur handles visual depth
              color: Colors.white.withAlpha((255 * 0.3).round()), // Transparent white
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Assignments',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.assignment, color: Colors.blueAccent),
                      title: Text('Math Homework - Due Today'),
                      subtitle: Text('Algebra 101'),
                    ),
                    ListTile(
                      leading: Icon(Icons.assignment, color: Colors.blueAccent),
                      title: Text('Science Project - Due Tomorrow'),
                      subtitle: Text('Biology Basics'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Class Materials Quick Access Card
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Card(
              elevation: 0, // Remove elevation as blur handles visual depth
              color: Colors.white.withAlpha((255 * 0.3).round()), // Transparent white
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Class Materials Quick Access',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.book, color: Colors.purpleAccent),
                      title: Text('Biology Chapter 1 Notes'),
                      subtitle: Text('Uploaded: Oct 10'),
                    ),
                    ListTile(
                      leading: Icon(Icons.picture_as_pdf, color: Colors.redAccent),
                      title: Text('Algebra Practice Problems PDF'),
                      subtitle: Text('Uploaded: Oct 08'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
