import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:robo/components/navbar.dart';
import 'package:robo/models/model.dart';
import 'projects.dart';
import 'team.dart';
import 'events.dart';
import 'event_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController teamController = PageController(viewportFraction: 0.8);
  int teamPage = 0;

  final PageController projectsController = PageController(
    viewportFraction: 0.8,
  );
  int projectsPage = 0;

  final PageController eventsController = PageController(viewportFraction: 0.8);
  int eventsPage = 0;

  Future<List<EventDetailModel>> fetchEventsFromFirebase() async {
    final query =
        await FirebaseFirestore.instance
            .collection('events')
            .orderBy('date', descending: true)
            .limit(6)
            .get();

    return query.docs.map((doc) => EventDetailModel.fromSnapshot(doc)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      currentIndex: 0,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                child: Text(
                  'amuroboclub',
                  style: const TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 29,
                    color: Colors.cyanAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  'code,create,innovate',
                  style: const TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 12,
                    color: Colors.yellowAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(right: 100.0, left: 100.0),
                child: _buildUI(),
              ),
              const SizedBox(height: 32),

              sectionTitle(
                title: 'CONNECT',
                subtitle: 'our team & alumni',
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TeamPage()),
                    ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 145,
                child: PageView.builder(
                  controller: teamController,
                  onPageChanged: (index) => setState(() => teamPage = index),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final focused = index == teamPage;
                    return Transform.scale(
                      scale: focused ? 1.0 : 0.85,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border:
                              focused
                                  ? Border.all(color: Colors.white, width: 2)
                                  : null,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/teams/team${index + 1}.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),
              sectionTitle(
                title: 'BUILD',
                subtitle: 'cool projects',
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProjectsPage()),
                    ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 145,
                child: PageView.builder(
                  controller: projectsController,
                  onPageChanged:
                      (index) => setState(() => projectsPage = index),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final focused = index == projectsPage;
                    return Transform.scale(
                      scale: focused ? 1.0 : 0.85,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            //borderRadius: BorderRadius.circular(16),
                            //border:
                            //    focused
                            //        ? Border.all(color: Colors.white, width: 2)
                            //        : null,
                            image: AssetImage(
                              'assets/projects/project${index + 1}.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),
              sectionTitle(
                title: 'LEARN & PARTICIPATE',
                subtitle: 'fun events',
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => EventsPage()),
                    ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 250,
                child: FutureBuilder<List<EventDetailModel>>(
                  future: fetchEventsFromFirebase(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return const Center(child: Text("Error loading events"));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No events available"));
                    }

                    final events = snapshot.data!;

                    return PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: eventsController,
                      onPageChanged:
                          (index) => setState(() => eventsPage = index),
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final event = events[index];
                        final focused = index == eventsPage;
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EventDetailsPage(event: event),
                              ),
                            );
                          },
                          child: Transform.scale(
                            scale: focused ? 1.0 : 0.85,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border:
                                    focused
                                        ? Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        )
                                        : null,
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    event.posterURL,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUI() {
    return Center(child: Lottie.asset("assets/animation/roboJSON.json"));
  }

  Widget sectionTitle({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'VT323',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 1),
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 11,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
