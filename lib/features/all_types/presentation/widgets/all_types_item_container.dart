import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_button.dart';
import 'package:rowad_hrag/features/all_types/data/models/all_types_data_model.dart';

import '../../../../core/theme/app_colors.dart';

class AllTypesItemContainer extends StatelessWidget {
  final AllTypesDataModel model;
  final String selectedCategory;

  const AllTypesItemContainer({
    super.key,
    required this.model,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: model.children.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 0.1.height,
          ),
          itemBuilder: (context, index) => CustomElevatedButton(
            child: Text(
              model.children[index].name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            onPressed: () => {
              Navigator.pushNamed(
                context,
                RouteNames.subCategoriesProductDetails,
                arguments: model.children[index].slug,
              )
            },
          ),
        ),
      ],
    ).allPadding(5);
  }
}
