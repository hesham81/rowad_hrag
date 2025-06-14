import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/all_types/presentation/widgets/all_types_item_container.dart';

import '../../../../../core/theme/app_colors.dart';

class AllTypes extends StatelessWidget {
  const AllTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "جميع الفئات",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(

        child: Column(

          children: [
            0.01.height.hSpace,
            AllTypesItemContainer()
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
