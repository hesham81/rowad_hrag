import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';

class CustomGridView extends StatelessWidget {
  final List<ProductsDataModel> products;
  final int crossAxisCount;

  const CustomGridView({
    super.key,
    required this.crossAxisCount,
    required this.products,
  });

  Widget _buildStaggeredTile(int index) {
    final product = products[index];

    // Use a seeded random number generator for consistent "randomness"
    final random = Random(index);
    final double widthChance = random.nextDouble();
    final double heightChance = random.nextDouble();

    int crossAxisCells;
    int mainAxisCells;

    // Decide tile size based on pseudo-random values
    if (crossAxisCount >= 2 && widthChance < 0.15) {
      // Wider tile: 2 columns
      crossAxisCells = 2;
      mainAxisCells = heightChance < 0.6 ? 1 : 2;
    } else if (crossAxisCount >= 2 && heightChance < 0.1) {
      // Tall full-width tile (spans all columns, 2 rows)
      crossAxisCells = crossAxisCount;
      mainAxisCells = 2;
    } else {
      // Default: 1x1 tile
      crossAxisCells = 1;
      mainAxisCells = 1;
    }

    // Safety: never exceed available columns
    crossAxisCells = crossAxisCells.clamp(1, crossAxisCount);

    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCells,
      mainAxisCellCount: mainAxisCells,
      child: ProductTile(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        for (int i = 0; i < products.length; i++) _buildStaggeredTile(i),
      ],
    );
  }
}

class ProductTile extends StatelessWidget {
  final ProductsDataModel product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        RouteNames.productDetails,
        arguments: product.slug,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: product.thumbnailImage ?? '',
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error_outline, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}