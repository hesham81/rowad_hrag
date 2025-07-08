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
        // height: 0.3.height,
        //   width: double,,
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: subCategoriesProductsDataModel.image,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: IconText(
                  //     rate: subCategoriesProductsDataModel.rating,
                  //   ),
                  // ),
                ],
              ),
            ),
            0.01.height.hSpace,
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      subCategoriesProductsDataModel.name,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      subCategoriesProductsDataModel.price.replaceAll("ريال", ""),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                    ),
                  ),
                ],
              ).hPadding(0.02.width),
            ),
            0.01.height.hSpace,
          ],
        )).hPadding(0.03.width);
  }
}
