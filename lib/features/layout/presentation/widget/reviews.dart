import 'package:flutter/material.dart';
import 'package:rowad_hrag/features/layout/domain/entities/reviews.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/review_widget.dart';
import '/core/extensions/extensions.dart';

class ReviewsWidget extends StatelessWidget {
  final List<Reviews> reviews;

  const ReviewsWidget({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ReviewWidgetItem(
        review: reviews[index],
      ),
      separatorBuilder: (context, index) => Divider().hPadding(0.04.width),
      itemCount: reviews.length,
    );
  }
}
