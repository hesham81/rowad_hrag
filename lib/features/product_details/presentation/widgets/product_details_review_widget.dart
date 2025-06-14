import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';

import '../../domain/entities/product_details_review.dart';

class ProductDetailsReviewWidget extends StatelessWidget {
  final ProductDetailsReview productDetailsReview;

  const ProductDetailsReviewWidget({
    super.key,
    required this.productDetailsReview,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  productDetailsReview.user.name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "${productDetailsReview.createdAt.day}-${productDetailsReview.createdAt.month}-${productDetailsReview.createdAt.year}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                0.01.height.hSpace,
                Text(
                  productDetailsReview.comment,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          0.02.width.vSpace,
          Expanded(
            flex: 2,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(
                productDetailsReview.user.avatar ?? "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
