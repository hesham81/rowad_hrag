import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/sub_categories_product_details/presentation/manager/sub_categories_product_cubit.dart';

import '../../../../core/route/route_names.dart';
import '../../../../core/widget/arrow_widget.dart';
import '../../../sub_categories/presentation/widget/sub_category_product.dart';
import '../widgets/sub_category_product_widget.dart';

class SubCategoriesProduct extends StatelessWidget {
  const SubCategoriesProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  ArrowWidget(),
                  Spacer(),
                  Text(
                    "المنتجات",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.greenColor,
                        ),
                  ),
                ],
              ).hPadding(0.03.width),
            ),
            BlocBuilder<SubCategoriesProductCubit, SubCategoriesProductState>(
              builder: (context, state) {
                if (state is SubCategoriesProductSuccess) {
                  // return ListView.separated(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context, index) => GestureDetector(
                  //     onTap: () => Navigator.pushNamed(
                  //       context,
                  //       RouteNames.productDetails,
                  //       arguments: state.subCategoriesProducts[index].slug,
                  //     ),
                  //     child: SubCategoryProductWidget(
                  //       subCategoriesProductsDataModel:
                  //           state.subCategoriesProducts[index],
                  //     ),
                  //   ),
                  //   separatorBuilder: (context, index) => 0.03.height.hSpace,
                  //   itemCount: state.subCategoriesProducts.length,
                  // );
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 7,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        RouteNames.productDetails,
                        arguments: state.subCategoriesProducts[index].slug,
                      ),
                      child: SubCategoryProductWidget(
                        subCategoriesProductsDataModel:
                            state.subCategoriesProducts[index],
                      ),
                    ),
                    itemCount: state.subCategoriesProducts.length,
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
