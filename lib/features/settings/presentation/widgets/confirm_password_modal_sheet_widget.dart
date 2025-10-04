import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';

import '../../../../core/theme/app_colors.dart';

class ConfirmPasswordModalSheetWidget extends StatelessWidget {
  const ConfirmPasswordModalSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 0.35,
    //   width: double.maxFinite,
    //   decoration: BoxDecoration(
    //       color: AppColors.greenColor ,
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(25),
    //         topRight: Radius.circular(25),
    //       ),
    //   ),
    //   child: Text("data"),
    // );
    return Container(
      height: 0.47.height,
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              "assets/icons/x-circle.svg",
            ).alignRight(),
          ),
          0.03.height.hSpace,
          Column(
            children: [
              Text(
                "تاكيد كلمة المرور",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              0.01.height.hSpace,
              Text(
                "من فضلك ادخل كلمة المرور حتي\n تستمر الي الخطوة التالية",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
          0.04.height.hSpace,
          CustomTextFormField(
            hintText: "كلمة المرور",
            isPassword: true,
            borderColor: AppColors.primaryColor,
            borderRadius: 15,
            isSuffixIconWhite: true,
            hintColor: AppColors.primaryColor,
            controller: TextEditingController(),
          ),
          0.05.height.hSpace,
          CustomElevatedButton(
            padding: EdgeInsets.all(6),
            btnColor: AppColors.primaryColor,
            onPressed: () {},
            child: Text(
              "استمرار",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: AppColors.secondaryColor,
                  ),
            ),
          ),
        ],
      ).allPadding(20),
    );
  }
}
