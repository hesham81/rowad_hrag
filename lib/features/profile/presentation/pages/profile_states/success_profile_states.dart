import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/profile/data/models/profile_points_data_model.dart';
import 'package:rowad_hrag/features/profile/data/models/seller_profile_data_model.dart';
import 'package:rowad_hrag/features/profile_drawer/presentation/widgets/custom_profile_tab_icon.dart';

import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../data/models/all_adds_data_model.dart';
import '../../widgets/points_item_cart.dart';
import '../../widgets/profile_item_cart.dart';
import '../adds_screen.dart';

class SuccessProfileStates extends StatefulWidget {
  final SellerProfileDataModel profileDataModel;
  final List<AllAddsDataModel> allAddsDataModel;
  final List<ProfilePointsDataModel> points;
  final int totalPoints;
  final Function() deleteAccount;

  const SuccessProfileStates({
    super.key,
    required this.profileDataModel,
    required this.allAddsDataModel,
    required this.points,
    required this.totalPoints,
    required this.deleteAccount,
  });

  @override
  State<SuccessProfileStates> createState() => _SuccessProfileStatesState();
}

class _SuccessProfileStatesState extends State<SuccessProfileStates> {
  List<ProfilePointsDataModel> unExpiredPoints = [];
  List<ProfilePointsDataModel> expiredPoints = [];

  int unExpiredPointsCount = 0;
  int expiredPointsCount = 0;

