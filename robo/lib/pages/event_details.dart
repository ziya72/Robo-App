import 'package:flutter/material.dart';
import 'package:robo/components/navbar.dart';
import 'package:robo/models/model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EventDetailsPage extends StatelessWidget {
  final EventDetailModel event;

  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  void _launchURL(BuildContext context, String url) async {
    final uri = Uri.tryParse(url.trim());

    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Could not open the link")));
    }
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: event.posterURL,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  event.eventName,
                  style: const TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 16,
                    color: Colors.cyanAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: Text(
                    '${event.date} | ${event.place}',
                    style: const TextStyle(
                      fontFamily: 'VT323',
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  event.details,
                  style: const TextStyle(
                    fontFamily: 'VT323',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => _launchURL(context, event.regFormLink),
                  child: const Text(
                    "REGISTER",
                    style: TextStyle(
                      fontFamily: 'VT323',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
