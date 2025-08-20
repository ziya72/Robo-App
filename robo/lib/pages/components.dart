import 'package:flutter/material.dart';
import 'package:robo/components/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:robo/models/model.dart';

class ComponentsPage extends StatefulWidget {
  const ComponentsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ComponentsPageState createState() => _ComponentsPageState();
}

class _ComponentsPageState extends State<ComponentsPage> {
  List<ComponentModel> components = [];

  @override
  void initState() {
    super.initState();
    fetchComponents();
  }

  Future<void> fetchComponents() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('registeredForComponents')
            .get();

    final data =
        snapshot.docs.map((doc) => ComponentModel.fromMap(doc.data())).toList();

    setState(() {
      components = data;
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
      currentIndex: 2,
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
                        'COMPONENTS',
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
                      //      '/components/component_form',
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
                  child:
                      components.isEmpty
                          ? const Center(
                            child: Text(
                              'No data found.',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                          : ListView.builder(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            itemCount: components.length,
                            itemBuilder: (context, index) {
                              final comp = components[index];
                              final imagePath =
                                  'assets/images/robot${(index % 3) + 1}.png';

                              return ComponentCard(
                                name: comp.name,
                                course: comp.course,
                                year: comp.yearOfStudy,
                                componentName: comp.componentsName,
                                imagePath: imagePath,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Get Components",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'VT323',
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 3),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/components/component_form',
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

class ComponentCard extends StatelessWidget {
  final String name;
  final String course;
  final String year;
  final String componentName;
  final String imagePath;

  const ComponentCard({
    super.key,
    required this.name,
    required this.course,
    required this.year,
    required this.componentName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF27293D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, height: 60, width: 60, fit: BoxFit.contain),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'VT323',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '$course, $year Year',
                  style: const TextStyle(
                    fontFamily: 'VT323',
                    fontSize: 14,
                    color: Colors.cyanAccent,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  componentName,
                  style: const TextStyle(
                    fontFamily: 'VT323',
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
