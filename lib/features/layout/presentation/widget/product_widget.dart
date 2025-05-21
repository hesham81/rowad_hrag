import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductsDataModel product;

  const ProductWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: CachedNetworkImage(
              imageUrl: product.thumbnailImage,
              height: 0.2.height,
            ),
          ),
          Text(
            (product.name.length > 17)
                ? product.name.substring(0, 17)
                : product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            product.mainPrice,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.secondaryColor,
                ),
          ),
        ],
      ),
    );
  }
}
