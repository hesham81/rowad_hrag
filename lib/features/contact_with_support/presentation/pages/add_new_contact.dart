import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';

import '../../../../core/theme/app_colors.dart';

class AddNewContact extends StatelessWidget {
  const AddNewContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "اضافه تذكره جديده",
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
      bottomNavigationBar: CustomContainer(
        child: Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                child: Text(
                  "ارسال التذكره",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                ),
                onPressed: () {},
              ),
            ),
            0.01.width.vSpace,
            Expanded(
              child: CustomElevatedButton(
                btnColor: Colors.red,
                child: Text(
                  "الغاء",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            0.01.height.hSpace,
            Text(
              "موضوع",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ).alignRight(),
            0.01.height.hSpace,
            CustomTextFormField(
              hintText: "الموضوع",
              borderRadius: 10,
              controller: TextEditingController(),
            ),
            0.01.height.hSpace,
            Text(
              "قدم وصفاً مفصلاً",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ).alignRight(),
            0.01.height.hSpace,
            CustomTextFormField(
              hintText: "قدم وصفاً مفصلاً",
              borderRadius: 10,
              controller: TextEditingController(),
            ),
            0.01.height.hSpace,
            Text(
              "صورة فوتوغرافية",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ).alignRight(),
            0.01.height.hSpace,
            CustomElevatedButton(
              child: Text(
                "اختر ملف",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
              ),
              onPressed: () {},
            )
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
