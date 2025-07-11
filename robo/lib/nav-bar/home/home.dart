import 'package:flutter/material.dart';
import 'package:robo/utils/theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.background,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 0.0, bottom: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Innovators',
                    style: TextStyle(
                      color: AppColors.textMain,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Code, Create, Innovate',
                        style: TextStyle(
                          color: AppColors.textMain,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(width: 02),
                      Icon(
                        Icons.lightbulb_outline,
                        color: AppColors.primary,
                        size: 28,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(
                  Icons.notifications_active_sharp,
                  color: Colors.yellow,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(child: Column(children: [
            
          ],
        )),
    );
  }
}
