import 'package:flutter/material.dart';

class LearnerProfileScreen extends StatelessWidget {
  const LearnerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Name: John Doe', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Grade: 10', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Email: johndoe@email.com', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
