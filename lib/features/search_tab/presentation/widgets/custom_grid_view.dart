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

    switch (index % 5) {
      case 0:
        return StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: ProductTile(product: product),
        );
      case 1:
        return StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: ProductTile(product: product),
        );
      case 4:
        return StaggeredGridTile.count(
          crossAxisCellCount: crossAxisCount,
          mainAxisCellCount: 2,
          child: ProductTile(product: product),
        );
      default:
        return StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: ProductTile(product: product),
        );
    }
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
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
