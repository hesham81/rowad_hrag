import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';

class FilteredProductsWidget extends StatefulWidget {
  final ProductsDataModel product;
  final bool isOdd;

  const FilteredProductsWidget({
    super.key,
    required this.product,
    required this.isOdd,
  });

  @override
  State<FilteredProductsWidget> createState() => _FilteredProductsWidgetState();
}

class _FilteredProductsWidgetState extends State<FilteredProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 0.23.height,
      decoration: BoxDecoration(
          color: (widget.isOdd)
              ? AppColors.primaryColor
              : AppColors.greenColor.withAlpha(110),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.greenColor)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: widget.product.thumbnailImage ?? "",
              fit: BoxFit.fill,
              height: 0.21.height,
              width: 0.35.width,
            ),
          ),
          0.02.width.vSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  widget.product.name ?? "",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                0.02.height.hSpace,
                Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.product.cityName ?? "",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    0.01.width.vSpace,
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                    ),
                  ],
                ),
                0.02.height.hSpace,
                Text(
                  widget.product.userName ?? "",
                  textDirection: TextDirection.rtl,
                )
              ],
            ),
          )
        ],
      ).allPadding(20),
    ).hPadding(0.03.width);
  }
}
