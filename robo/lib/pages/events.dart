import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:robo/components/navbar.dart';
import 'package:robo/pages/event_details.dart';
import 'package:robo/models/model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'EVENTS',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                fontSize: 18,
                color: Colors.cyanAccent,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance
                        .collection('events')
                        .orderBy('date', descending: true)
                        .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text(
                        'No events found.',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'VT323',
                          fontSize: 20,
                        ),
                      ),
                    );
                  }

                  final events = snapshot.data!.docs;

                  return ListView.builder(
                    padding: EdgeInsets.only(bottom: 20),
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index].data();
                      return _buildEventCard(event);
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

  Widget _buildEventCard(Map<String, dynamic> event) {
    final String date = event['date'] ?? '';
    final formattedDate =
        date.isNotEmpty
            ? DateFormat('dd MMM yyyy').format(DateTime.parse(date))
            : 'No date';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    EventDetailsPage(event: EventDetailModel.fromMap(event)),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            image: CachedNetworkImageProvider(event['posterURL'] ?? ''),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 90,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(14),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 2),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 40,
              child: Text(
                event['eventName'] ?? 'Event',
                style: const TextStyle(
                  fontFamily: 'VT323',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: Text(
                formattedDate,
                style: const TextStyle(
                  fontFamily: 'VT323',
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
