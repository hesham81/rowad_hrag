import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';

import '../../../../core/route/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../layout/data/models/products_data_model.dart';

class AllProductsWidget extends StatelessWidget {
  final ProductsDataModel product;

  const AllProductsWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        RouteNames.productDetails,
        arguments: product.slug,
      ),
      child: CustomContainer(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: product.thumbnailImage,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Text(
                    product.strokedPrice,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor),
                  ),
                ),
              ],
            ).allPadding(4)
          ],
        ),
      ),
    );
  }
}
