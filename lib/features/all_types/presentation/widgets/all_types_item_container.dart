import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_text_button.dart';

class AllTypesItemContainer extends StatelessWidget {
  const AllTypesItemContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.3.height,
      width: double.maxFinite,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1.3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "نظافه",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          0.01.height.hSpace,
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) => CustomTextButton(
              text: "text",
              btnColor: Colors.black,
              onPressed: () {},
            ),
          )
        ],
      ).allPadding(5),
    );
  }
}
