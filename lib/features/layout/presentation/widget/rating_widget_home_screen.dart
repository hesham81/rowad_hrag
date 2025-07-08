import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/reviews.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/reviews_data_model.dart';

class RatingWidgetHomeScreen extends StatelessWidget {
  final List<ReviewsDataModel> reviews;

  const RatingWidgetHomeScreen({
    super.key,
    required this.reviews,
  });

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
        children: [
          0.01.height.hSpace,
          Text(
            "المراجعات والتقيمات",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.bold,
                ),
          ).alignRight().allPadding(5),
          ReviewsWidget(
            reviews: (reviews.length < 3)
                ? reviews
                : reviews.sublist(0, 3),
          ),
        ],
      ),
    ).hPadding(0.03.width);
  }
}
