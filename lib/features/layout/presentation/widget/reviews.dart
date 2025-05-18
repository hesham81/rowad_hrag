import 'package:flutter/material.dart';
import 'package:rowad_hrag/features/layout/domain/entities/reviews.dart';
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
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            reviews[index].shopName ?? "لايوجد اسم",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          0.01.height.hSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (int i = 0; i < reviews[index].rate; i++)
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 35,
                ),
            ],
          ),
          0.01.height.hSpace,
          Text(
            reviews[index].review ,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          0.01.height.hSpace,
        ],
      ).hPadding(0.03.width),
      separatorBuilder: (context, index) => 0.01.height.hSpace,
      itemCount: reviews.length,
    );
  }
}
