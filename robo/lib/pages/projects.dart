import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:robo/components/navbar.dart';
import 'package:robo/models/model.dart';
import 'package:robo/pages/project_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  String selectedFilter = 'All';

  Stream<QuerySnapshot> _getProjectsStream() {
    return FirebaseFirestore.instance
        .collection('projects')
        .orderBy('date', descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'OUR PROJECTS',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                fontSize: 18,
                color: Colors.cyanAccent,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFilterButton('All'),
                const SizedBox(width: 10),
                _buildFilterButton('Ongoing'),
                const SizedBox(width: 10),
                _buildFilterButton('Completed'),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _getProjectsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.cyanAccent,
                      ),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Projects Found",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'VT323',
                          fontSize: 20,
                        ),
                      ),
                    );
                  }
                  final allProjects =
                      snapshot.data!.docs
                          .map(
                            (doc) => ProjectDetailModel.fromMap(
                              doc.data() as Map<String, dynamic>,
                            ),
                          )
                          .toList();

                  final filteredProjects =
                      allProjects.where((project) {
                        final int progress =
                            int.tryParse(project.progress) ?? 0;
                        if (selectedFilter == 'Ongoing' && progress == 100) {
                          return false;
                        }
                        if (selectedFilter == 'Completed' && progress < 100) {
                          return false;
                        }
                        return true;
                      }).toList();

                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20),
                    itemCount: filteredProjects.length,
                    itemBuilder: (context, index) {
                      return _buildProjectCard(filteredProjects[index]);
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

  Widget _buildFilterButton(String label) {
    final selected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() => selectedFilter = label);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.cyanAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.cyanAccent, width: 1.5),
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

  Widget _buildProjectCard(ProjectDetailModel project) {
    String imageUrl = '';
    if (project.projectImg.isNotEmpty &&
        project.projectImg[0].startsWith('http')) {
      imageUrl = project.projectImg[0];
    }

    String formattedDate;
    try {
      formattedDate = DateFormat(
        'dd MMM yyyy',
      ).format(DateTime.parse(project.date));
    } catch (_) {
      formattedDate = project.date;
    }

    String progressStr = project.progress;
    List<String> validProgress = ['20', '40', '60', '80', '100'];
    String assetValue =
        validProgress.contains(progressStr) ? progressStr : '20';
    String completionAsset = 'assets/projects/done$assetValue.png';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetailsPage(project: project),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1F33),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
                  imageUrl.isNotEmpty
                      ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey.shade800,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.cyanAccent,
                                ),
                              ),
                            ),
                        // No errorWidget (per your request)
                      )
                      : Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey.shade800,
                      ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name,
                    style: const TextStyle(
                      fontFamily: 'VT323',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontFamily: 'VT323',
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Image.asset(completionAsset, height: 58),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
