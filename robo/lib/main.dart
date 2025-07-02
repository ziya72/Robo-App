import 'package:flutter/material.dart';
import 'package:robo/components/component_form.dart';
import 'package:robo/components/membership_form.dart';
import 'package:robo/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RoboClub',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: HomePage(),
      routes: {
        '/components/membership_form': (context) => RegistrationForm(),
        '/components/component_form': (context) => ComponentForm(),
      },
    );
  }
}
