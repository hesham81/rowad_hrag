import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/features/layout/data/models/top_sellers_data_model.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/biggest_seller_cart.dart';
import '/core/extensions/alignment.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';

class BiggestInf extends StatelessWidget {
  final List<TopSellersDataModel> list;

  const BiggestInf({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.34.height,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secondaryColor,
        ),
        color: AppColors.secondaryColor.withAlpha(35),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "كبار المعلنين",
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          0.01.height.hSpace,
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => BiggestSellerCart(
                topSellersDataModel: list[index],
              ),
              separatorBuilder: (context, index) => 0.03.width.vSpace,
              itemCount: list.length,
            ),
          ),
        ],
      ).rightBottomWidget().allPadding(25),
    );
  }
}
