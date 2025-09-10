/*import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:robo/components/navbar.dart';
import 'package:robo/models/model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_filex/open_filex.dart';

class ProjectDetailsPage extends StatelessWidget {
  final ProjectDetailModel project;

  const ProjectDetailsPage({
    Key? key,
    required this.project,
  }) : super(key: key);

  /// Open either a PDF or a normal link
  Future<void> _openResource(BuildContext context, String resource) async {
    try {
      if (resource.toLowerCase().endsWith(".pdf")) {
        // PDF file link or local path
        await OpenFilex.open(resource);
      } else {
        // Regular URL
        String fixedUrl = resource.trim();
        if (!fixedUrl.startsWith("http")) {
          fixedUrl = "https://$fixedUrl";
        }

        final Uri uri = Uri.parse(fixedUrl);

        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Could not open the link")),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Project Name
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

              // Project Image
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
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              // Description
              Text(
                project.description,
                style: const TextStyle(
                  fontFamily: 'VT323',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 16),

              // Date
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_today,
                      size: 20, color: Colors.cyanAccent),
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

              // Progress
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.construction,
                      size: 20, color: Colors.cyanAccent),
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

              // Project Resource (PDF/URL)
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
                  onPressed: () => _openResource(context, project.link),
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

              // Team Members
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
                              _openResource(context, member.linkedinId);
                            }
                          },
                          child: Text(
                            "• ${member.member}",
                            style: TextStyle(
                              fontFamily: 'VT323',
                              fontSize: 18,
                              color: member.linkedinId.isNotEmpty
                                  ? Colors.blueAccent
                                  : Colors.white,
                              decoration: member.linkedinId.isNotEmpty
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
*/
//import 'package:flutter/material.dart';
//import 'package:robo/models/model.dart';
//
//class ProjectDetailsPage extends StatelessWidget {
//  final ProjectDetailModel project;
//
//  final String? resource;
//
//  const ProjectDetailsPage({Key? key, required this.project, this.resource})
//    : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text(project.name)),
//      body: Padding(
//        padding: const EdgeInsets.all(16.0),
//        child: Text(project.description ?? "No description"),
//      ),
//    );
//  }
//}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:robo/components/navbar.dart';
import 'package:robo/models/model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_filex/open_filex.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ProjectDetailsPage extends StatelessWidget {
  final ProjectDetailModel project;

  const ProjectDetailsPage({Key? key, required this.project}) : super(key: key);

  /// Open either a PDF or a normal link
  Future<void> _openResource(BuildContext context, String resource) async {
    try {
      if (resource.toLowerCase().endsWith(".pdf")) {
        // Open PDF file (local or remote)
        //await OpenFilex.open(resource); ...
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PDFViewerPage(pdfUrl: resource),
          ),
        );
      } else {
        // Regular URL
        String fixedUrl = resource.trim();
        if (!fixedUrl.startsWith("http")) {
          fixedUrl = "https://$fixedUrl";
        }

        final Uri uri = Uri.parse(fixedUrl);

        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Could not open the link")),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Project Name
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

              // Project Image
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

              // Description
              Text(
                project.description,
                style: const TextStyle(
                  fontFamily: 'VT323',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 16),

              // Date
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

              // Progress
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

              // Project Resource (PDF/URL)
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
                  onPressed: () => _openResource(context, project.link),
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

              // Team Members
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
                              _openResource(context, member.linkedinId);
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

/// New page for showing PDF inside app
class PDFViewerPage extends StatelessWidget {
  final String pdfUrl;
  const PDFViewerPage({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PDF Viewer")),
      body: SfPdfViewer.network(
        pdfUrl,
        onDocumentLoadFailed: (details) {
          // This prints the error in the terminal
          print("Failed to load PDF: ${details.error}");

          // Optional: show a Snackbar to the user
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to load PDF: ${details.error}")),
          );
        },
      ),
    );
  }
}
