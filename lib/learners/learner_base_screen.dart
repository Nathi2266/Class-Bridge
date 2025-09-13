import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LearnerBaseScreen extends StatelessWidget {
  final Widget child;
  final String appBarTitle;
  final BottomNavigationBar? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;

  const LearnerBaseScreen({
    super.key,
    required this.child,
    this.appBarTitle = '',
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allow body to extend behind AppBar
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove AppBar shadow
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'lib/assets/solid_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Color Filter Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha((255 * 0.4).round()), // Dark overlay
            ),
          ),
          // Main Content
          SafeArea(
            child: child,
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
