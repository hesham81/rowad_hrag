import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';

class ProfileItemCart extends StatelessWidget {
  final String imagePath;

  final String title;

  final String count;

  final bool withPadding;

  const ProfileItemCart({
    super.key,
    required this.imagePath,
    required this.title,
    required this.count,
    this.withPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 0.15.height,
      decoration: BoxDecoration(
        color: AppColors.darkTeal,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            color: AppColors.primaryColor,
          ).allPadding((withPadding) ? 15 : 0),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
              ),
              0.01.height.hSpace,
              Text(
                count,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
              ),
            ],
          )
        ],
      ).hPadding(0.01.width),
    );
  }
}
