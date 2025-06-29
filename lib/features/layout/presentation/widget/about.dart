import 'package:flutter/material.dart';
import 'package:rowad_hrag/features/layout/data/models/visitor_status_data_model.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';

class About extends StatelessWidget {
  final VisitorStatesDataModel? model;

  const About({
    super.key,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.secondaryColor,
        ),
      ),
      child: Column(
        children: [
          Text(
            (model?.visitorSectionText == null)
                ? """تتميز منصة رواد حراج بالبيع 
والشراء وهي منصة موثقة من المركز السعودي للأعمال 
التابع لوزارة التجارة"""
                : model!.visitorSectionText.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          0.03.height.hSpace,
          Text(
            (model?.visitorsToday == null)
                ? "1500"
                : model!.visitorsToday.toString(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 44,
                ),
          ),
          Text(
            "زائر اليوم",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          0.02.height.hSpace,
          Text(
          (model!.itemsSold == null) ? "30000" : model!.itemsSold.toString(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 44,
                ),
          ),
          Text(
            "مشتركين اليوم",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          0.02.height.hSpace,
        ],
      ),
    );
  }
}
