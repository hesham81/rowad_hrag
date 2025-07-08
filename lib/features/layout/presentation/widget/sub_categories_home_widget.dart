import 'package:flutter/cupertino.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/layout/data/models/category_data_model.dart';

import '../../../sub_categories/presentation/pages/sub_categories.dart';
import 'categories.dart';

class SubCategoriesHomeWidget extends StatelessWidget {
  final List<CategoryDataModel> categories;
  final Function(String , int) callBack;

  const SubCategoriesHomeWidget({
    super.key,
    required this.categories,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.17.height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          // onTap: () async {
          //   slideLeftWidget(
          //     newPage: SubCategoriesScreen(
          //       data: cubit.subCategories,
          //       title: handler.categories[index].name,
          //     ),
          //     context: context,
          //   );
          // },
          onTap: () {
            callBack(categories[index].name, categories[index].id);
          },
          child: Categories(
            imageUrl: categories[index].icon,
            text: categories[index].name,
          ),
        ),
        separatorBuilder: (context, index) => 0.05.width.vSpace,
        itemCount: categories.length,
      ),
    );
  }
}
