import 'package:flutter/material.dart';
import 'package:robo/nav-bar/home/home.dart';
import 'package:robo/nav-bar/membership/members.dart';
import 'package:robo/nav-bar/teams/teams.dart';
import 'package:robo/utils/theme/colors.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int currentIndex = 0;
  final List<Widget> screens = [HomeScreen(), TeamScreen(), MemberScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Teams'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Members'),
        ],
      ),
    );
  }
}

//class NavigationMenu extends StatelessWidget {
//  const NavigationMenu({super.key});
//
//  //bool get isDarkMode => null;
//
//  @override
//  Widget build(BuildContext context) {
//    //final deviceController = Get.put(DeviceController());
//    //final controller = Get.put(UserController());
//    //final graphController = Get.put(GraphDataController());
//    return DefaultTabController(
//      length: 3,
//      child: Scaffold(
//        body: TabBarView(children: [
//          HomeScreen(),
//          GraphScreen(),
//          ProfileScreen(),
//        ]),
//        bottomNavigationBar: Container(
//            color: VHelperFunctions.isDarkMode(context)
//                ? VColors.black
//                : VColors.white,
//            //color: Theme.of(context).brightness == Brightness.dark? Colors.blue: Colors.white
//            child: const TabBar(
//              tabs: [
//                Tab(icon: Icon(Iconsax.home), text: 'Home'),
//                Tab(icon: Icon(Iconsax.graph), text: 'Graph'),
//                Tab(icon: Icon(Iconsax.user), text: 'Profile'),
//              ],
//              indicatorColor: Colors.grey,
//              labelColor: Colors.grey,
//              unselectedLabelColor: Colors.black54,
//            )),
//      ),
//    );
//  }
//}
