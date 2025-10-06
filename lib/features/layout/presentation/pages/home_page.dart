import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/services/url_launcher_func.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/favourite_tab/presentation/pages/favourite_tab.dart';
import 'package:rowad_hrag/features/layout/presentation/pages/home_screen.dart';
import 'package:rowad_hrag/features/login_to_continue/presentation/pages/login_to_continue.dart';
import 'package:rowad_hrag/features/profile/presentation/manager/profile_cubit.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/home_profile.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/profile.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/profile_drawer.dart';
import 'package:rowad_hrag/features/search_tab/presentation/pages/search_tab.dart';

import '../../../../core/services/cash_helper.dart';
import '../../../profile_drawer/presentation/pages/profile_drawer.dart';

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
    SearchTab(),
    SizedBox(),
    FavouriteTab(),
    Profile(
      isHome: true,
    ),
    // ProfileDrawer(),
    // These pages will access the same Cubit provided at top level
  ];
  final List<Widget> pagesUnAuth = [
    HomeScreen(),

    SearchTab(),
    SizedBox(),
    LoginToContinue(),
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
              if (index == 2) {
                return;
              }
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/icons/c2a7330e3af865cdac79a337aae12f37e9c1a159.png",
                ),
                color: Colors.grey,
              ),
              activeIcon: ImageIcon(
                AssetImage(
                  "assets/icons/c2a7330e3af865cdac79a337aae12f37e9c1a159.png",
                ),
                color: Color(0xff7AD7C4),
              ),
              label: 'الصفحة الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.search,
                color: AppColors.secondaryColor,
              ),
              label: 'الصفحة الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(),
              activeIcon: SizedBox(),
              label: 'الصفحة الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.favorite,
                color: AppColors.secondaryColor,
              ),
              label: 'الصفحة الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  "assets/icons/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.png-removebg-preview.png",
                ),
              ),
              activeIcon: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(
                  "assets/icons/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.png-removebg-preview.png",
                ),
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
          backgroundColor: AppColors.greenColor,
          shape: CircleBorder(
              // side: BorderSide(
              //   color: const Color(0xffE3F1EE),
              //   width: 3,
              // ),
              ),
          child: Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
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
