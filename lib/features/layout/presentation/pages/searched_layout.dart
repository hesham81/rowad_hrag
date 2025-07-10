import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/product_widget.dart';
import '../../data/models/products_data_model.dart';

class SearchedLayout extends StatelessWidget {
  final List<ProductsDataModel> searchedProducts;

  const SearchedLayout({
    super.key,
    required this.searchedProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            (searchedProducts.isNotEmpty)
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ProductWidget(
                      product: searchedProducts[index],
                    ),
                    separatorBuilder: (context, index) => 0.01.height.hSpace,
                    itemCount: searchedProducts.length,
                  ).hPadding(0.03.width)
                : Image.asset(
                    AppAssets.noSearchResult,
                  ),
          ],
        ),
      ),
    );
  }
}
