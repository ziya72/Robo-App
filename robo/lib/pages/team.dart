import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  int _selectedYear = 2023;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30),
        child: Column(
          children: [
            Text(
              'Roboclub Team',
              style: TextStyle(
                fontFamily: 'PressStart2',
                color: Colors.cyanAccent,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),
            DropdownButton<int>(
              dropdownColor: Colors.grey[900],
              style: const TextStyle(color: Colors.white),
              value: _selectedYear,
              items: List.generate(
                6,
                (index) => DropdownMenuItem(
                  value: 2023 - index,
                  child: Text('${2023 - index}-${24 - index}'),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedYear = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            Flexible(
              fit: FlexFit.loose,
              child: FutureBuilder<QuerySnapshot>(
                future:
                    FirebaseFirestore.instance
                        .collection('team')
                        .doc('$_selectedYear-${_selectedYear + 1}')
                        .collection('members')
                        .get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final members = snapshot.data!.docs;

                  return PageView.builder(
                    controller: PageController(
                      viewportFraction: 0.7,
                      initialPage: 0,
                    ),
                    itemCount: members.length,
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: Alignment.topCenter,
                        child: _buildTeamCard(members[index], index),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamCard(QueryDocumentSnapshot member, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade900, Colors.grey.shade800],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.cyanAccent, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  member['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'PressStart2P',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyanAccent,
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(member['image']),
                    radius: 48,
                  ),
                ),
                const SizedBox(height: 14),
                _buildPower(
                  "Creativity",
                  member['creativity'],
                  Icons.bolt,
                  Colors.orangeAccent,
                ),
                _buildPower(
                  "Leadership",
                  member['leadership'],
                  Icons.shield,
                  Colors.blueAccent,
                ),
                _buildPower(
                  "Enthusiasm",
                  member['enthusiasm'],
                  Icons.favorite,
                  Colors.greenAccent,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyanAccent.withOpacity(0.6),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Text(
                    member['position'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'PressStart2P',
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPower(String label, int value, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 10,
                  width: value * 1.0,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text('$value', style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
