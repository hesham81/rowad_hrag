import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/icon_error.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/product_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../layout/data/models/products_data_model.dart';

class AllProductSearch extends StatelessWidget {
  final List<ProductsDataModel> products;

  const AllProductSearch({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "إعلانات جديدة",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: (products.isEmpty)
          ? IconError(error: "لايوجد منتجات").center
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ProductWidget(
                      product: products[index],
                    ),
                    separatorBuilder: (context, index) => 0.01.height.hSpace,
                    itemCount: products.length,
                  ),
                ],
              ),
            ),
    );
  }
}
