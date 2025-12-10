import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/layout/data/models/category_data_model.dart';

class AllCategoryWidget extends StatelessWidget {
  final CategoryDataModel category;

  const AllCategoryWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              category.icon,
              height: 50,
              width: 50,
            ),
            Text(
              category.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.greenColor,
            ),
          ],
        ),
      ),
    );
  }
}
