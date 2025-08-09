import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:robo/components/navbar.dart';
import 'package:robo/models/model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsPage extends StatelessWidget {
  final ProjectDetailModel project;

  const ProjectDetailsPage({Key? key, required this.project}) : super(key: key);

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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                project.name,
                style: const TextStyle(
                  fontFamily: 'PressStart2P',
                  fontSize: 16,
                  color: Colors.cyanAccent,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),
              if (project.projectImg.isNotEmpty)
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.cyanAccent, width: 3),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: project.projectImg[0],
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        errorWidget:
                            (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 20),
              Text(
                project.description,
                style: const TextStyle(
                  fontFamily: 'VT323',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 20,
                    color: Colors.cyanAccent,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    project.date,
                    style: const TextStyle(
                      fontFamily: 'VT323',
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.construction,
                    size: 20,
                    color: Colors.cyanAccent,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Progress: ${project.progress}",
                    style: const TextStyle(
                      fontFamily: 'VT323',
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              if (project.link.isNotEmpty)
                ElevatedButton(
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
                  onPressed: () => _launchURL(context, project.link),
                  child: const Text(
                    "Check it out!",
                    style: TextStyle(
                      fontFamily: 'VT323',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),

              const SizedBox(height: 30),
              if (project.teamMembers.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Team Members:",
                      style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 14,
                        color: Colors.cyanAccent,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...project.teamMembers.map(
                      (member) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: InkWell(
                          onTap: () {
                            if (member.linkedinId.isNotEmpty) {
                              _launchURL(context, member.linkedinId);
                            }
                          },
                          child: Text(
                            "• ${member.member}",
                            style: TextStyle(
                              fontFamily: 'VT323',
                              fontSize: 18,
                              color:
                                  member.linkedinId.isNotEmpty
                                      ? Colors.blueAccent
                                      : Colors.white,
                              decoration:
                                  member.linkedinId.isNotEmpty
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
