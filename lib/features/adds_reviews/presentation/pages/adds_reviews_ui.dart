import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/adds_reviews/data/models/adds_reviews_data_model.dart';
import 'package:rowad_hrag/features/adds_reviews/presentation/widgets/review_widget.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/reviews.dart';

class AddsReviewsUi extends StatelessWidget {
  final List<AddsReviewsDataModel> reviews;

  const AddsReviewsUi({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            0.01.height.hSpace,
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => AddsReviewWidget(
                review: reviews[index],
              ),
              separatorBuilder: (context, index) => 0.01.height.hSpace,
              itemCount: reviews.length,
            ).hPadding(0.03.width),
          ],
        ),
      ),
    );
  }
}
