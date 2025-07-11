import 'package:flutter/material.dart';
import '/pages/components.dart';
import '/pages/home_page.dart';
import '/pages/about_us.dart';

class Layout extends StatelessWidget {
  final Widget body;

  const Layout({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      drawer: Drawer(
        backgroundColor: const Color(0xFF0D0D0D),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.pinkAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/roboclub.png',
                    height: 100,
                    width: 400,
                  ),
                  SizedBox(height: 3),
                  Text(
                    'AMUROBOCLUB',
                    style: TextStyle(
                      fontFamily: 'PressStart2P',
                      fontSize: 22,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.home,
              label: 'Home',
              page: HomePage(),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.settings_input_component,
              label: 'Components',
              page: ComponentsPage(),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.info,
              label: 'About Us',
              page: AboutUsPage(),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(padding: const EdgeInsets.only(top: 56.0), child: body),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 8),
              child: Builder(
                builder:
                    (context) => IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.cyanAccent,
                        size: 30,
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Widget page,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.cyanAccent, size: 32),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'VT323',
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
