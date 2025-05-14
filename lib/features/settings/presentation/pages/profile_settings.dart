import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "إعدادات المتجر ",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            0.02.height.hSpace,
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 0.015.height),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black.withAlpha(80),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "معلومات أساسية",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                        ),
                  ).alignTopRight().hPadding(0.015.height),
                  Divider(),
                  0.01.height.hSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "اسم المعلن الظاهر",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomTextFormField(
                        hintText: "Hisham Aymen ",
                        controller: TextEditingController(),
                        borderRadius: 10,
                        borderColor: Colors.grey,
                      ),
                      0.01.height.hSpace,
                      Text(
                        "متجر الشعار  ",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomElevatedButton(
                        onPressed: () {},
                        btnColor: Colors.grey,
                        borderRadius: 10,
                        child: Text(
                          "تصفح",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      0.01.height.hSpace,
                      Text(
                        "رقم الهاتف",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomTextFormField(
                        hintText: "",
                        controller: TextEditingController(),
                        borderRadius: 10,
                        borderColor: Colors.grey,
                      ),
                      0.01.height.hSpace,
                      Text(
                        "العنوان ",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomTextFormField(
                        hintText: "",
                        controller: TextEditingController(),
                        borderRadius: 10,
                        borderColor: Colors.grey,
                      ),
                      0.01.height.hSpace,
                      Text(
                        "عنوان الصفحة الخاصة ",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomTextFormField(
                        hintText: "",
                        controller: TextEditingController(),
                        borderRadius: 10,
                        borderColor: Colors.grey,
                      ),
                      0.01.height.hSpace,
                      Text(
                        "ميتا الوصف",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomTextFormField(
                        maxLine: 5,
                        minLine: 5,
                        hintText: "",
                        controller: TextEditingController(),
                        borderRadius: 10,
                        borderColor: Colors.grey,
                      ),
                      0.01.height.hSpace,
                      CustomElevatedButton(
                        onPressed: () {},
                        btnColor: Color(0xff2e294e),
                        child: Text(
                          "حفظ",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      0.03.height.hSpace,
                    ],
                  ).hPadding(0.01.width),
                ],
              ),
            ),
            0.02.height.hSpace,
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 0.015.height),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black.withAlpha(80),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "إعدادات البانر",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                        ),
                  ).alignTopRight().hPadding(0.015.height),
                  Divider(),
                  0.01.height.hSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      0.01.height.hSpace,
                      Text(
                        "بنر صفحتك (1920x360)",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomElevatedButton(
                        onPressed: () {},
                        btnColor: Colors.grey,
                        borderRadius: 10,
                        child: Text(
                          "تصفح",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      0.01.height.hSpace,
                      Text(
                        "صور متحركة (1500x450)",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomElevatedButton(
                        onPressed: () {},
                        btnColor: Colors.grey,
                        borderRadius: 10,
                        child: Text(
                          "تصفح",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      0.01.height.hSpace,
                      Text(
                        "Banner Full width 1",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomElevatedButton(
                        onPressed: () {},
                        btnColor: Colors.grey,
                        borderRadius: 10,
                        child: Text(
                          "تصفح",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      0.01.height.hSpace,
                      Text(
                        "Banners half width (2 Equal Banners)",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomElevatedButton(
                        onPressed: () {},
                        btnColor: Colors.grey,
                        borderRadius: 10,
                        child: Text(
                          "تصفح",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      0.01.height.hSpace,
                      Text(
                        "Banner Full width 2",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomElevatedButton(
                        onPressed: () {},
                        btnColor: Colors.grey,
                        borderRadius: 10,
                        child: Text(
                          "تصفح",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      0.02.height.hSpace,
                      CustomElevatedButton(
                        onPressed: () {},
                        btnColor: Color(0xff2e294e),
                        child: Text(
                          "حفظ",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      0.03.height.hSpace,
                    ],
                  ).hPadding(0.01.width),
                ],
              ),
            ),
            0.02.height.hSpace,
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 0.015.height),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black.withAlpha(80),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "رابط التواصل الاجتماعي",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                        ),
                  ).alignTopRight().hPadding(0.015.height),
                  Divider(),
                  0.01.height.hSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "موقع التواصل الاجتماعي الفيسبوك",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomTextFormField(
                        hintText: "",
                        controller: TextEditingController(),
                        borderRadius: 10,
                        borderColor: Colors.grey,
                      ),
                      0.01.height.hSpace,
                      Text(
                        "Instagram",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomTextFormField(
                        hintText: "",
                        controller: TextEditingController(),
                        borderRadius: 10,
                        borderColor: Colors.grey,
                      ),
                      0.01.height.hSpace,
                      Text(
                        "تويتر ",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomTextFormField(
                        hintText: "",
                        controller: TextEditingController(),
                        borderRadius: 10,
                        borderColor: Colors.grey,
                      ),
                      0.01.height.hSpace,
                      Text(
                        "جوجل ",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomTextFormField(
                        hintText: "",
                        controller: TextEditingController(),
                        borderRadius: 10,
                        borderColor: Colors.grey,
                      ),
                      0.01.height.hSpace,
                      Text(
                        "موقع YouTube",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ).alignRight(),
                      0.01.height.hSpace,
                      CustomTextFormField(
                        hintText: "",
                        controller: TextEditingController(),
                        borderRadius: 10,
                        borderColor: Colors.grey,
                      ),
                      0.01.height.hSpace,
                      CustomElevatedButton(
                        onPressed: () {},
                        btnColor: Color(0xff2e294e),
                        child: Text(
                          "حفظ",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      0.03.height.hSpace,
                    ],
                  ).hPadding(0.01.width),
                ],
              ),
            ),
            0.03.height.hSpace,
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
