import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/reviews.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../adds_reviews/presentation/widgets/review_widget.dart';
import '../../../layout/data/models/reviews_data_model.dart';

class AllReviewsScreen extends StatelessWidget {
  final List<ReviewsDataModel> reviews;

  const AllReviewsScreen({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "التقييمات",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            0.01.height.hSpace,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: reviews.length,
              itemBuilder: (context, index) => ReviewsWidget(
                reviews: reviews,
              ),
            ).hPadding(0.03.width),
          ],
        ),
      ),
    );
  }
}
