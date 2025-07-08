import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/product_widget.dart';

import '../../data/models/products_data_model.dart';

class ProductiveFamiliesProductsWidgetHomeScreen extends StatelessWidget {
  final List<ProductsDataModel> productiveFamiliesProducts;

  const ProductiveFamiliesProductsWidgetHomeScreen({
    super.key,
    required this.productiveFamiliesProducts,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.3.height,
      child: ListView.separated(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ProductWidget(
          product: productiveFamiliesProducts[index],
        ).hPadding(0.03.width),
        separatorBuilder: (context, index) => 0.01.width.vSpace,
        itemCount: productiveFamiliesProducts.length,
      ),
    );
  }
}
