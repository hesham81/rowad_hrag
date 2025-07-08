import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/product_widget.dart';

import '../../data/models/products_data_model.dart';

class SpecialProductsHomeScreen extends StatelessWidget {
  final List<ProductsDataModel> specialProducts;

  const SpecialProductsHomeScreen({
    super.key,
    required this.specialProducts,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.3.height,
      child: ListView.separated(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ProductWidget(
          product: specialProducts[index],
        ).hPadding(0.03.width),
        separatorBuilder: (context, index) => 0.01.width.vSpace,
        itemCount: specialProducts.length,
      ),
    );
  }
}
