import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/reviews.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/reviews_data_model.dart';

class RatingWidgetHomeScreen extends StatefulWidget {
  final List<ReviewsDataModel> reviews;

  const RatingWidgetHomeScreen({
    super.key,
    required this.reviews,
  });

  @override
  State<RatingWidgetHomeScreen> createState() => _RatingWidgetHomeScreenState();
}

class _RatingWidgetHomeScreenState extends State<RatingWidgetHomeScreen> {
  late Timer _timer;
  int _currentPage = 0;

  static const int reviewsPerPage = 3; // Number of reviews to show at once

  @override
  void initState() {
    super.initState();

    final total_pages = (widget.reviews.length / reviewsPerPage).ceil();

    // Only start timer if there's more than one page
    if (total_pages > 1) {
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        setState(() {
          _currentPage = (_currentPage + 1) % total_pages;
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Safely cancel timer if it exists
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reviews = widget.reviews;

    // Handle empty reviews
    if (reviews.isEmpty) {
      return Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.secondaryColor),
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
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "لا توجد مراجعات بعد",
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ).hPadding(0.03.width);
    }

    final total_pages = (reviews.length / reviewsPerPage).ceil();

    // If only one page, show all reviews (up to 3)
    if (total_pages <= 1) {
      final currentReviews = reviews.length <= 3 ? reviews : reviews.sublist(0, 3);
      return _buildReviewContainer(currentReviews);
    }

    // Calculate current page reviews
    final startIndex = _currentPage * reviewsPerPage;
    final endIndex = (startIndex + reviewsPerPage).clamp(0, reviews.length);
    final currentReviews = reviews.sublist(startIndex, endIndex);

    return _buildReviewContainer(currentReviews);
  }

  /// Builds the container with title and ReviewsWidget
  Widget _buildReviewContainer(List<ReviewsDataModel> currentReviews) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.secondaryColor),
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
          ReviewsWidget(reviews: currentReviews),
        ],
      ),
    ).hPadding(0.03.width);
  }
}