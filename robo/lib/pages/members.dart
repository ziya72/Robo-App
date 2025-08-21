import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:robo/components/navbar.dart';
import 'package:robo/models/model.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  final List<String> robotImages = [
    'assets/images/robot1.png',
    'assets/images/robot2.png',
    'assets/images/robot3.png',
  ];

  Stream<List<Member>> _getPaidMembersStream() {
    return FirebaseFirestore.instance
        .collection('members_2025')
        .where('paymentStatus', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            final data = doc.data();
            return Member.fromMap(data);
          }).toList();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      currentIndex: 1,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
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
                        'MEMBERS',
                        style: TextStyle(
                          fontFamily: 'PressStart2P',
                          fontSize: 20,
                          color: Colors.cyanAccent,
                        ),
                      ),
                      //GestureDetector(
                      //  onTap: () {
                      //    Navigator.pushNamed(
                      //      context,
                      //      '/components/membership_form',
                      //    );
                      //  },
                      //  child: Image.asset(
                      //    'assets/images/pixel_plus.png',
                      //    height: 32,
                      //  ),
                      //),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<Member>>(
                    stream: _getPaidMembersStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text(
                            "No Members Found",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      final members = snapshot.data!;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: GridView.builder(
                          itemCount: members.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 12,
                                childAspectRatio: 0.7,
                              ),
                          itemBuilder: (context, index) {
                            final member = members[index];
                            final imagePath = robotImages[index % 3];
                            return MemberCard(
                              name: member.name,
                              course: member.course,
                              enrollmentNumber: member.enrollmentNumber,
                              imagePath: imagePath,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellowAccent),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.yellowAccent,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      Text(
                        "Membership Form",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'VT323',
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 5),
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
  final String enrollmentNumber;
  final String course;
  final String imagePath;

  const MemberCard({
    super.key,
    required this.name,
    required this.enrollmentNumber,
    required this.course,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF27293D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(imagePath, fit: BoxFit.contain)),
          const SizedBox(height: 4),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'VT323',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            '$course, $enrollmentNumber',
            textAlign: TextAlign.center,
            style: const TextStyle(
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
