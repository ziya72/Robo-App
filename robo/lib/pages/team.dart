/*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeamPage extends StatefulWidget {
  TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  
  int _selectedYear = 2023;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30),
        child: Column(
          children: [
            Text(
              'Roboclub Team',
              style: TextStyle(
                fontFamily: 'PressStart2P',
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
              child: FutureBuilder<DocumentSnapshot>(
                future:
                    FirebaseFirestore.instance
                        .collection('teams')
                        .doc('team_$_selectedYear-${_selectedYear + 1}')
                        .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Error: ${snapshot.error}",
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Center(
                      child: Text(
                        "No team data found for this year",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  final teamData =
                      snapshot.data!.data() as Map<String, dynamic>?;
                  final List<dynamic>? membersData = teamData?['members'];

                  if (membersData == null || membersData.isEmpty) {
                    return const Center(
                      child: Text(
                        "No team members found",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  final members = List<Map<String, dynamic>>.from(membersData);

                  return PageView.builder(
                    controller: PageController(
                      viewportFraction: 0.7,
                      initialPage: 0,
                    ),
                    itemCount: members.length,
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: Alignment.topCenter,
                        child: _buildTeamCard(members[index]),
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

  // The method signature must be updated to accept a Map
  Widget _buildTeamCard(Map<String, dynamic> member) {
    // Safely access data using the map key
    final name = member['name'] as String? ?? 'N/A';
    final image =
        member['profileImageUrl'] as String? ??
        'https://via.placeholder.com/150';
    final position = member['position'] as String? ?? 'Member';

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
                  name,
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
                    backgroundImage: NetworkImage(image),
                    radius: 48,
                  ),
                ),
                const SizedBox(height: 14),
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
                    position,
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
}
*/

//////////////////////////

/*
import 'package:flutter/material.dart';

void main() {
  runApp(const TeamPage());
}

class TeamPage extends StatelessWidget {
  TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF181A20),
        // Use a consistent dark theme
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                child: Text(
                  'Our Team',
                  style: TextStyle(
                    fontFamily: 'Pixelify Sans', // A pixel-art style font
                    fontSize: 36,
                    color: Color(0xFF00FFFF), // A neon-blue color
                  ),
                ),
              ),
              const Center(
                child: Text(
                  '2018-19',
                  style: TextStyle(
                    fontFamily: 'Pixelify Sans',
                    fontSize: 24,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height:
                    450, // Adjust the height of the scrollable area as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // A placeholder for the number of team members
                  itemBuilder: (context, index) {
                    // This is where you'd pass data for each team member
                    return const TeamCard(
                      name: 'Abhas Raj Saxena',
                      creativity: 80,
                      leadership: 65,
                      enthusiasm: 85,
                      isVolunteer: true,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      color: const Color(0xFF1F2228),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.home, color: Color(0xFF00FFFF), size: 30),
          Icon(Icons.group, color: Colors.white54, size: 30),
          Icon(Icons.settings, color: Colors.white54, size: 30),
          Icon(Icons.info, color: Colors.white54, size: 30),
        ],
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  final String name;
  final int creativity;
  final int leadership;
  final int enthusiasm;
  final bool isVolunteer;

  const TeamCard({
    super.key,
    required this.name,
    required this.creativity,
    required this.leadership,
    required this.enthusiasm,
    this.isVolunteer = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2228),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF00FFFF), width: 3),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name.replaceAll(' ', '\n'), // Splits the name onto two lines
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Pixelify Sans',
                    fontSize: 30,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                _buildAvatarWithPlayButton(),
                _buildStatRow(
                  'Creativity',
                  Icons.flash_on,
                  creativity,
                  const Color(0xFFF9F871),
                ),
                _buildStatRow(
                  'Leadership',
                  Icons.shield,
                  leadership,
                  const Color(0xFF82B8D2),
                ),
                _buildStatRow(
                  'Enthusiasm',
                  Icons.favorite,
                  enthusiasm,
                  const Color(0xFF4EEFAD),
                ),
                if (isVolunteer) _buildVolunteerButton(),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarWithPlayButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: const BoxDecoration(
            color: Color(0xFFC7C5F4),
            shape: BoxShape.circle,
          ),
        ),
        const Icon(Icons.play_arrow, color: Colors.white, size: 60),
      ],
    );
  }

  Widget _buildStatRow(
    String label,
    IconData icon,
    int value,
    Color iconColor,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Pixelify Sans',
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
        const Spacer(),
        Text(
          '$value',
          style: const TextStyle(
            fontFamily: 'Pixelify Sans',
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildVolunteerButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF00FFFF),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFF00FFFF)),
      ),
      child: const Text(
        'Volunteer',
        style: TextStyle(
          fontFamily: 'Pixelify Sans',
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
*/

