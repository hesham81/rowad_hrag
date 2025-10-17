import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';

import '../../../../core/route/route_names.dart';

class ProductWidget extends StatefulWidget {
  final ProductsDataModel product;
  final bool displayFavourite;

  const ProductWidget({
    super.key,
    required this.product,
    this.displayFavourite = true,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = screenWidth > 600;

    double _responsiveFontSize() {
      if (isTablet) return 16.0;
      return screenWidth < 380 ? 12.0 : 14.0;
    }

    final double imageSize = isTablet ? 0.3.height : 0.25.height;
    final double containerWidth = isTablet ? 0.4.width : 0.7.width;
    final double padding = isTablet ? 16.0 : 10.0;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        RouteNames.productDetails,
        arguments: widget.product.slug,
      ),
      child: Container(
        width: 0.45.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.darkTeal,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: widget.product.thumbnailImage,
                height: 0.15.height,
                width: double.maxFinite,
                fit: BoxFit.contain,
              ).center,
            ),
            0.01.height.hSpace,
            Text(
              widget.product.name,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            0.01.height.hSpace,
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  widget.product?.mainPrice ?? "",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Spacer(),
                if (widget.displayFavourite)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    icon: Icon(
                      (isLiked) ? Icons.favorite : Icons.favorite_outline,
                      color: AppColors.secondaryColor,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
