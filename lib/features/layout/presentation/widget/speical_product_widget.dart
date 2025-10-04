import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';

import '../../../../core/route/route_names.dart';

class SpecialProductWidget extends StatefulWidget {
  final ProductsDataModel product;

  const SpecialProductWidget({
    super.key,
    required this.product,
  });

  @override
  State<SpecialProductWidget> createState() => _SpecialProductWidgetState();
}

class _SpecialProductWidgetState extends State<SpecialProductWidget> {
  String _formatDateArabic(DateTime past) {
    final now = DateTime.now();
    final diff = now.difference(past);

    final int totalMinutes = diff.inMinutes;
    final int totalHours = diff.inHours;
    final int days = totalHours ~/ 24;
    final int months = days ~/ 30;

    // Helper: Convert Latin numbers to Arabic if needed (optional)
    String toArabicNum(int num) {
      const Map<String, String> arabicDigits = {
        '0': '٠',
        '1': '١',
        '2': '٢',
        '3': '٣',
        '4': '٤',
        '5': '٥',
        '6': '٦',
        '7': '٧',
        '8': '٨',
        '9': '٩',
      };
      return num.toString()
          .split('')
          .map((digit) => arabicDigits[digit] ?? digit)
          .join('');
    }

    // Less than 1 minute
    if (totalMinutes < 1) {
      return "الآن";
    }

    // Less than 1 hour → show in minutes
    if (totalMinutes < 60) {
      if (totalMinutes == 1) {
        return "منذ دقيقة";
      } else if (totalMinutes == 2) {
        return "منذ دقيقتين";
      } else if (totalMinutes >= 3 && totalMinutes <= 10) {
        const arabicNumerals = ['٣', '٤', '٥', '٦', '٧', '٨', '٩', '١٠'];
        return "منذ ${arabicNumerals[totalMinutes - 3]} دقائق";
      } else {
        return "منذ $totalMinutes دقيقة";
      }
    }

    // Less than 24 hours → show in hours
    if (totalHours < 24) {
      if (totalHours == 1) {
        return "منذ ساعة";
      } else if (totalHours == 2) {
        return "منذ ساعتين";
      } else if (totalHours >= 3 && totalHours <= 10) {
        const arabicNumerals = ['٣', '٤', '٥', '٦', '٧', '٨', '٩', '١٠'];
        return "منذ ${arabicNumerals[totalHours - 3]} ساعات";
      } else {
        return "منذ $totalHours ساعة";
      }
    }

    // 1 day or more, less than a month
    if (days == 1) {
      return "منذ يوم";
    } else if (days == 2) {
      return "منذ يومين";
    } else if (days >= 3 && days <= 10) {
      const arabicNumerals = ['٣', '٤', '٥', '٦', '٧', '٨', '٩', '١٠'];
      return "منذ ${arabicNumerals[days - 3]} أيام";
    } else if (months == 0) {
      return "منذ $days يوم";
    }

    // Months
    if (months == 1) {
      return "منذ شهر";
    } else if (months == 2) {
      return "منذ شهرين";
    } else if (months >= 3 && months <= 10) {
      const arabicNumerals = ['٣', '٤', '٥', '٦', '٧', '٨', '٩', '١٠'];
      return "منذ ${arabicNumerals[months - 3]} شهور";
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
      // child: CustomContainer(
      //   padding: EdgeInsets.zero,
      //   width: containerWidth, // Responsive width
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     textDirection: TextDirection.rtl, // Ensure RTL
      //     children: [
      //       Expanded(
      //         flex: 7,
      //         child: ClipRRect(
      //           borderRadius: const BorderRadius.only(
      //             topLeft: Radius.circular(8),
      //             topRight: Radius.circular(8),
      //           ),
      //           child: CachedNetworkImage(
      //             imageUrl: widget.product.thumbnailImage,
      //             height: imageSize,
      //             width: isTablet ? 0.25.width : 0.3.width,
      //             fit: BoxFit.cover,
      //             placeholder: (context, url) => Container(
      //               color: Colors.grey[200],
      //               child: const Center(child: CircularProgressIndicator()),
      //             ),
      //             errorWidget: (context, url, error) => Container(
      //               color: Colors.grey[300],
      //               child: const Icon(Icons.image_not_supported,
      //                   color: Colors.grey),
      //             ),
      //           ),
      //         ),
      //       ),
      //       0.02.width.vSpace,
      //
      //       // Text Content (Right-aligned in RTL)
      //       Expanded(
      //         flex: 6,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           crossAxisAlignment: CrossAxisAlignment.end,
      //           children: [
      //             // Product Name
      //             Text(
      //               widget.product.name.length > 40
      //                   ? '${widget.product.name.substring(0, 40)}...'
      //                   : widget.product.name,
      //               textAlign: TextAlign.right,
      //               style: Theme.of(context).textTheme.titleMedium!.copyWith(
      //                     fontSize: _responsiveFontSize(),
      //                     color: Colors.black,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //               maxLines: 2,
      //               overflow: TextOverflow.ellipsis,
      //             ),
      //             0.01.height.hSpace,
      //
      //             // Price
      //             Text(
      //               widget.product.mainPrice??"",
      //               style: Theme.of(context).textTheme.titleMedium!.copyWith(
      //                     fontSize: _responsiveFontSize() + 1,
      //                     color: AppColors.greenColor,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //             ),
      //             0.01.height.hSpace,
      //
      //             // City & State
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               textDirection: TextDirection.rtl,
      //               children: [
      //                 Text(
      //                   widget.product.cityName ?? "",
      //                   style:
      //                       Theme.of(context).textTheme.titleMedium!.copyWith(
      //                             fontSize: _responsiveFontSize(),
      //                             color: AppColors.secondaryColor,
      //                             fontWeight: FontWeight.bold,
      //                           ),
      //                 ),
      //                 const Text("، ", style: TextStyle(fontSize: 16)),
      //                 Expanded(
      //                   child: Text(
      //                     widget.product.stateName ?? "",
      //                     style:
      //                         Theme.of(context).textTheme.titleMedium!.copyWith(
      //                               fontSize: _responsiveFontSize(),
      //                               color: AppColors.secondaryColor,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                     maxLines: 1,
      //                     overflow: TextOverflow.ellipsis,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             0.01.height.hSpace,
      //             Text(
      //               widget.product.userName??"",
      //               textAlign: TextAlign.right,
      //               style: Theme.of(context).textTheme.titleMedium!.copyWith(
      //                     fontSize: _responsiveFontSize(),
      //                     color: AppColors.secondaryColor,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //               maxLines: 1,
      //               overflow: TextOverflow.ellipsis,
      //             ),
      //             // Time Ago
      //
      //             0.01.height.hSpace,
      //             Text(
      //               _formatDateArabic(
      //                 widget.product.createdAt!,
      //               ),
      //               textAlign: TextAlign.right,
      //               style: Theme.of(context).textTheme.titleMedium!.copyWith(
      //                     fontSize: _responsiveFontSize() - 1,
      //                     color: AppColors.secondaryColor,
      //                     fontWeight: FontWeight.w500,
      //                   ),
      //             ),
      //             // Seller Name
      //           ],
      //         ),
      //       ),
      //
      //       // Image (Responsive Size)
      //     ],
      //   ).allPadding(padding),
      // ),
      child: Container(
        width: 0.45.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.3,
            color: AppColors.greenColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: widget.product.thumbnailImage,
                height: 0.15.height,
                width: double.maxFinite,
                fit: BoxFit.fill,
              ).center,
            ),
            0.01.height.hSpace,
            Text(
              widget.product.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            0.01.height.hSpace,
            Text(
              widget.product.mainPrice ?? "",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withAlpha(80),
                  ),
            ),
            Spacer(),
            CustomElevatedButton(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 0,
              ),
              onPressed: () {},
              btnColor: Colors.white,
              border: BorderSide(
                color: AppColors.greenColor,
              ),
              child: Text(
                "اطلب الان",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black.withAlpha(80),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ).center,
          ],
        ),
      ),
    );
  }
}
