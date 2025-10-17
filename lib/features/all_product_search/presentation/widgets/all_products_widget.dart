import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/core/widget/icon_text.dart';

import '../../../../core/route/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../layout/data/models/products_data_model.dart';

class AllProductsWidget extends StatefulWidget {
  final ProductsDataModel product;
  final bool isOdd;

  const AllProductsWidget({
    super.key,
    required this.isOdd,
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
    return Container(
      padding: EdgeInsets.all(10),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: (widget.isOdd)
              ? AppColors.secondaryColor.withAlpha(120)
              : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.greenColor,
          )),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: 0.15.height,
              width: 0.35.width,
              fit: BoxFit.fill,
              imageUrl: widget.product.thumbnailImage ?? "",
            ),
          ),
          0.03.width.vSpace,
          Expanded(
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.product.name ?? "",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                0.1.height.hSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      (widget.product.userName!.length > 20)
                          ? widget.product.userName!.substring(0, 20)
                          : widget.product.userName ?? "غير معروف",
                      overflow: TextOverflow.ellipsis,
                      style:
                          Theme.of(context).textTheme.labelMedium!.copyWith(),
                    ),
                    Spacer(),
                    IconText(
                      rate: widget.product.cityName ?? "غير معروف",
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ).hPadding(0.03.width);
  }
}
