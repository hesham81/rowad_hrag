import 'package:flutter/material.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.secondaryColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "المراجعات والتقيمات",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          0.01.height.hSpace,
          Text(
            "احمد علي",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          0.01.height.hSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (int i = 0; i < 5; i++)
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 35,
                ),
            ],
          ),
          0.01.height.hSpace,
          Text(
            "حسام غالي",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          0.01.height.hSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (int i = 0; i < 5; i++)
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 35,
                ),
            ],
          ),
          0.01.height.hSpace,
        ],
      ).hPadding(0.03.width),
    );
  }
}
