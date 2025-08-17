import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/features/all_types/data/models/all_types_data_model.dart';
import 'package:rowad_hrag/features/all_types/presentation/manager/all_categories_cubit.dart';
import 'package:rowad_hrag/features/all_types/presentation/widgets/all_types_item_container.dart';
import '../../../../../core/theme/app_colors.dart';

class AllTypes extends StatefulWidget {
  const AllTypes({super.key});

  @override
  State<AllTypes> createState() => _AllTypesState();
}

class _AllTypesState extends State<AllTypes> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "جميع الفئات",
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
      body: BlocBuilder<AllCategoriesCubit, AllCategoriesState>(
        builder: (context, state) {
          if (state is AllCategoriesLoaded) {
            List<String> categories = state.allCategories
                .map(
                  (e) => e.name,
                )
                .toList();
            AllTypesDataModel items = state.allCategories
                .where(
                  (element) =>
                      element.name == categories[selectedCategoryIndex],
                )
                .first;

            return SingleChildScrollView(
              child: Column(
                children: [
                  0.01.height.hSpace,
                  SizedBox(
                    height: 0.06.height,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CustomElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedCategoryIndex = index;
                            items = state.allCategories
                                .where(
                                  (element) =>
                                      element.name == categories[index],
                                )
                                .first;
                          });
                          // context.read<AllCategoriesCubit>().getAllCategories(
                          //       categories[index],
                          //     );
                        },
                        border: BorderSide(
                            color: AppColors.secondaryColor, width: 1.3),
                        btnColor: (index != selectedCategoryIndex)
                            ? AppColors.secondaryColor
                            : Colors.white,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          categories[index],
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: (index != selectedCategoryIndex)
                                        ? Colors.white
                                        : AppColors.secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      separatorBuilder: (context, index) => 0.01.width.vSpace,
                      itemCount: categories.length,
                    ),
                  ),
                  0.01.height.hSpace,
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => AllTypesItemContainer(
                      model: items,
                      selectedCategory: categories[selectedCategoryIndex],
                    ),
                    separatorBuilder: (context, index) => 0.01.height.hSpace,
                    itemCount: 1,
                  ),
                ],
              ).hPadding(0.03.width),
            );
          } else if (state is AllCategoriesError) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 180,
                ),
                Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ).center,
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.secondaryColor,
              color: AppColors.darkTeal,
            ),
          );
        },
      ),
    );
  }
}
