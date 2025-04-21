import 'package:flutter/material.dart';
import '/core/extensions/alignment.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';
import '/core/widget/custom_text_form_field.dart';

class RateUs extends StatelessWidget {
  const RateUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(70),
        border: Border.all(
          color: AppColors.secondaryColor,
        ),
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "تقييمك يهمنا ",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.bold,
                ),
          ).rightBottomWidget(),
          0.01.height.hSpace,
          Text(
            "عدد النجوم",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
          ).rightBottomWidget(),
          0.01.height.hSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (int i = 0; i < 5; i++)
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
            ],
          ),
          0.01.height.hSpace,
          Text(
            "اضف تعليق ",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ).rightBottomWidget(),
          0.01.height.hSpace,
          CustomTextFormField(
            hintText: "",
            controller: TextEditingController(),
            minLine: 2,
            maxLine: 2,
            isFilled: true,
            fillColor: Colors.white,
            borderRadius: 15,
          ),
        ],
      ).rightBottomWidget().allPadding(15),
    );
  }
}
