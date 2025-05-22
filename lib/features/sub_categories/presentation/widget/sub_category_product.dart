import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';

import '../../../../core/theme/app_colors.dart';

class SubCategoryProduct extends StatelessWidget {
  const SubCategoryProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  "https://rowad-harag.com/public/uploads/all/lGQTkx5BNhfoY2llC5kpPKrnEpfqaUPx0VjcBK0U.jpg",
            ),
          ),
          0.01.height.hSpace,
          Text(
            "سيارات",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          0.01.height.hSpace,
          Row(
            children: [
              Text(
                "سيارات",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Spacer(),
              Text(
                "100",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          0.01.height.hSpace,
          Row(
            children: [
              Text(
                "ابو محمد",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Spacer(),
              Text(
                "اسبوعين",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
