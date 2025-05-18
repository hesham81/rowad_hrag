import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductsDataModel product;

  const ProductWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: product.thumbnailImage,
          height: 0.2.height,
        ),
      ],
    );
  }
}
