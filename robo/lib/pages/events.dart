import 'package:flutter/material.dart';
import 'package:robo/components/side_drawer.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  bool showUpcoming = false;
  bool showPast = false;

  final List<Map<String, dynamic>> events = [
    {
      'name': 'Line Follower Challenge',
      'date': '15-07-25',
      'image': 'assets/events/events2.webp',
      'isUpcoming': true,
    },
    {
      'name': 'Arduino Workshop',
      'date': '10-07-2025',
      'image': 'assets/events/events1.webp',
      'isUpcoming': true,
    },
    {
      'name': 'Robotica 2024',
      'date': '12-11-2024',
      'image': 'assets/events/events2.webp',
      'isUpcoming': false,
    },
    {
      'name': 'Fundamentals in C',
      'date': '19-11-2024',
      'image': 'assets/events/events1.webp',
      'isUpcoming': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredEvents =
        events.where((event) {
          if (showUpcoming && !event['isUpcoming']) return false;
          if (showPast && event['isUpcoming']) return false;
          return true;
        }).toList();

    return Layout(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'EVENTS',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                fontSize: 20,
                color: Colors.cyanAccent,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFilterButton('Upcoming', showUpcoming, () {
                  setState(() => showUpcoming = !showUpcoming);
                }),
                SizedBox(width: 16),
                _buildFilterButton('Past', showPast, () {
                  setState(() => showPast = !showPast);
                }),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredEvents.length,
                itemBuilder: (context, index) {
                  final event = filteredEvents[index];
                  return _buildEventCard(event);
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
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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

  Widget _buildEventCard(Map<String, dynamic> event) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(event['image']),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.25),
            BlendMode.darken,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 70,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
          ),

          Positioned(
            left: 16,
            bottom: 28,
            child: Text(
              event['name'],
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 10,
            child: Text(
              event['date'],
              style: TextStyle(
                fontFamily: 'VT323',
                fontSize: 15,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
