import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/features/plans/data/models/plans_data_model.dart';

import '../../../../core/theme/app_colors.dart';

class CardSubscriptionItem extends StatelessWidget {
  final bool isSelected;

  final PlansDataModel plans;

  const CardSubscriptionItem({
    super.key,
    this.isSelected = false,
    required this.plans,
  });

  @override
  Widget build(BuildContext context) {
    String hexColor = plans.color;

// Remove '#' if present
    hexColor = hexColor.replaceAll('#', '');

// Ensure it's 6 characters
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor; // Add alpha value (FF = fully opaque)
    }

    int hexValue = int.parse(hexColor, radix: 16);
    Color dynamicColor = Color(hexValue);
    return CustomContainer(
      color: isSelected ? AppColors.primaryColor : Colors.white,
      child: Row(
        children: [
          0.02.width.vSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                plans.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              0.01.height.hSpace,
              Text(
                "${plans.numberOfAds} اعلان",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              0.01.height.hSpace,
              Text(
                "${plans.numberOfPublishAndBuy} عمليه بيع وشراء",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ],
          ),
          Spacer(),
          Text(
            "${plans.price} ريال",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: dynamicColor,
                ),
          )
        ],
      ),
    );
  }
}
