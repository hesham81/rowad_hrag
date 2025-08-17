import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/layout/data/models/reviews_data_model.dart';
import 'package:rowad_hrag/features/layout/domain/entities/reviews.dart';

class ReviewWidgetItem extends StatefulWidget {
  final Reviews review;

  const ReviewWidgetItem({
    super.key,
    required this.review,
  });

  @override
  State<ReviewWidgetItem> createState() => _ReviewWidgetItemState();
}

class _ReviewWidgetItemState extends State<ReviewWidgetItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          widget.review.shopName ?? "لايوجد اسم",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        0.01.height.hSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            for (int i = 0; i < widget.review.rate; i++)
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 35,
              ),
          ],
        ),
        0.01.height.hSpace,
        Text(
          widget.review.review,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        0.01.height.hSpace,
      ],
    ).hPadding(0.03.width);
  }
}
