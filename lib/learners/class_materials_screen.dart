import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui'; // Import for ImageFilter
import 'learner_base_screen.dart'; // Import LearnerBaseScreen

class LearnerClassMaterialsScreen extends StatefulWidget {
  const LearnerClassMaterialsScreen({super.key});

  @override
  State<LearnerClassMaterialsScreen> createState() => _LearnerClassMaterialsScreenState();
}

class _LearnerClassMaterialsScreenState extends State<LearnerClassMaterialsScreen> {
  List<Map<String, String>> _materials = [];

  @override
  void initState() {
    super.initState();
    _loadMaterials(); // Load materials when screen starts
  }

  Future<void> _loadMaterials() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMaterials = prefs.getStringList("classMaterials") ?? [];
    setState(() {
      _materials = savedMaterials.map((e) => Map<String, String>.from(json.decode(e))).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Call _addMockMaterialsIfNeeded here or in initState, but be careful not to loop.
    // For a real app, this data would come from a backend or teacher input.

    return LearnerBaseScreen(
      appBarTitle: 'Class Materials',
      child: _materials.isEmpty
          ? const Center(child: Text('No class materials available.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _materials.length,
              itemBuilder: (context, index) {
                final material = _materials[index];
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
                        title: Text(material["title"] ?? ""),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (material["description"]?.isNotEmpty ?? false)
                              Text("Description: ${material["description"]}"),
                            if (material["uploadDate"]?.isNotEmpty ?? false)
                              Text("Uploaded: ${material["uploadDate"]}"),
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
