import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/all_product_search/presentation/widgets/all_products_widget.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';

class AllProductSearch extends StatefulWidget {
  final List<ProductsDataModel> products;

  const AllProductSearch({
    super.key,
    required this.products,
  });

  @override
  State<AllProductSearch> createState() => _AllProductSearchState();
}

class _AllProductSearchState extends State<AllProductSearch> {
  late List<ProductsDataModel> filteredProducts;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
    searchController.addListener(() {
      setState(() {
        final String query = searchController.text.toLowerCase();
        filteredProducts = widget.products
            .where((product) =>
            product.name.toLowerCase().contains(query))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void search(String query) {
    setState(() {
      filteredProducts = widget.products
          .where((product) =>
          product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الاعلانات الجديده",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.04.width),
        child: Column(
          children: [
            0.02.height.hSpace,
            CupertinoSearchTextField(
              controller: searchController,
              placeholder: "ابحث عن منتج",
              onChanged: search,
              itemColor: const Color.fromARGB(255, 158, 157, 157),
              style: TextStyle(fontSize: 16),
            ),
            0.02.height.hSpace,
            if (searchController.text.isNotEmpty && filteredProducts.isEmpty)
              Center(
                child: Text(
                  "لا يوجد منتجات مطابقة للبحث",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            else
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => AllProductsWidget(
                    product: filteredProducts[index],
                  ),
                  separatorBuilder: (context, index) => 0.01.height.hSpace,
                  itemCount: filteredProducts.length,
                ),
              ),
          ],
        ),
      ),
    );
  }
}