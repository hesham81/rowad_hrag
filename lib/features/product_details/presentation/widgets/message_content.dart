import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';

import '../../../../core/theme/app_colors.dart';

class MessageContent extends StatelessWidget {
  final String hintText;

  const MessageContent({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 0.5.height,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "أي استفسار عن هذا الإعلان",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          0.01.height.hSpace,
          CustomTextFormField(
            hintText: hintText,
            borderColor: Colors.black,
            borderRadius: 0,
            borderWidth: 0,
            controller: TextEditingController(),
          ),
          0.03.height.hSpace,
          CustomTextFormField(
            hintText: "سؤالك",
            borderColor: Colors.black,
            borderRadius: 0,
            borderWidth: 0,
            minLine: 5,
            maxLine: 5,
            controller: TextEditingController(),
          ),
          Spacer(),
          Divider(),
          Row(
            children: [
              CustomElevatedButton(
                borderRadius: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: 0.07.width,
                  vertical: 0.01.height,
                ),
                onPressed: () {},
                child: Text(
                  "ارسال",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                ),
              ),
              0.01.width.vSpace,
              CustomElevatedButton(
                borderRadius: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: 0.07.width,
                  vertical: 0.01.height,
                ),
                btnColor: AppColors.primaryColor,
                border: BorderSide(
                  color: AppColors.secondaryColor
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "الغاء",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
