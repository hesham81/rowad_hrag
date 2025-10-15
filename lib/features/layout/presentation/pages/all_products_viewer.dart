import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/arrow_widget.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/product_widget.dart';

class AllProductsViewer extends StatefulWidget {
  final String title;
  final bool isSpecial;

  final List<ProductsDataModel> products;

  const AllProductsViewer({
    super.key,
    required this.title,
    required this.products,
    this.isSpecial = false,
  });

  @override
  State<AllProductsViewer> createState() => _AllProductsViewerState();
}

class _AllProductsViewerState extends State<AllProductsViewer> {
  List<ProductsDataModel> searchedProducts = [];
  bool isEmpty = false;

  _search(String query) {
    searchedProducts.clear();
    if (query.isEmpty) {
      setState(() {
        searchedProducts = widget.products;
      });
      return;
    }
    for (var element in widget.products) {
      if (element.name.toLowerCase().contains(query.toLowerCase())) {
        searchedProducts.add(element);
      }
    }
    isEmpty = searchedProducts.isEmpty;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              0.02.height.hSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ArrowWidget(),
                  0.02.width.vSpace,
                  Expanded(
                    child: CupertinoSearchTextField(
                      onChanged: _search,
                      cursorColor: AppColors.greenColor,
                    ),
                  ),
                ],
              ),
              0.02.height.hSpace,
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) => ProductWidget(
                  product: widget.products[index],
                ),
                itemCount: widget.products.length,
              )
            ],
          ),
        ).hPadding(0.03.width),
      ),
    );
  }
}
