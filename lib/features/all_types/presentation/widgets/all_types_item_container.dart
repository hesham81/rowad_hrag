import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_text_button.dart';

class AllTypesItemContainer extends StatelessWidget {
  const AllTypesItemContainer({super.key});

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
            "نظافه",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          0.01.height.hSpace,
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (context, index) => CustomTextButton(
              text: 'fsdfsd',
              onPressed: () {},
            ),
          ),
        ],
      ).allPadding(5),
    );
  }
}
