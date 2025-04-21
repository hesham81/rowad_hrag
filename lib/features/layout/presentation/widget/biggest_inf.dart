import 'package:flutter/material.dart';
import '/core/extensions/alignment.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';

class BiggestInf extends StatelessWidget {
  const BiggestInf({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.3.height,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secondaryColor,
        ),
        color: AppColors.secondaryColor.withAlpha(35),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            "كبار المعلنين",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ).rightBottomWidget().allPadding(25),
    );
  }
}
