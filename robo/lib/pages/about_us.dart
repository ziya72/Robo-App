import 'package:flutter/material.dart';
import 'package:robo/components/side_drawer.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
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
              'ABOUT US',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                fontSize: 20,
                color: Colors.cyanAccent,
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            'This is just some random sample sentences will write stuff later once i get the approval that this isnt absolute trash. Wow apprently this was super less text need to fill in a lot more to actually cover the entire page. On that note the home page is done. the buttons are not working right now, Components page is done and the form is done. payment part and the data storing of the form isnt done. Members page is done, gallery is done, member form is done. need to make the Splash screen animation. No idea how to do that though. Events page and projects page layout is ready in my notebook. need to figure out the separate event pop up thing. Anyways i hope this much is enough.',
            style: TextStyle(
              fontFamily: 'VT323',
              fontSize: 20,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

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
