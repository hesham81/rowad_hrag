import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/product_widget.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';

class SpecialAdsWidget extends StatelessWidget {
  final String title;
  final List<ProductsDataModel> products;

  const SpecialAdsWidget({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    var product = products.last;
    return Container(
      height: 0.35.height,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(70),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: product.thumbnailImage,
            height: 0.2.height,
            width: double.maxFinite,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
