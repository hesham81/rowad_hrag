import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/all_types/presentation/manager/all_categories_cubit.dart';
import 'package:rowad_hrag/features/all_types/presentation/widgets/all_types_item_container.dart';
import '../../../../../core/theme/app_colors.dart';

class AllTypes extends StatelessWidget {
  const AllTypes({super.key});

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
            return SingleChildScrollView(
              child: Column(
                children: [
                  0.01.height.hSpace,
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => AllTypesItemContainer(
                      model: state.allCategories[index],
                    ),
                    separatorBuilder: (context, index) => 0.01.height.hSpace,
                    itemCount: state.allCategories.length,
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
