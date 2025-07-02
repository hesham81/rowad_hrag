import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/sub_categories/presentation/widget/sub_category_product.dart';
import '../../../layout/data/models/sub_categories_data_model.dart';

class SubCategoriesScreen extends StatefulWidget {
  final List<SubCategoriesDataModel> data;
  final String title;

  const SubCategoriesScreen({
    required this.data,
    required this.title,
    super.key,
  });

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.data.first.slug);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
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
            0.02.height.hSpace,
            CupertinoSearchTextField(),
            0.02.height.hSpace,
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteNames.subCategoriesProductDetails,
                    arguments: widget.data[index].slug,
                  ),
                  child: SubCategoryProduct(
                    subCategoriesDataModel: widget.data[index],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return 0.02.height.hSpace;
              },
              itemCount: widget.data.length,
            ),
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
