import 'package:flutter/material.dart';
import 'package:robo/components/side_drawer.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 14),

            const Center(
              child: Text(
                'GALLERY',
                style: TextStyle(
                  fontFamily: 'PressStart2P',
                  fontSize: 20,
                  color: Colors.cyanAccent,
                ),
              ),
            ),
            const SizedBox(height: 8),

            Expanded(
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border.all(color: Colors.cyanAccent, width: 1.5),
                    ),
                    child: Image.asset(
                      'assets/gallery/image${index + 1}.png',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
