import 'package:flutter/material.dart';
import 'dart:ui'; // Import for ImageFilter

class TeacherDashboardContent extends StatelessWidget {
  const TeacherDashboardContent({super.key});

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
                        Column(
                          children: [
                            Text('5', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            Text('Total Classes'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('120', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            Text('Total Students'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('10', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            Text('Pending Assignments'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Upcoming Classes Card
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
                      'Upcoming Classes',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.calendar_today, color: Colors.blueAccent),
                      title: Text('Math Grade 10 - Today, 10:00 AM'),
                      subtitle: Text('Room 101'),
                    ),
                    ListTile(
                      leading: Icon(Icons.calendar_today, color: Colors.blueAccent),
                      title: Text('Science Grade 9 - Tomorrow, 09:00 AM'),
                      subtitle: Text('Lab 2'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Recent Activity Card
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
                      'Recent Activity',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.assignment_turned_in, color: Colors.green),
                      title: Text('Math Homework submitted by John Doe'),
                      subtitle: Text('5 minutes ago'),
                    ),
                    ListTile(
                      leading: Icon(Icons.announcement, color: Colors.orange),
                      title: Text('New announcement in English Grade 8'),
                      subtitle: Text('1 hour ago'),
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
