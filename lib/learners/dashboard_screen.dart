import 'package:flutter/material.dart';
import 'assignments_screen.dart';
import 'class_materials_screen.dart';
import 'profile_screen.dart';
import 'learner_base_screen.dart'; // Import the new base screen
import 'dashboard_content.dart';

class LearnerDashboardScreen extends StatefulWidget {
  const LearnerDashboardScreen({super.key});

  @override
  State<LearnerDashboardScreen> createState() => _LearnerDashboardScreenState();
}

class _LearnerDashboardScreenState extends State<LearnerDashboardScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const LearnerDashboardContent(), // Placeholder for Dashboard
    const LearnerAssignmentsScreen(),
    const LearnerClassMaterialsScreen(),
    const LearnerProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LearnerBaseScreen(
      appBarTitle: 'Learner Dashboard',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement action for floating action button on dashboard
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
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
            icon: Icon(Icons.folder_open),
            label: 'Class Materials',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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
