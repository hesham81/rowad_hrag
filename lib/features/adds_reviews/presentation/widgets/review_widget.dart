import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/alignment.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/core/widget/icon_text.dart';
import 'package:rowad_hrag/features/adds_reviews/data/models/adds_reviews_data_model.dart';

class AddsReviewWidget extends StatelessWidget {
  final AddsReviewsDataModel review;

  const AddsReviewWidget({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        child: Column(
      children: [
        Row(
          children: [
            Text(
              review.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
            IconText(
              rate: review.rate,
            ),
          ],
        ),
        0.01.height.hSpace,
        Text(
          review.productName,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold, color: Colors.black.withAlpha(80)),
        ).leftTopWidget(),
        0.01.height.hSpace,
        Divider().hPadding(0.05.width),
        0.01.height.hSpace,
        Text(
          review.comment,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    ));
  }
}