//**************************88 */
/*
import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  int _selectedYear = 2018;

  // Hardcoded team data
  final Map<int, List<Map<String, dynamic>>> teamData = {
    2018: [
      {
        "name": "Abhas Raj Saxena",
        "creativity": 80,
        "leadership": 65,
        "enthusiasm": 85,
        "position": "Volunteer",
      },
      {
        "name": "John Doe",
        "creativity": 70,
        "leadership": 90,
        "enthusiasm": 75,
        "position": "Coordinator",
      },
    ],
    2019: [
      {
        "name": "Jane Smith",
        "creativity": 85,
        "leadership": 80,
        "enthusiasm": 88,
        "position": "Volunteer",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final members = teamData[_selectedYear] ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30),
        child: Column(
          children: [
            Text(
              'Our Team',
              style: const TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.cyanAccent,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<int>(
              dropdownColor: Colors.grey[900],
              style: const TextStyle(color: Colors.white),
              value: _selectedYear,
              items:
                  teamData.keys.map((year) {
                    return DropdownMenuItem(
                      value: year,
                      child: Text('$year-${year + 1}'),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedYear = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child:
                  members.isEmpty
                      ? const Center(
                        child: Text(
                          "No team data found",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                      : PageView.builder(
                        controller: PageController(viewportFraction: 0.8),
                        itemCount: members.length,
                        itemBuilder: (context, index) {
                          return _buildTeamCard(members[index]);
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamCard(Map<String, dynamic> member) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.cyanAccent, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              member["name"],
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'PressStart2P',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.cyanAccent,
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            _buildStat("Creativity", member["creativity"], Icons.bolt),
            _buildStat("Leadership", member["leadership"], Icons.shield),
            _buildStat("Enthusiasm", member["enthusiasm"], Icons.favorite),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.cyanAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                member["position"],
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'PressStart2P',
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, int value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.cyanAccent, size: 18),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
          Text(
            "$value",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  int _selectedYear = 2023;

  // Hardcoded team data
  final Map<int, List<Map<String, dynamic>>> teamData = {
    2018: [
      {
        "name": "Abhas Raj Saxena",
        "creativity": 80,
        "leadership": 65,
        "enthusiasm": 85,
        "position": "Volunteer",
      },
    ],
    2019: [
      {
        "name": "Jane Smith",
        "creativity": 85,
        "leadership": 80,
        "enthusiasm": 88,
        "position": "Volunteer",
      },
    ],
    2023: [
      {
        "name": "Rohit Sharma",
        "creativity": 75,
        "leadership": 90,
        "enthusiasm": 80,
        "position": "Coordinator",
      },
    ],
    2024: [
      {
        "name": "Aisha Khan",
        "creativity": 92,
        "leadership": 70,
        "enthusiasm": 95,
        "position": "Volunteer",
      },
    ],
    2025: [
      {
        "name": "Sameer Verma",
        "creativity": 88,
        "leadership": 85,
        "enthusiasm": 80,
        "position": "Team Lead",
      },
    ],
    2026: [
      {
        "name": "Neha Gupta",
        "creativity": 70,
        "leadership": 88,
        "enthusiasm": 90,
        "position": "Volunteer",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final members = teamData[_selectedYear] ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30),
        child: Column(
          children: [
            const Text(
              'Our Team',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.cyanAccent,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<int>(
              dropdownColor: Colors.grey[900],
              style: const TextStyle(color: Colors.white),
              value: _selectedYear,
              items: const [
                DropdownMenuItem(value: 2018, child: Text("2018-19")),
                DropdownMenuItem(value: 2019, child: Text("2019-20")),
                DropdownMenuItem(value: 2023, child: Text("2023-24")),
                DropdownMenuItem(value: 2024, child: Text("2024-25")),
                DropdownMenuItem(value: 2025, child: Text("2025-26")),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedYear = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child:
                  members.isEmpty
                      ? const Center(
                        child: Text(
                          "No team data found",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                      : PageView.builder(
                        controller: PageController(viewportFraction: 0.8),
                        itemCount: members.length,
                        itemBuilder: (context, index) {
                          return _buildTeamCard(members[index]);
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamCard(Map<String, dynamic> member) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.cyanAccent, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              member["name"],
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'PressStart2P',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.cyanAccent,
              child: const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            _buildStat("Creativity", member["creativity"], Icons.bolt),
            _buildStat("Leadership", member["leadership"], Icons.shield),
            _buildStat("Enthusiasm", member["enthusiasm"], Icons.favorite),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.cyanAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                member["position"],
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'PressStart2P',
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, int value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.cyanAccent, size: 18),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
          Text(
            "$value",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  // Hardcoded team data for 2025-26
  final List<Map<String, dynamic>> members = const [
    {
      "name": "Mohammad Ali",
      "creativity": 88,
      "leadership": 90,
      "enthusiasm": 70,
      "position": "Team Lead",
    },
    {
      "name": "Asna Fatimah",
      "creativity": 92,
      "leadership": 88,
      "enthusiasm": 80,
      "position": "Volunteer",
    },
    {
      "name": "Faiq Alam",
      "creativity": 92,
      "leadership": 80,
      "enthusiasm": 95,
      "position": "Coordinator",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Our Team',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.cyanAccent,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '2025-26',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.cyanAccent,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),

            // Horizontal scrollable list
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return _buildTeamCard(members[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamCard(Map<String, dynamic> member) {
    return Container(
      width: 260,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.cyanAccent, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            member["name"],
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'PressStart2P',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.cyanAccent,
            child: const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          _buildStat("Creativity", member["creativity"], Icons.bolt),
          _buildStat("Leadership", member["leadership"], Icons.shield),
          _buildStat("Enthusiasm", member["enthusiasm"], Icons.favorite),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.cyanAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              member["position"],
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'PressStart2P',
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, int value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.cyanAccent, size: 18),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
          Text(
            "$value",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  TeamPage({super.key});

  // Example team data
  final Map<String, List<Map<String, String>>> team = const {
    "Coordinators": [
      {
        "name": "Sameer Verma",
        "image": "https://via.placeholder.com/150",
        "position": "Coordinator",
      },
      {
        "name": "Neha Gupta",
        "image": "https://via.placeholder.com/150",
        "position": "Coordinator",
      },
    ],
    "Joint Coordinators": [
      {
        "name": "Aisha Khan",
        "image": "https://via.placeholder.com/150",
        "position": "Joint Coordinator",
      },
    ],
    "Web Developers": [
      {
        "name": "Rahul Mehta",
        "image": "https://via.placeholder.com/150",
        "position": "Web Developer",
      },
      {
        "name": "Karan Sharma",
        "image": "https://via.placeholder.com/150",
        "position": "Web Developer",
      },
    ],
    "App Developers": [
      {
        "name": "Ziya Ali",
        "image": "https://via.placeholder.com/150",
        "position": "App Developer",
      },
    ],
    "PR Team": [
      {
        "name": "Priya Singh",
        "image": "https://via.placeholder.com/150",
        "position": "PR Manager",
      },
    ],
    "Volunteers": [
      {
        "name": "Ravi Kumar",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Sneha Patel",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
    ],
  };

  // Section-specific accent colors
  final Map<String, Color> sectionColors = {
    "Coordinators": Colors.pinkAccent,
    "Joint Coordinators": Colors.deepPurpleAccent,
    "Web Developers": Colors.orangeAccent,
    "App Developers": Colors.greenAccent,
    "PR Team": Colors.blueAccent,
    "Volunteers": Colors.yellowAccent,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Column(
          children: [
            const Text(
              'Our Team',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.cyanAccent,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '2025-26',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.cyanAccent,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),

            // Scrollable Rows
            Expanded(
              child: ListView(
                children:
                    team.entries.map((entry) {
                      final accentColor =
                          sectionColors[entry.key] ?? Colors.cyanAccent;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Section Header with glow divider
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 2,
                                    color: accentColor.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  entry.key,
                                  style: TextStyle(
                                    color: accentColor,
                                    fontSize: 16,
                                    fontFamily: 'PressStart2P',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    height: 2,
                                    color: accentColor.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Horizontal Row of Cards
                          SizedBox(
                            height: 220,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: entry.value.length,
                              itemBuilder: (context, index) {
                                return _buildTeamCard(
                                  entry.value[index],
                                  accentColor,
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamCard(Map<String, String> member, Color accentColor) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accentColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.3),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Image with neon ring
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: accentColor, width: 2),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withOpacity(0.6),
                  blurRadius: 12,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(member["image"]!),
            ),
          ),
          const SizedBox(height: 12),

          // Name
          Text(
            member["name"]!,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontFamily: 'PressStart2P',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          // Position Tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.15),
              border: Border.all(color: accentColor, width: 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              member["position"]!,
              style: TextStyle(
                color: accentColor,
                fontFamily: 'PressStart2P',
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
*/

