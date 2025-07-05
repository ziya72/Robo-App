import 'package:flutter/material.dart';
import 'package:robo/components/side_drawer.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  bool showOngoing = false;
  bool showCompleted = false;

  final List<Map<String, dynamic>> projects = [
    {
      'name': 'Line Bot',
      'date': '11-08-2025',
      'image': 'assets/projects/project2.png',
      'completion': 20,
      'isOngoing': true,
    },
    {
      'name': 'Hand Gesture Bot',
      'date': '14-02-2025',
      'image': 'assets/projects/project1.png',
      'completion': 60,
      'isOngoing': true,
    },
    {
      'name': 'Mind control robot',
      'date': '23-05-2024',
      'image': 'assets/projects/project2.png',
      'completion': 100,
      'isOngoing': false,
    },
    {
      'name': 'Something XYZ',
      'date': '13-01-2024',
      'image': 'assets/projects/project1.png',
      'completion': 100,
      'isOngoing': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProjects =
        projects.where((project) {
          if (showOngoing && !project['isOngoing']) return false;
          if (showCompleted && project['isOngoing']) return false;
          return true;
        }).toList();

    return Layout(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'OUR PROJECTS',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                fontSize: 18,
                color: Colors.cyanAccent,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFilterButton('Ongoing', showOngoing, () {
                  setState(() => showOngoing = !showOngoing);
                }),
                SizedBox(width: 16),
                _buildFilterButton('Completed', showCompleted, () {
                  setState(() => showCompleted = !showCompleted);
                }),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProjects.length,
                itemBuilder: (context, index) {
                  final project = filteredProjects[index];
                  return _buildProjectCard(project);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.cyanAccent : Colors.transparent,
          border: Border.all(color: Colors.cyanAccent),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'VT323',
            fontSize: 18,
            color: selected ? Colors.black : Colors.cyanAccent,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    String completionAsset = 'assets/projects/done${project['completion']}.png';

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF27293D),
        border: Border.all(color: Colors.cyanAccent, width: 1),
      ),
      child: Row(
        children: [
          Image.asset(
            project['image'],
            width: 110,
            height: 110,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project['name'],
                  style: TextStyle(
                    fontFamily: 'VT323',
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  project['date'],
                  style: TextStyle(
                    fontFamily: 'VT323',
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 5),
                Image.asset(completionAsset, height: 71),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
