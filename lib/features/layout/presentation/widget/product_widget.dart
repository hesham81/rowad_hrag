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
    if (days == 0) {
      return "اليوم";
    }

    // حساب عدد الشهور التقريبي (بمتوسط 30 يوم للشهر)
    int months = (days / 30).floor();

    if (months == 0) {
      return "$days يوم";
    } else if (months == 1) {
      return "منذ شهر";
    } else if (months == 2) {
      return "منذ شهرين ";
    } else if (months >= 3 && months <= 10) {
      // استخدام الأعداد العربية مع "شهور"
      final arabicNumbers = ['٣', '٤', '٥', '٦', '٧', '٨', '٩', '١٠'];
      return "منذ${arabicNumbers[months - 3]} شهور";
    } else {
      // لأكثر من 10 شهور أو أقل من 3 شهور ولكن نريد تبسيط
      return "$months شهر";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        RouteNames.productDetails,
        arguments: widget.product.slug,
      ),
      child: CustomContainer(
        padding: EdgeInsets.zero,
        width: 0.7.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    (widget.product.name.length < 35)
                        ? widget.product.name
                        : "${widget.product.name.substring(0, 35)}...",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  0.01.height.hSpace,
                  Text(
                    widget.product.mainPrice,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  0.01.height.hSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${widget.product.cityName} ,",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      0.01.width.vSpace,
                      Text(
                        widget.product.stateName ?? " ",
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  0.01.height.hSpace,
                  Text(
                    _formatDateArabic(DateTime.now()
                        .difference(widget.product.createdAt!)
                        .inDays),
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  0.01.height.hSpace,
                  Expanded(
                    child: Text(
                      widget.product.userName,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            0.02.width.vSpace,
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.product.thumbnailImage,
                  height: 0.7.height,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ).allPadding(10),
      ),
    );
  }
}
