import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';

import '../../../../core/route/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../layout/data/models/products_data_model.dart';

class AllProductsWidget extends StatefulWidget {
  final ProductsDataModel product;

  const AllProductsWidget({
    super.key,
    required this.product,
  });

  @override
  State<AllProductsWidget> createState() => _AllProductsWidgetState();
}

class _AllProductsWidgetState extends State<AllProductsWidget> {
  String _formatDateArabic(DateTime past) {
    final now = DateTime.now();
    final diff = now.difference(past);
    final int totalMinutes = diff.inMinutes;
    final int totalHours = diff.inHours;
    final int days = totalHours ~/ 24;
    final int months = days ~/ 30;

    if (totalMinutes < 1) return "الآن";
    if (totalMinutes == 1) return "منذ دقيقة";
    if (totalMinutes == 2) return "منذ دقيقتين";
    if (totalMinutes >= 3 && totalMinutes <= 10) {
      const arabicNumerals = ['٣', '٤', '٥', '٦', '٧', '٨', '٩', '١٠'];
      return "منذ ${arabicNumerals[totalMinutes - 3]} دقائق";
    }
    if (totalMinutes < 60) return "منذ $totalMinutes دقيقة";

    if (totalHours == 1) return "منذ ساعة";
    if (totalHours == 2) return "منذ ساعتين";
    if (totalHours >= 3 && totalHours <= 10) {
      const arabicNumerals = ['٣', '٤', '٥', '٦', '٧', '٨', '٩', '١٠'];
      return "منذ ${arabicNumerals[totalHours - 3]} ساعات";
    }
    if (totalHours < 24) return "منذ $totalHours ساعة";

    if (days == 1) return "منذ يوم";
    if (days == 2) return "منذ يومين";
    if (days >= 3 && days <= 10) {
      const arabicNumerals = ['٣', '٤', '٥', '٦', '٧', '٨', '٩', '١٠'];
      return "منذ ${arabicNumerals[days - 3]} أيام";
    }
    if (months == 0) return "منذ $days يوم";

    if (months == 1) return "منذ شهر";
    if (months == 2) return "منذ شهرين";
    if (months >= 3 && months <= 10) {
      const arabicNumerals = ['٣', '٤', '٥', '٦', '٧', '٨', '٩', '١٠'];
      return "منذ ${arabicNumerals[months - 3]} شهور";
    }
    return "منذ $months شهر";
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Responsive base units
    final double horizontalPadding = screenWidth * 0.04; // 4% of screen width
    final double verticalSpacing = screenHeight * 0.01;
    final double borderRadius = screenWidth * 0.03;
    final double imageWidth = screenWidth * 0.3; // 30% of screen width
    final double imageHeight = screenHeight * 0.12;

    final double iconSize = screenWidth * 0.05;
    final double titleFontSize = screenWidth * 0.042;
    final double subtitleFontSize = screenWidth * 0.035;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        RouteNames.productDetails,
        arguments: widget.product.slug,
      ),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.02), // Responsive padding
        decoration: BoxDecoration(
          color: AppColors.secondaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.secondaryColor.withOpacity(0.8),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header: Navigation & Title
            SizedBox(height: verticalSpacing),

            // Product Info & Image
            LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Text Content (Right-aligned)
                    Expanded(
                      flex: 3,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth * 0.6,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.product!.name ?? "",
                              textAlign: TextAlign.right,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            SizedBox(height: verticalSpacing * 0.5),
                            Text(
                              widget.product!.mainPrice,
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.secondaryColor,
                                  ),
                            ),
                            SizedBox(height: verticalSpacing * 0.5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              textDirection: TextDirection.ltr,
                              children: [
                                Text(
                                  widget.product!.stateName ?? "",
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: subtitleFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                if ((widget.product!.cityName ?? "")
                                    .isNotEmpty)
                                  Text(
                                    ", ${widget.product!.cityName}",
                                    textAlign: TextAlign.right,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: subtitleFontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                              ],
                            ),
                            SizedBox(height: verticalSpacing * 0.5),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final availableWidth = constraints.maxWidth;

                                return Row(
                                  textDirection: TextDirection.ltr,
                                  // ✅ Critical for Arabic
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    // ✅ Time Ago (shorter, less important)
                                    SizedBox(
                                      width: availableWidth * 0.3,
                                      // Reserve 30% for time
                                      child: Text(
                                        _formatDateArabic(
                                            widget.product!.createdAt ??
                                                DateTime.now()),
                                        textAlign: TextAlign.right,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: subtitleFontSize * 0.95,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),

                                    Spacer(),
                                    // ✅ Username (takes remaining space)
                                    SizedBox(
                                      width: availableWidth * 0.6, // 60% max
                                      child: Text(
                                        widget.product!.userName ?? "",
                                        textAlign: TextAlign.right,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: subtitleFontSize,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),

                    // Spacer
                    SizedBox(width: screenWidth * 0.02),

                    // Image
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(borderRadius),
                        child: CachedNetworkImage(
                          imageUrl: widget.product!.thumbnailImage ?? "",
                          width: imageWidth,
                          height: imageHeight,
                          fit: BoxFit.contain,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(
                            strokeWidth: 1,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.secondaryColor,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.image_not_supported, size: 30),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
