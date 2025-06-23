import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/widget/custom_text_button.dart';
import 'package:rowad_hrag/features/all_types/data/models/all_types_data_model.dart';
import 'package:rowad_hrag/features/product_details/presentation/pages/product_item_screen.dart';

class AllTypesItemContainer extends StatelessWidget {
  final AllTypesDataModel model;

  const AllTypesItemContainer({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1.3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            model.name,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          0.01.height.hSpace,
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: model.children.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (context, index) => CustomTextButton(
              text: model.children[index].name,
              onPressed: () => {
                Navigator.pushNamed(
                  context,
                  RouteNames.productDetails,
                  arguments: model.children[index].slug,
                )
              },
            ),
          ),
        ],
      ).allPadding(5),
    );
  }
}
