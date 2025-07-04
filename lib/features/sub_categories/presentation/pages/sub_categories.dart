import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
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
  late List<SubCategoriesDataModel> searchList;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchList = widget.data; // Initialize with all data
  }

  void search(String value) {
    if (value.isEmpty) {
      setState(() {
        searchList = widget.data; // Reset to original data
      });
      return;
    }

    final filteredList = widget.data
        .where((item) => item.name.toLowerCase().contains(value.toLowerCase()))
        .toList();

    setState(() {
      searchList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            CupertinoSearchTextField(
              controller: searchController,
              placeholder: "ابحث عن منتج",
              onChanged: search,
            ),
            0.02.height.hSpace,
            if (searchList.isEmpty && searchController.text.isNotEmpty)
              Image.asset(AppAssets.noSearchResult)
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: searchList.length,
                separatorBuilder: (_, __) => 0.02.height.hSpace,
                itemBuilder: (context, index) {
                  final item = searchList[index];
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteNames.subCategoriesProductDetails,
                      arguments: item.slug,
                    ),
                    child: SubCategoryProduct(
                      subCategoriesDataModel: item,
                    ),
                  );
                },
              ),
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}