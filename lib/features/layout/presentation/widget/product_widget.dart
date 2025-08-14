import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';

import '../../../../core/route/route_names.dart';

class ProductWidget extends StatefulWidget {
  final ProductsDataModel product;

  const ProductWidget({
    super.key,
    required this.product,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  String _formatDateArabic(int days) {
    if (days == 0) return "اليوم";

    int months = (days / 30).floor();

    if (months == 0) {
      return "منذ $days يوم";
    } else if (months == 1) {
      return "منذ شهر";
    } else if (months == 2) {
      return "منذ شهرين";
    } else if (months >= 3 && months <= 10) {
      final arabicNumbers = ['٣', '٤', '٥', '٦', '٧', '٨', '٩', '١٠'];
      return "منذ ${arabicNumbers[months - 3]} شهور";
    } else {
      return "منذ $months شهر";
    }
  }

  @override
  Widget build(BuildContext context) {
    // Responsive base: Use screen width/height
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = screenWidth > 600;

    // Responsive font size
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
      child: CustomContainer(
        padding: EdgeInsets.zero,
        width: containerWidth, // Responsive width
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl, // Ensure RTL
          children: [
            Expanded(
              flex: 7,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.product.thumbnailImage,
                  height: imageSize,
                  width: isTablet ? 0.25.width : 0.3.width,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[200],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported,
                        color: Colors.grey),
                  ),
                ),
              ),
            ),
            0.02.width.vSpace,

            // Text Content (Right-aligned in RTL)
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Product Name
                  Text(
                    widget.product.name.length > 40
                        ? '${widget.product.name.substring(0, 40)}...'
                        : widget.product.name,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: _responsiveFontSize(),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  0.01.height.hSpace,

                  // Price
                  Text(
                    widget.product.mainPrice,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: _responsiveFontSize() + 1,
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  0.01.height.hSpace,

                  // City & State
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        widget.product.cityName ?? "",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: _responsiveFontSize(),
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const Text("، ", style: TextStyle(fontSize: 16)),
                      Expanded(
                        child: Text(
                          widget.product.stateName ?? "",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: _responsiveFontSize(),
                                    color: AppColors.secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  0.01.height.hSpace,
                  Text(
                    widget.product.userName,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: _responsiveFontSize(),
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Time Ago

                  0.01.height.hSpace,
                  Text(
                    _formatDateArabic(
                      DateTime.now()
                          .difference(widget.product.createdAt!)
                          .inDays,
                    ),
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: _responsiveFontSize() - 1,
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  // Seller Name
                ],
              ),
            ),

            // Image (Responsive Size)
          ],
        ).allPadding(padding),
      ),
    );
  }
}
