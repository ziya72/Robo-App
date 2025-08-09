import 'package:flutter/material.dart';
import 'package:robo/components/navbar.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      currentIndex: 3,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _buildAboutUsView(),
      ),
    );
  }

  Widget _buildAboutUsView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          const Center(
            child: Text(
              'About Us',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                fontSize: 20,
                color: Colors.cyanAccent,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Where Innovation meets Implementation',
            style: TextStyle(
              fontFamily: 'VT323',
              fontSize: 22,
              color: Colors.white,
            ),
          ),

          const Text(
            'Here At AMURoboClub, we are not just about building robots, we are about helping students become creative thinkers and problem-solvers. With awesome support from our ZHCET faculty, this is a space where ideas come to life, experiments are fun, and learning happens by doing cool projects together.',
            style: TextStyle(
              fontFamily: 'VT323',
              fontSize: 20,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          const Center(
            child: Text(
              'Our Mission',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                fontSize: 20,
                color: Colors.cyanAccent,
              ),
            ),
          ),

          const SizedBox(height: 20),
          const Text(
            'To spark innovation through hands-on learning, mentorship, and real-world challenges. We bring together students from all backgrounds to build a collaborative, inclusive, and competitive robotics ecosystem.',
            style: TextStyle(
              fontFamily: 'VT323',
              fontSize: 20,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _StatsBox(count: '88', label: 'Members'),
              _StatsBox(count: '40', label: 'Projects'),
              _StatsBox(count: '15', label: 'Awards'),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatsBox extends StatelessWidget {
  final String count;
  final String label;

  const _StatsBox({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontFamily: 'PressStart2P',
            fontSize: 24,
            color: Colors.cyanAccent,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'VT323',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
