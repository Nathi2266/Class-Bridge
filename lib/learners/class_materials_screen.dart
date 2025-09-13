import 'package:flutter/material.dart';

class LearnerClassMaterialsScreen extends StatelessWidget {
  const LearnerClassMaterialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Class Materials')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            title: Text('Math - Algebra Notes.pdf'),
          ),
          ListTile(
            title: Text('Science - Photosynthesis.pptx'),
          ),
          ListTile(
            title: Text('History - Ancient Civilizations.docx'),
          ),
        ],
      ),
    );
  }
}
