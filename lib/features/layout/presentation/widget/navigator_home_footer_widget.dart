import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';

class NavigatorHomeFooterWidget extends StatelessWidget {
  const NavigatorHomeFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Color(0xff000000),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            AppAssets.coloredLogo,
            height: 50,
          ).alignRight(),
          0.01.height.hSpace,
          Column(
            children: [
              Text(
                "وسائل الدفع المتاحة",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              0.02.height.hSpace,
              Text(
                "أدخل المبلغ",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              0.02.height.hSpace,
              SizedBox(
                width: 0.55.width,
                child: CustomTextFormField(
                  hintText: "أدخل المبلغ",
                  controller: TextEditingController(),
                  isFilled: true,
                  borderColor: Colors.white,
                  borderRadius: 0,
                  fillColor: AppColors.primaryColor,
                ),
              ),
              0.02.height.hSpace,
              SizedBox(
                width: 0.3.width,
                child: CustomElevatedButton(
                  child: Text(
                    "ادفع الأن",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ).allPadding(10),
    );
  }
}
