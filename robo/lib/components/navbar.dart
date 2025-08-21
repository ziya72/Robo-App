import 'package:flutter/material.dart';
import '/pages/components.dart';
import '/pages/home_page.dart';
import '/pages/about_us.dart';
import '/pages/members.dart';

class Layout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final int? currentIndex;

  const Layout({super.key, this.appBar, required this.body, this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = MembersPage();
        break;
      case 2:
        page = ComponentsPage();
        break;
      case 3:
        page = AboutUsPage();
        break;
      default:
        page = HomePage();
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color.fromARGB(255, 2, 2, 2);

    return Scaffold(
      backgroundColor: backgroundColor, //const Color.fromARGB(255, 2, 2, 2),
      body: SafeArea(child: body),
      appBar: appBar,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex ?? 0,
        onTap: (index) => _onItemTapped(context, index),
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Members'),
          BottomNavigationBarItem(
            icon: Icon(Icons.memory),
            label: 'Components',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About Us',
          ),
        ],
      ),
    );
  }
}
