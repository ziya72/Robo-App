import 'package:flutter/material.dart';
import 'package:robo/components/side_drawer.dart';
import 'members.dart';
import 'events.dart';
import 'projects.dart';
import 'team.dart';
import 'gallery.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontFamily: 'VT323',
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'AMU ROBOCLUB',
                    style: TextStyle(
                      fontFamily: 'PressStart2P',
                      fontSize: 28,
                      color: Colors.cyanAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    _buildTappableBox(
                      context,
                      imagePath: 'assets/images/events.png',
                      label: 'Explore Events',
                      boxColor: Colors.pinkAccent,
                      destination: EventsPage(),
                    ),
                    SizedBox(height: 20),
                    _buildTappableBox(
                      context,
                      imagePath: 'assets/images/projects.png',
                      label: 'Explore Projects',
                      boxColor: Colors.orangeAccent,
                      destination: ProjectsPage(),
                    ),
                    SizedBox(height: 20),
                    _buildTappableBox(
                      context,
                      imagePath: 'assets/images/team.png',
                      label: 'Meet the Team',
                      boxColor: Colors.lightGreenAccent,
                      destination: TeamPage(),
                    ),
                    SizedBox(height: 20),
                    _buildTappableBox(
                      context,
                      imagePath: 'assets/images/member.png',
                      label: 'Become a Member',
                      boxColor: Colors.cyanAccent,
                      destination: MembersPage(),
                    ),
                    SizedBox(height: 20),
                    _buildTappableBox(
                      context,
                      imagePath: 'assets/images/gallery.png',
                      label: 'Gallery',
                      boxColor: Colors.amberAccent,
                      destination: GalleryPage(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTappableBox(
    BuildContext context, {
    required String imagePath,
    required String label,
    required Color boxColor,
    required Widget destination,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => destination));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: boxColor.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: boxColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: boxColor.withValues(alpha: 0.4),
              offset: Offset(3, 3),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(imagePath, height: 50, width: 50, fit: BoxFit.contain),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'VT323',
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
