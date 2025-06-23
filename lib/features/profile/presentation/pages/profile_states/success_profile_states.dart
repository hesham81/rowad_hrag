import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/profile/data/models/seller_profile_data_model.dart';

import '../../../../../core/widget/custom_elevated_button.dart';
import '../../widgets/points_item_cart.dart';
import '../../widgets/profile_item_cart.dart';
import '../adds_screen.dart';

class SuccessProfileStates extends StatelessWidget {
  final SellerProfileDataModel profileDataModel;

  const SuccessProfileStates({
    super.key,
    required this.profileDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            0.01.height.hSpace,
            CircleAvatar(
              radius: 150,
              backgroundImage: NetworkImage(
                profileDataModel.image,
              ),
            ),
            0.01.height.hSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  profileDataModel.name,
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
                    "50 نقاط",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
            Text(
              profileDataModel.email,
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
                      newPage: AddsScreen(),
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
                    onPressed: () {},
                  ),
                )
              ],
            ),
            0.01.height.hSpace,
            ProfileItemCart(
              imagePath: "assets/images/box.jpg",
              title: "الاعلانات",
              count: profileDataModel.products.toString(),
            ),
            0.01.height.hSpace,
            ProfileItemCart(
              imagePath: "assets/images/star.jpg",
              title: "تقييم",
              count: profileDataModel.rating.toString(),
              withPadding: true,
            ),
            0.01.height.hSpace,
            PointsItemCart(
              color: Color(0xff0abb75),
              title: 'النقاط النشطة',
              desc: "إجمالي النقاط النشطة",
              totalPoints: "50",
              balance: "3",
            ),
            0.02.height.hSpace,
            PointsItemCart(
              color: Color(0xfff24b6c),
              title: 'النقاط المنتهيه',
              desc: "إجمالي النقاط المنتهيه",
              totalPoints: "0",
              balance: "0",
            ),
            0.02.height.hSpace,
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
