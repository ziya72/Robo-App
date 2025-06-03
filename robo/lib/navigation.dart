import 'package:flutter/material.dart';

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(children: [
        HomeScreen(),
        Screen2(),
        Screen3(),
        ]),
      )
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
