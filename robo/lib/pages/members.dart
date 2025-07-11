import 'package:flutter/material.dart';
import 'package:robo/components/side_drawer.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  bool showButtonLabel = false;

  final List<Map<String, String>> members = [
    {
      'name': 'Fatima Arif',
      'year': '1st Year',
      'branch': 'COE',
      'image': 'assets/images/robot1.png',
    },
    {
      'name': 'Ziya Ali',
      'year': '2nd Year',
      'branch': 'COE',
      'image': 'assets/images/robot2.png',
    },
    {
      'name': 'Iram Amin',
      'year': '3rd Year',
      'branch': 'COE',
      'image': 'assets/images/robot3.png',
    },
    {
      'name': 'Fatima Arif',
      'year': '1st Year',
      'branch': 'COE',
      'image': 'assets/images/robot1.png',
    },
    {
      'name': 'Ziya Ali',
      'year': '2nd Year',
      'branch': 'COE',
      'image': 'assets/images/robot2.png',
    },
    {
      'name': 'Iram Amin',
      'year': '3rd Year',
      'branch': 'COE',
      'image': 'assets/images/robot3.png',
    },
    {
      'name': 'Fatima Arif',
      'year': '1st Year',
      'branch': 'COE',
      'image': 'assets/images/robot1.png',
    },
    {
      'name': 'Ziya Ali',
      'year': '2nd Year',
      'branch': 'COE',
      'image': 'assets/images/robot2.png',
    },
    {
      'name': 'Iram Amin',
      'year': '3rd Year',
      'branch': 'COE',
      'image': 'assets/images/robot3.png',
    },
    {
      'name': 'Fatima Arif',
      'year': '1st Year',
      'branch': 'COE',
      'image': 'assets/images/robot1.png',
    },
    {
      'name': 'Ziya Ali',
      'year': '2nd Year',
      'branch': 'COE',
      'image': 'assets/images/robot2.png',
    },
    {
      'name': 'Iram Amin',
      'year': '3rd Year',
      'branch': 'COE',
      'image': 'assets/images/robot3.png',
    },
    {
      'name': 'Fatima Arif',
      'year': '1st Year',
      'branch': 'COE',
      'image': 'assets/images/robot1.png',
    },
    {
      'name': 'Ziya Ali',
      'year': '2nd Year',
      'branch': 'COE',
      'image': 'assets/images/robot2.png',
    },
    {
      'name': 'Iram Amin',
      'year': '3rd Year',
      'branch': 'COE',
      'image': 'assets/images/robot3.png',
    },
    {
      'name': 'Fatima Arif',
      'year': '1st Year',
      'branch': 'COE',
      'image': 'assets/images/robot1.png',
    },
    {
      'name': 'Ziya Ali',
      'year': '2nd Year',
      'branch': 'COE',
      'image': 'assets/images/robot2.png',
    },
    {
      'name': 'Iram Amin',
      'year': '3rd Year',
      'branch': 'COE',
      'image': 'assets/images/robot3.png',
    },
    {
      'name': 'Fatima Arif',
      'year': '1st Year',
      'branch': 'COE',
      'image': 'assets/images/robot1.png',
    },
    {
      'name': 'Ziya Ali',
      'year': '2nd Year',
      'branch': 'COE',
      'image': 'assets/images/robot2.png',
    },
    {
      'name': 'Iram Amin',
      'year': '3rd Year',
      'branch': 'COE',
      'image': 'assets/images/robot3.png',
    },
    {
      'name': 'Fatima Arif',
      'year': '1st Year',
      'branch': 'COE',
      'image': 'assets/images/robot1.png',
    },
    {
      'name': 'Ziya Ali',
      'year': '2nd Year',
      'branch': 'COE',
      'image': 'assets/images/robot2.png',
    },
    {
      'name': 'Iram Amin',
      'year': '3rd Year',
      'branch': 'COE',
      'image': 'assets/images/robot3.png',
    },
    {
      'name': 'Fatima Arif',
      'year': '1st Year',
      'branch': 'COE',
      'image': 'assets/images/robot1.png',
    },
    {
      'name': 'Ziya Ali',
      'year': '2nd Year',
      'branch': 'COE',
      'image': 'assets/images/robot2.png',
    },
    {
      'name': 'Iram Amin',
      'year': '3rd Year',
      'branch': 'COE',
      'image': 'assets/images/robot3.png',
    },
    {
      'name': 'Fatima Arif',
      'year': '1st Year',
      'branch': 'COE',
      'image': 'assets/images/robot1.png',
    },
    {
      'name': 'Ziya Ali',
      'year': '2nd Year',
      'branch': 'COE',
      'image': 'assets/images/robot2.png',
    },
    {
      'name': 'Iram Amin',
      'year': '3rd Year',
      'branch': 'COE',
      'image': 'assets/images/robot3.png',
    },
    //  here members can be added
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
                  Text(
                    'MEMBERS',
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
                        '/components/membership_form',
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: GridView.builder(
                  itemCount: members.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final member = members[index];
                    return MemberCard(
                      name: member['name']!,
                      year: member['year']!,
                      branch: member['branch']!,
                      imagePath: member['image']!,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final String name;
  final String year;
  final String branch;
  final String imagePath;

  const MemberCard({
    required this.name,
    required this.year,
    required this.branch,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF27293D),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [BoxShadow(color: Colors.black, offset: Offset(2, 2))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(imagePath, fit: BoxFit.contain)),
          SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'VT323',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            '$year, $branch',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'VT323',
              fontSize: 14,
              color: Colors.cyanAccent,
            ),
          ),
        ],
      ),
    );
  }
}