/*

import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  TeamPage({super.key});

  // Example team data
  final Map<String, List<Map<String, String>>> team = const {
    "Coordinators": [
      {
        "name": "Mohammad Ali",
        "image": "https://via.placeholder.com/150",
        "position": "Coordinator",
      },
      {
        "name": "Asna Fatimah",
        "image": "https://via.placeholder.com/150",
        "position": "Coordinator",
      },
      {
        "name": "Faiq Alam",
        "image": "https://via.placeholder.com/150",
        "position": "Joint Coordinator",
      },
      {
        "name": "Ahmed Ilyas",
        "image": "https://via.placeholder.com/150",
        "position": "Joint Coordinator",
      },
    ],
    "Joint Coordinators": [
      {
        "name": "Mohd Arif Rainee",
        "image": "https://via.placeholder.com/150",
        "position": "Joint Coordinator",
      },
      {
        "name": "Syed Ismail Sultan",
        "image": "https://via.placeholder.com/150",
        "position": "Joint Coordinator",
      },
      {
        "name": "Md Ghalib Hussain",
        "image": "https://via.placeholder.com/150",
        "position": "Joint Coordinator",
      },
      {
        "name": "Avyukt Soni",
        "image": "https://via.placeholder.com/150",
        "position": "Joint Coordinator",
      },
      {
        "name": "Sharjeel Afridi",
        "image": "https://via.placeholder.com/150",
        "position": "Joint Coordinator",
      },
      {
        "name": "Maaz Ansari",
        "image": "https://via.placeholder.com/150",
        "position": "Joint Coordinator",
      },
      {
        "name": "Aman Javed",
        "image": "https://via.placeholder.com/150",
        "position": "Joint Coordinator",
      },
    ],
    "Web Developers": [
      {
        "name": "Anushka Varshney",
        "image": "https://via.placeholder.com/150",
        "position": "Web Developer",
      },
      {
        "name": "Saad Ahmed",
        "image": "https://via.placeholder.com/150",
        "position": "Web Developer",
      },
    ],
    "App Developers": [
      {
        "name": "Ziya Ali",
        "image": "https://via.placeholder.com/150",
        "position": "App Developer",
      },
      {
        "name": "Fatima Arif",
        "image": "https://via.placeholder.com/150",
        "position": "App Developer",
      },
    ],
    "PR Team": [
      {
        "name": "Khadija Fatima Abbasi",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Abdul Arham",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Quteba Ahsan",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Ashraf Husain",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Rudra Agarwal",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
    ],
    "Volunteers": [
      {
        "name": "Mohd Uzaid",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Kamran Firdous",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Mohd Luqmaan",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Kandarp Gupta",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Mohd Bilal",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Mohammad Shiraz",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Mohammad Zaid Ali",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Devansh Agrawal",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Mohd Shoeb Khan",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Masum Raza",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Madiha Irfan",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Mohd Shayan",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Abaan Siddique",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
      {
        "name": "Supreet chaudhary",
        "image": "https://via.placeholder.com/150",
        "position": "Volunteer",
      },
    ],
  };

  // Unified accent colors (cyan main, purple alt)
  final Color mainAccent = Colors.cyanAccent;
  final Color altAccent = Colors.cyanAccent.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A), // dark navy-ish black
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Column(
          children: [
            const Text(
              'Our Team',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.cyanAccent,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '2025-26',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 30),

            
            Expanded(
              child: ListView(
                children:
                    team.entries.map((entry) {
                      final accentColor =
                          entry.key.hashCode.isEven ? mainAccent : altAccent;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 5,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1.5,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          accentColor.withOpacity(0.0),
                                          accentColor.withOpacity(0.6),
                                          accentColor.withOpacity(0.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  entry.key,
                                  style: TextStyle(
                                    color: accentColor,
                                    fontSize: 14,
                                    fontFamily: 'PressStart2P',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    height: 1.5,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          accentColor.withOpacity(0.0),
                                          accentColor.withOpacity(0.6),
                                          accentColor.withOpacity(0.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 220,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: entry.value.length,
                              itemBuilder: (context, index) {
                                return _buildTeamCard(
                                  entry.value[index],
                                  accentColor,
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamCard(Map<String, String> member, Color accentColor) {
    return Container(
      width: 170,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accentColor.withOpacity(0.4), width: 1),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: accentColor, width: 2),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(member["image"]!),
            ),
          ),
          const SizedBox(height: 12),

          // Name
          Text(
            member["name"] ?? "",
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontFamily: 'PressStart2P',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          // Position Tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.15),
              border: Border.all(color: accentColor, width: 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              member["position"] ?? "",
              style: TextStyle(
                color: accentColor,
                fontFamily: 'PressStart2P',
                fontSize: 9,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  TeamPage({super.key});

  // Example team data
  final Map<String, List<Map<String, String>>> team = const {
    "Coordinators": [
      {"name": "Mohammad Ali", "image": "assets/teamMembers/mohammadali.jpeg"},
      {"name": "Asna Fatimah", "image": "assets/teamMembers/asnafatimah.jpeg"},
      {"name": "Faiq Alam", "image": "assets/teamMembers/faiqalam.jpeg"},
      {"name": "Ahmed Ilyas", "image": "assets/teamMembers/ahmedilyas"},
    ],
    "Joint Coordinators": [
      {
        "name": "Mohd Arif Rainee",
        "image": "assets/teamMembers/arifrainee.jpeg",
      },
      {
        "name": "Syed Ismail Sultan",
        "image": "assets/teamMembers/syedismailsultan.jpeg",
      },
      {
        "name": "Md Ghalib Hussain",
        "image":"assets/teamMembers/ghalib.jpeg",
      },
      {"name": "Avyukt Soni", "image": "assets/teamMembers/avyuktsoni.jpeg"},
      {
        "name": "Sharjeel Afridi",
        "image": "assets/teamMembers/sharjeelafridi.jpeg",
      },
      {"name": "Maaz Ansari", "image": "assets/teamMembers/maazansari.jpeg"},
      {"name": "Aman Javed", "image": "assets/teamMembers/amanjaved"},
    ],
    "Web Developers": [
      {
        "name": "Anushka Varshney",
        "image": "assets/teamMembers/anushkavarshney.jpeg",
      },
      {"name": "Saad Ahmed", "image": "assets/teamMembers/saadahmed.jpeg"},
    ],
    "App Developers": [
      {"name": "Ziya Ali", "image": "assets/teamMembers/ziyaali.jpeg"},
      {"name": "Fatima Arif", "image": "assets/teamMembers/fatimaarif.jpeg"},
    ],
    "PR Team": [
      {"name": "Khadija Fatima", "image": "assets/teamMembers/khadia.jpeg"},
      {"name": "Abdul Arham", "image": "assets/teamMembers/abdularham.jpeg"},
      {"name": "Quteba Ahsan", "image": "assets/teamMembers/qutebaashsan.jpeg"},
      {
        "name": "Ashraf Husain",
        "image": "assets/teamMembers/ashrafhussain.jpeg",
      },
      {
        "name": "Rudra Agarwal",
        "image": "assets/teamMembers/rudraaggarwal.jpeg",
      },
    ],
    "Volunteers": [
      {"name": "Mohd Uzaid", "image": "assets/teamMembers/mohduzaid.jpeg"},
      {"name": "Kamran Firdous", "image": "assets/teamMembers/kamran.jpeg"},
      {"name": "Mohd Luqmaan", "image": "assets/teamMembers/mohdluqmaan.jpeg"},
      {"name": "Kandarp Gupta", "image": "assets/teamMembers/kandarp.jpeg"},
      {"name": "Mohd Bilal", "image": "assets/teamMembers/mohdbilal.jpeg"},
      {
        "name": "Mohammad Shiraz",
        "image": "assets/teamMembers/mohammadshiraz.jpeg",
      },
      {"name": "Mohammad Zaid Ali", "image": "assets/teamMembers/zaidali.jpeg"},
      {"name": "Devansh Agrawal", "image": "assets/teamMembers/devansh.jpeg"},
      {
        "name": "Mohd Shoeb Khan",
        "image": "assets/teamMembers/mohdshoebkhan.jpeg",
      },
      {"name": "Masum Raza", "image": "assets/teamMembers/masumraza.jpeg"},
      {"name": "Madiha Irfan", "image": "assets/teamMembers/madihairfan.jpeg"},
      {"name": "Mohd Shayan", "image": "assets/teamMembers/mohdshayan.jpeg"},
      {
        "name": "Abaan Siddique",
        "image": "assets/teamMembers/abaansiddiqui.jpeg",
      },
      {
        "name": "Supreet chaudhary",
        "image": "assets/teamMembers/supreetchaudhary.jpeg",
      },
    ],
  };

  // Single accent color for all headings
  final Color headingColor = Colors.cyanAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A), // dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Column(
          children: [
            const Text(
              'Our Team',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.cyanAccent,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '2025-26',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 30),

            Expanded(
              child: ListView(
                children:
                    team.entries.map((entry) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Section heading
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 5,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1.5,
                                    color: headingColor.withOpacity(0.4),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  entry.key,
                                  style: TextStyle(
                                    color: headingColor,
                                    fontSize: 14,
                                    fontFamily: 'PressStart2P',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    height: 1.5,
                                    color: headingColor.withOpacity(0.4),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Horizontal scrolling row
                          SizedBox(
                            height: 180,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: entry.value.length,
                              itemBuilder: (context, index) {
                                return _buildTeamCard(entry.value[index]);
                              },
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ), // spacing between sections
                        ],
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Card without position text
  Widget _buildTeamCard(Map<String, String> member) {
    final String imageUrl = member["image"] ?? "";
    final bool isNetworkImage = imageUrl.startsWith('http');
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: headingColor.withOpacity(0.4), width: 1),
        boxShadow: [
          BoxShadow(
            color: headingColor.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Image
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: headingColor, width: 2),
              boxShadow: [
                BoxShadow(
                  color: headingColor.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundImage:
                  isNetworkImage
                      ? NetworkImage(imageUrl)
                      : AssetImage(imageUrl), //AssetImage(member["image"]!),
            ),
          ),
          const SizedBox(height: 12),

          // Name only
          Text(
            member["name"] ?? "",
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontFamily: 'PressStart2P',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
