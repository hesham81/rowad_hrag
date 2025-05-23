import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/features/layout/presentation/pages/home_screen.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/home_profile.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  var pages = [
    HomeScreen(),
    HomeProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Color(0xff0AB28F),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color(0xff7AD7C4),
              size: 30,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Color(0xff7AD7C4),
            ),
            label: 'الصفحة الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 30,
              color: Color(0xff7AD7C4),
            ),
            activeIcon: Icon(
              Icons.person,
              color: Color(0xff7AD7C4),
            ),
            label: 'المفضلة',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pushNamed(
          newPage: RouteNames.addAdds,
          context: context,
        ),
        backgroundColor: Color(0xff0AB28F),
        shape: CircleBorder(
          side: BorderSide(
            color: Color(0xffE3F1EE),
            width: 3,
          ),
        ),
        child: Icon(
          Icons.add,
          size: 35,
          color: Color(0xff7AD7C4),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages[selectedIndex],
    );
  }
}
