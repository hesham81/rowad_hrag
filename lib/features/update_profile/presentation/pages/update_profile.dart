import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/profile/data/models/seller_profile_data_model.dart';
import 'package:rowad_hrag/features/update_profile/presentation/widgets/update_profile_modal_sheet.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  int _currentIndex = 0;

  _bottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => UpdateProfileModalSheet(),
    );
  }

  String? profileImage;
  SellerProfileDataModel? profileData;

  @override
  void initState() {
    super.initState();
    _loadProfile(); // call async method
  }

  Future<void> _loadProfile() async {
    await Hive.openBox("profile");
    final dynamic profileJson = Hive.box("profile").get("profile");

    if (profileJson != null) {
      profileData = SellerProfileDataModel.fromJson(
        profileJson as Map<String, dynamic>,
      );
    }

    setState(() {}); // refresh UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 0.57.height,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: (profileData?.image == null)
                          ? Expanded(
                            child: CachedNetworkImage(
                                imageUrl: profileData?.image ??
                                    "https://t4.ftcdn.net/jpg/02/32/92/55/360_F_232925587_st4gM8b3TJHtjjddCIUNyVyFJmZqMmn4.jpg",
                                fit: BoxFit.cover,
                              ),
                          )
                          : Image.asset(
                              "assets/icons/6bba4bcefbf2517903b036b36a49572ab87e646b.png"),
                    ),
                    SafeArea(
                      child: Positioned.directional(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.secondaryColor,
                                    width: 1.8,
                                  ),
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.secondaryColor,
                                ).center.hPadding(5),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: _bottomSheet,
                              child: Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.secondaryColor,
                                    width: 1.8,
                                  ),
                                ),
                                child: Icon(
                                  Icons.more_vert,
                                  color: AppColors.secondaryColor,
                                ).center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).hPadding(0.04.width),
                    Positioned.fill(
                      bottom: 0.18.height,
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage: NetworkImage(
                          profileData?.image ??
                              "https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/522598565_2125203187989840_3408856964049920562_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=hwTNFISweNIQ7kNvwHr9Zdb&_nc_oc=AdnMQ0m3nJbD1zU_9WuWfehmMwdjnp6y6YD278GFwhgn3Qac3kW0fo-DBTVj4GEMRy4&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=RehYErSYGbaHAvrztoBhYQ&oh=00_Afc3Rm_jz4TBFDgEa2ocgWxON9TIBse3_H30HEuQCgsMow&oe=68F4CE91",
                        ),
                      ).alignBottom(),
                    ),
                    Positioned.fill(
                      top: 0.27.height,
                      child: Text(
                        "Hisham Aymen",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: AppColors.greenColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ).center,
                    ),
                    Positioned.fill(
                      bottom: 0.08.height,
                      child: TabBar(
                        onTap: (value) => setState(() {
                          _currentIndex = value;
                        }),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: AppColors.greenColor.withAlpha(90),
                        dividerColor: AppColors.greenColor.withAlpha(80),
                        dividerHeight: 0.002.height,
                        tabs: [
                          Text(
                            "العروض",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: (_currentIndex == 0)
                                      ? AppColors.greenColor
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            "سكوب",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: (_currentIndex == 1)
                                      ? AppColors.greenColor
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ).alignBottom(),
                    ),
                  ],
                ),
              ),
              Lottie.asset(
                "assets/icons/Coming Soon.json",
                repeat: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
