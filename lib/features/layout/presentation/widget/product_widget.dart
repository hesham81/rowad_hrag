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
              flex: 2,
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
            Text(
              widget.product.userName ?? "",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withAlpha(80),
                  ),
            ),
            0.01.height.hSpace,
            Text(
              widget.product.cityName ?? "",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withAlpha(80),
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


              ],
            ),
            Text(
              _formatDateArabic(
                widget.product.createdAt ?? DateTime.now(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
