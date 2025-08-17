import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/features/profile/data/models/profile_points_data_model.dart';
import 'package:rowad_hrag/features/profile/data/models/seller_profile_data_model.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            0.01.height.hSpace,
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 150,
                  backgroundImage: NetworkImage(
                    widget.profileDataModel.image,
                  ),
                ),
                Image.network(
                  widget.profileDataModel.verifiedImg,
                  height: 80,
                )
              ],
            ),
            0.01.height.hSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.profileDataModel.name,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                0.02.width.vSpace,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "${widget.totalPoints} نقاط",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
            Text(
              widget.profileDataModel.email,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withAlpha(50),
                  ),
            ),
            0.01.height.hSpace,
            0.01.height.hSpace,
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    child: Text(
                      "الاعلانات",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    onPressed: () => slideLeftWidget(
                      newPage: AddsScreen(
                        adds: widget.allAddsDataModel,
                      ),
                      context: context,
                    ),
                  ),
                ),
                0.01.width.vSpace,
                Expanded(
                  child: CustomElevatedButton(
                    child: Text(
                      "تعليقات الاعلانات",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.addsReviews,
                      );
                    },
                  ),
                )
              ],
            ),
            0.01.height.hSpace,
            ProfileItemCart(
              imagePath: "assets/images/box.jpg",
              title: "الاعلانات",
              callBack: () {
                slideLeftWidget(
                  newPage: AddsScreen(
                    adds: widget.allAddsDataModel,
                  ),
                  context: context,
                );
              },
              count: widget.profileDataModel.products.toString(),
            ),
            0.01.height.hSpace,
            ProfileItemCart(
              imagePath: "assets/images/star.jpg",
              title: "تقييم",
              count: widget.profileDataModel.rating.toString(),
              withPadding: true,
            ),
            0.01.height.hSpace,
            PointsItemCart(
              color: Color(0xff0abb75),
              title: 'النقاط النشطة',
              desc: "إجمالي النقاط النشطة",
              totalPoints: unExpiredPointsCount.toString(),
              balance: (unExpiredPointsCount ~/ 50 * 2).toString(),
            ),
            0.02.height.hSpace,
            PointsItemCart(
              color: Color(0xfff24b6c),
              title: 'النقاط المنتهيه',
              desc: "إجمالي النقاط المنتهيه",
              totalPoints: expiredPointsCount.toString(),
              balance: (expiredPointsCount ~/ 50 * 2).toString(),
            ),
            0.02.height.hSpace,
            SizedBox(
              width: double.maxFinite,
              child: CustomElevatedButton(
                btnColor: Colors.red,
                onPressed: widget.deleteAccount,
                child: Text(
                  "حذف الحساب",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            0.05.height.hSpace,
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
