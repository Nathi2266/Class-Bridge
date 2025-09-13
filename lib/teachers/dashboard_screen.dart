import 'package:flutter/material.dart';
import 'assignments_screen.dart';
import 'class_schedule_screen.dart';
import 'notifications_screen.dart';
import 'dashboard_content.dart';
import 'teacher_base_screen.dart'; // Import the new base screen

class TeacherDashboardScreen extends StatefulWidget {
  const TeacherDashboardScreen({super.key});

  @override
  State<TeacherDashboardScreen> createState() => _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState extends State<TeacherDashboardScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const TeacherDashboardContent(), // Placeholder for Dashboard
    const TeacherAssignmentsScreen(),
    const TeacherClassScheduleScreen(), // Assuming Class Schedule is now 'Classes'
    const TeacherNotificationsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TeacherBaseScreen(
      appBarTitle: 'Teacher Dashboard',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement action for floating action button on dashboard
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Assignments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Classes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      child: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