  @override
  void initState() {
    expiredPoints = widget.points
        .where(
          (element) => element.isExpired != 0,
        )
        .toList();
    unExpiredPoints = widget.points
        .where(
          (element) => element.isExpired == 0,
        )
        .toList();
    for (var point in unExpiredPoints) {
      unExpiredPointsCount += point.points;
    }
    for (var point in expiredPoints) {
      expiredPointsCount += point.points;
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         0.01.height.hSpace,
    //         Stack(
    //           alignment: Alignment.bottomRight,
    //           children: [
    //             CircleAvatar(
    //               radius: 150,
    //               backgroundImage: NetworkImage(
    //                 widget.profileDataModel.image,
    //               ),
    //             ),
    //             Image.network(
    //               widget.profileDataModel.verifiedImg,
    //               height: 80,
    //             )
    //           ],
    //         ),
    //         0.01.height.hSpace,
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               widget.profileDataModel.name,
    //               style: Theme.of(context).textTheme.titleLarge!.copyWith(
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.black,
    //                   ),
    //             ),
    //             0.02.width.vSpace,
    //             Container(
    //               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //               decoration: BoxDecoration(
    //                 color: Colors.green,
    //                 borderRadius: BorderRadius.circular(10),
    //               ),
    //               child: Text(
    //                 "${widget.totalPoints} نقاط",
    //                 style: Theme.of(context).textTheme.titleSmall!.copyWith(
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.white,
    //                     ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         Text(
    //           widget.profileDataModel.email,
    //           style: Theme.of(context).textTheme.labelLarge!.copyWith(
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.black.withAlpha(50),
    //               ),
    //         ),
    //         0.01.height.hSpace,
    //         0.01.height.hSpace,
    //         Row(
    //           children: [
    //             Expanded(
    //               child: CustomElevatedButton(
    //                 child: Text(
    //                   "الاعلانات",
    //                   style: Theme.of(context).textTheme.titleMedium!.copyWith(
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white,
    //                       ),
    //                 ),
    //                 onPressed: () => slideLeftWidget(
    //                   newPage: AddsScreen(
    //                     adds: widget.allAddsDataModel,
    //                   ),
    //                   context: context,
    //                 ),
    //               ),
    //             ),
    //             0.01.width.vSpace,
    //             Expanded(
    //               child: CustomElevatedButton(
    //                 child: Text(
    //                   "تعليقات الاعلانات",
    //                   style: Theme.of(context).textTheme.titleMedium!.copyWith(
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white,
    //                       ),
    //                 ),
    //                 onPressed: () {
    //                   Navigator.pushNamed(
    //                     context,
    //                     RouteNames.addsReviews,
    //                   );
    //                 },
    //               ),
    //             )
    //           ],
    //         ),
    //         0.01.height.hSpace,
    //         ProfileItemCart(
    //           imagePath: "assets/images/box.jpg",
    //           title: "الاعلانات",
    //           callBack: () {
    //             slideLeftWidget(
    //               newPage: AddsScreen(
    //                 adds: widget.allAddsDataModel,
    //               ),
    //               context: context,
    //             );
    //           },
    //           count: widget.profileDataModel.products.toString(),
    //         ),
    //         0.01.height.hSpace,
    //         ProfileItemCart(
    //           imagePath: "assets/images/star.jpg",
    //           title: "تقييم",
    //           count: widget.profileDataModel.rating.toString(),
    //           withPadding: true,
    //         ),
    //         0.01.height.hSpace,
    //         PointsItemCart(
    //           color: Color(0xff0abb75),
    //           title: 'النقاط النشطة',
    //           desc: "إجمالي النقاط النشطة",
    //           totalPoints: unExpiredPointsCount.toString(),
    //           balance: (unExpiredPointsCount ~/ 50 * 2).toString(),
    //         ),
    //         0.02.height.hSpace,
    //         PointsItemCart(
    //           color: Color(0xfff24b6c),
    //           title: 'النقاط المنتهيه',
    //           desc: "إجمالي النقاط المنتهيه",
    //           totalPoints: expiredPointsCount.toString(),
    //           balance: (expiredPointsCount ~/ 50 * 2).toString(),
    //         ),
    //         0.02.height.hSpace,
    //         SizedBox(
    //           width: double.maxFinite,
    //           child: CustomElevatedButton(
    //             btnColor: Colors.red,
    //             onPressed: widget.deleteAccount,
    //             child: Text(
    //               "حذف الحساب",
    //               style: Theme.of(context).textTheme.titleLarge!.copyWith(
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.white,
    //                   ),
    //             ),
    //           ),
    //         ),
    //         0.05.height.hSpace,
    //       ],
    //     ).hPadding(0.03.width),
    //   ),
    // );
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              0.01.height.hSpace,
              CircleAvatar(
                radius: 85,
                backgroundImage: CachedNetworkImageProvider(
                  widget.profileDataModel.image,
                ),
              ).center,
              0.01.height.hSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.profileDataModel.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor,
                        ),
                  ),
                  0.02.width.vSpace,
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.edit,
                      color: AppColors.secondaryColor,
                    ),
                  )
                ],
              ),
              0.01.height.hSpace,
              Container(
                padding: EdgeInsets.all(10),
                // height: 0.9.height,
                width: 0.9.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.greenColor.withAlpha(30),
                ),
                child: Column(
                  children: [
                    CustomProfileTabIcon(
                      text: "المدونات",
                      imagePath:
                          "assets/icons/1ab75a335728c15256e51783593f0dc701ff9f83.png",
                      onTap: () => pushNamed(
                        newPage: RouteNames.blogs,
                        context: context,
                      ),
                    ),
                    0.03.height.hSpace,
                    CustomProfileTabIcon(
                      text: "أضف عرض",
                      imagePath:
                          "assets/icons/83d25617f98c4abb7e36c2ec89748dfdae13cd24.png",
                      onTap: () {},
                    ),
                    0.03.height.hSpace,
                    CustomProfileTabIcon(
                      text: "طلبات الشراء",
                      imagePath:
                          "assets/icons/16dceec433833cb4d80ef2fe0ddcae3a16e65763.png",
                      onTap: () {},
                    ),
                    0.03.height.hSpace,
                    CustomProfileTabIcon(
                      text: "محفظة",
                      imagePath:
                          "assets/icons/9edf6210a75ab015af70ab7991620f2ff068a6f9.png",
                      onTap: () {},
                    ),
                    0.03.height.hSpace,
                    //
                    CustomProfileTabIcon(
                      text: "قائمة المتابعة",
                      imagePath:
                          "assets/icons/c3347b7b5e351c7eab68314c08cca1ca1c95cea9.png",
                      // "assets/icons/b0c764b26d190a804ba19e8092eebd572a712c13.png",
                      onTap: () {},
                    ),
                    0.03.height.hSpace,
                    CustomProfileTabIcon(
                      text: "فواتيري",
                      imagePath:
                          "assets/icons/de26c44c575c1faee7381b5e963f90dc9d0f03d0.png",
                      onTap: () {},
                    ),
                    0.03.height.hSpace,
                    CustomProfileTabIcon(
                      text: "الاعدادات",
                      imagePath:
                          "assets/icons/92e224f349ab0e242bc55e3aa77ece4f439c5c0a.png",
                      onTap: () {},
                    ),
                    0.03.height.hSpace,
                    CustomProfileTabIcon(
                      text: "اتصل بنا",
                      imagePath:
                          "assets/icons/d221df25eda381cdc31c0422d0b5b3b461a358b9.png",
                      onTap: () {},
                    ),
                    0.03.height.hSpace,
                    CustomProfileTabIcon(
                      text: "شارك تطبيق رواد حراج",
                      imagePath:
                          "assets/icons/001e7f360f06f47905f0b77c34d1baae73bc26f9.png",
                      onTap: () {},
                    ),
                    0.03.height.hSpace,
                    CustomProfileTabIcon(
                      text: "سياسة موقع رواد حراج",
                      imagePath:
                          "assets/icons/b0c764b26d190a804ba19e8092eebd572a712c13.png",
                      onTap: () {},
                    ),
                    0.03.height.hSpace,
                    CustomProfileTabIcon(
                      text: "مركز الامان",
                      imagePath:
                          "assets/icons/7b31e21207dac6bda1ad2bd4c7358ce3d18af89f.png",
                      onTap: () {},
                    ),
                  ],
                ).allPadding(8),
              ),
              0.04.height.hSpace,
              // CustomProfileTabIcon(
              //   text: "تسجيل خروج - ${widget.profileDataModel.name}",
              //   imagePath: "assets/icons/b7d22427f5adf3c7a5176b2e95791718eedb8afd.png",
              //   onTap: () {},
              //   isWithArrow: false,
              // ).center,
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/b7d22427f5adf3c7a5176b2e95791718eedb8afd.png",
                    height: 40,
                    width: 40,
                  ),
                  0.08.width.vSpace,
                  Text(
                    "${widget.profileDataModel.name}تسجيل خروج",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              0.05.height.hSpace,
            ],
          ),
        ),
      ),
    );
  }
}
