import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/services/url_launcher_func.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/layout/presentation/pages/home_screen.dart';
import 'package:rowad_hrag/features/login_to_continue/presentation/pages/login_to_continue.dart';
import 'package:rowad_hrag/features/profile/presentation/manager/profile_cubit.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/home_profile.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/profile.dart';

import '../../../../core/services/cash_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String? token;

  Future<void> _getCurrentToken() async {
    token = await CashHelper.getString("token");
    (token == null)
        ? pages.addAll(pagesUnAuth)
        : pages.addAll(pagesUnConverted);
    setState(() {});
  }

  final List<Widget> pages = [];

  final List<Widget> pagesUnConverted = [
    HomeScreen(),
    Profile(
      isHome: true,
    ),
    // These pages will access the same Cubit provided at top level
  ];
  final List<Widget> pagesUnAuth = [
    HomeScreen(),
    LoginToContinue(),
    // These pages will access the same Cubit provided at top level
  ];

  late ProfileCubit profileCubit;

  @override
  void initState() {
    Future.wait(
      [
        _getCurrentToken(),
      ],
    );
    super.initState();
    profileCubit = ProfileCubit();

    setState(() {});
    // You can load data here if needed
    // profileCubit.loadData();
  }

  @override
  void dispose() {
    profileCubit.close(); // Always close cubit when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: profileCubit,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          backgroundColor: Colors.grey.shade50.withAlpha(80),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
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
              label: 'الصفحة الرئيسية',
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
          onPressed: () async {
            await UrlLauncherFunc.openUrl(
              "https://rowad-harag.com/add-ad",
            );
          },
          backgroundColor: const Color(0xff0AB28F),
          shape: CircleBorder(
            side: BorderSide(
              color: const Color(0xffE3F1EE),
              width: 3,
            ),
          ),
          child: Icon(
            Icons.add,
            size: 35,
            color: const Color(0xff7AD7C4),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
      ),
    );
  }
}
