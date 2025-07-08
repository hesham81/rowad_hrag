import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/product_widget.dart';

class SpecialNeedsWidgetHomeScreen extends StatelessWidget {
  final List<ProductsDataModel> peopleWithSpecialNeed;

  const SpecialNeedsWidgetHomeScreen({
    super.key,
    required this.peopleWithSpecialNeed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.3.height,
      child: ListView.separated(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ProductWidget(
          product: peopleWithSpecialNeed[index],
        ).hPadding(0.03.width),
        separatorBuilder: (context, index) => 0.01.width.vSpace,
        itemCount: peopleWithSpecialNeed.length,
      ),
    );
  }
}
