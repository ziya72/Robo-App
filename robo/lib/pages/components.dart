import 'package:flutter/material.dart';
import 'package:robo/components/side_drawer.dart';

class ComponentsPage extends StatefulWidget {
  @override
  _ComponentsPageState createState() => _ComponentsPageState();
}

class _ComponentsPageState extends State<ComponentsPage> {
  final List<Map<String, String>> components = [
    {
      'name': 'Fatima Arif',
      'year': '1st Year',
      'branch': 'COE',
      'image': 'assets/images/robot1.png',
      'issued': 'Arduino Uno, Wires',
    },
    {
      'name': 'Ziya Ali',
      'year': '2nd Year',
      'branch': 'COE',
      'image': 'assets/images/robot2.png',
      'issued': 'Cables',
    },
    {
      'name': 'Iram Amin',
      'year': '3rd Year',
      'branch': 'COE',
      'image': 'assets/images/robot3.png',
      'issued': 'Sensors, LEDs',
    },
    // Add more people who got components here
  ];

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'COMPONENTS',
                    style: TextStyle(
                      fontFamily: 'PressStart2P',
                      fontSize: 20,
                      color: Colors.cyanAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/components/component_form',
                      );
                    },
                    child: Image.asset(
                      'assets/images/pixel_plus.png',
                      height: 32,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                itemCount: components.length,
                itemBuilder: (context, index) {
                  final comp = components[index];
                  return ComponentCard(
                    name: comp['name']!,
                    year: comp['year']!,
                    branch: comp['branch']!,
                    imagePath: comp['image']!,
                    issued: comp['issued']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ComponentCard extends StatelessWidget {
  final String name;
  final String year;
  final String branch;
  final String imagePath;
  final String issued;

  const ComponentCard({
    required this.name,
    required this.year,
    required this.branch,
    required this.imagePath,
    required this.issued,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF27293D),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: const [BoxShadow(color: Colors.black, offset: Offset(2, 2))],
      ),
      child: Row(
        children: [
          Image.asset(imagePath, height: 60, width: 60, fit: BoxFit.contain),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'VT323',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '$year, $branch',
                  style: const TextStyle(
                    fontFamily: 'VT323',
                    fontSize: 14,
                    color: Colors.cyanAccent,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$issued ',
                  style: const TextStyle(
                    fontFamily: 'VT323',
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
