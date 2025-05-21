import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';

import '../../../../core/theme/app_colors.dart';

class CardSubscriptionItem extends StatelessWidget {
  final bool isSelected ;

  const CardSubscriptionItem({
    super.key,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: isSelected ? AppColors.primaryColor : Colors.white,
      child: Row(
        children: [
          0.02.width.vSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "الباقه الفضيه",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              0.01.height.hSpace,
              Text(
                "٢٦ اعلان",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              0.01.height.hSpace,
              Text(
                "١٢ عمليه بيع وشراء",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ],
          ),
          Spacer(),
          Text(
            "٧٥٠ ريال",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          )
        ],
      ),
    );
  }
}
