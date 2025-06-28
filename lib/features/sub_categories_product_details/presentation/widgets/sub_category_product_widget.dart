import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/core/widget/icon_text.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/sub_categories_products_data_model.dart';

class SubCategoryProductWidget extends StatelessWidget {
  final SubCategoriesProductsDataModel subCategoriesProductsDataModel;

  const SubCategoryProductWidget({
    super.key,
    required this.subCategoriesProductsDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: subCategoriesProductsDataModel.image,
              ),
            ),
            0.01.height.hSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    subCategoriesProductsDataModel.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                IconText(rate: subCategoriesProductsDataModel.rating),

              ],
            ).hPadding(0.02.width),
            0.01.height.hSpace,
            Text(
              subCategoriesProductsDataModel.price,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

          ],
        )).hPadding(0.03.width);
  }
}
