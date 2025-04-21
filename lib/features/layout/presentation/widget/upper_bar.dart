import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/core/constant/app_assets.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';
import '/core/widget/custom_text_form_field.dart';

class UpperBar extends StatelessWidget {
  const UpperBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        0.02.width.vSpace,
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: AppColors.blueColor,
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset(
            AppAssets.notificationIcon,
          ).allPadding(12),
        ),
        0.04.width.vSpace,
        SvgPicture.asset(
          AppAssets.coloredLogo,
          height: 40,
          width: 40,
          fit: BoxFit.cover,
        ),
        0.04.width.vSpace,
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset(
            AppAssets.searchIcon,
          ).allPadding(12),
        ),
        0.02.width.vSpace,
        Expanded(
          child: CustomTextFormField(
            hintText: "أبحث عن ",
            controller: TextEditingController(),
          ),
        ),
        
      ],
    ).hPadding(0.02.width).vPadding(0.01.height);
  }
}
