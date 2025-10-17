import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
  late List<ProductsDataModel> searchedProducts;
  bool isEmpty = false;
  String queryData = "";

  @override
  void initState() {
    super.initState();
    // Initialize with all products
    searchedProducts = List<ProductsDataModel>.from(widget.products);
  }

  void _search(String query) {
    setState(() {
      queryData = query;
      if (query.isEmpty) {
        searchedProducts = List<ProductsDataModel>.from(widget.products);
        isEmpty = false;
        return;
      }

      searchedProducts = widget.products
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      isEmpty = searchedProducts.isEmpty;
    });
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.greenColor,
                          ),
                    ),
                  ),
                ],
              ),
              0.02.height.hSpace,
              if (isEmpty)
                Lottie.asset(
                  "assets/icons/No-Data.json",
                ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 8,
                ),
                itemCount: searchedProducts.length,
                itemBuilder: (context, index) => ProductWidget(
                  displayFavourite: false,
                  product: searchedProducts[index],
                ),
              ),
            ],
          ),
        ).hPadding(0.03.width),
      ),
    );
  }
}
