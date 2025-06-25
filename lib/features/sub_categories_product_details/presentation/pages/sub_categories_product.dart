import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/sub_categories_product_details/presentation/manager/sub_categories_product_cubit.dart';

import '../../../../core/route/route_names.dart';
import '../../../sub_categories/presentation/widget/sub_category_product.dart';
import '../widgets/sub_category_product_widget.dart';

class SubCategoriesProduct extends StatelessWidget {
  const SubCategoriesProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المنتجات',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            0.02.height.hSpace,
            BlocBuilder<SubCategoriesProductCubit, SubCategoriesProductState>(
              builder: (context, state) {
                if (state is SubCategoriesProductSuccess) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                    separatorBuilder: (context, index) => 0.03.height.hSpace,
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
