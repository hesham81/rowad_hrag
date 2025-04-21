import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/core/widget/custom_elevated_button.dart';
import '/core/widget/custom_text_button.dart';
import '/core/constant/app_assets.dart';
import '/core/extensions/align.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';

import '/core/widget/custom_text_form_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController zoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(75),
                  bottomRight: Radius.circular(75),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SafeArea(
                    child: SvgPicture.asset(
                      AppAssets.coloredLogo,
                      height: 0.15.height,
                    ),
                  ),
                  0.02.height.hSpace,
                  Text(
                    "أنشئ حساب",
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ).center,
                  0.02.height.hSpace,
                  CustomTextFormField(
                    hintText: "الاسم بالكامل",
                    controller: nameController,
                  ),
                  0.01.height.hSpace,
                  CustomTextFormField(
                    hintText: "البريد الالكتروني",
                    controller: emailController,
                  ),
                  0.01.height.hSpace,
                  CustomTextFormField(
                    hintText: "المنطقة",
                    controller: zoneController,
                  ),
                  0.01.height.hSpace,
                  CustomTextFormField(
                    hintText: "المدينة",
                    controller: cityController,
                  ),
                  0.01.height.hSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: "value",
                            groupValue: "groupValue",
                            onChanged: (value) {},
                            fillColor: WidgetStatePropertyAll(
                              AppColors.secondaryColor,
                            ),
                          ),
                          Text(
                            "انثى",
                            style: theme.textTheme.labelMedium!.copyWith(
                              color: AppColors.blueColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      0.02.width.vSpace,
                      Row(
                        children: [
                          Radio(
                            value: "value",
                            groupValue: "groupValue",
                            onChanged: (value) {},
                            fillColor: WidgetStatePropertyAll(
                              AppColors.secondaryColor,
                            ),
                          ),
                          Text(
                            "ذكر",
                            style: theme.textTheme.labelMedium!.copyWith(
                              color: AppColors.blueColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).hPadding(0.03.width),
                  0.01.height.hSpace,
                  CustomTextFormField(
                    hintText: "كلمة المرور",
                    controller: passwordController,
                    isPassword: true,
                  ),
                  0.01.height.hSpace,
                  CustomTextFormField(
                    hintText: "تأكيد كلمة المرور",
                    controller: confirmPasswordController,
                    isPassword: true,
                  ),
                  0.01.height.hSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "هل انت من ذوي الاحتياجات الخاصة ؟",
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Radio(
                        value: "value",
                        groupValue: "groupValue",
                        onChanged: (value) {},
                        fillColor: WidgetStatePropertyAll(
                          AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "هل انت من الاسر المنتجة ؟",
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Radio(
                        value: "value",
                        groupValue: "groupValue",
                        onChanged: (value) {},
                        fillColor: WidgetStatePropertyAll(
                          AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTextButton(
                        text: "سياسة الاشتراك",
                        onPressed: () {},
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        btnColor: AppColors.secondaryColor,
                      ),
                      Text(
                        "بالتسجيل فانت توافق علي ",
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Radio(
                        value: "value",
                        groupValue: "groupValue",
                        onChanged: (value) {},
                        fillColor: WidgetStatePropertyAll(
                          AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  0.02.height.hSpace,
                  Column(
                    children: [
                      CustomElevatedButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.1.width,
                          vertical: 0.02.height,
                        ),
                        onPressed: () {},
                        borderRadius: 50,
                        child: Text(
                          "إنشاء حساب",
                          style: theme.textTheme.titleMedium!.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  0.02.height.hSpace,
                ],
              ).hPadding(0.03.width),
            ),
            0.02.height.hSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextButton(
                  text: "تسجيل دخول",
                  onPressed: () {},
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  btnColor: AppColors.secondaryColor,
                ),
                0.01.width.vSpace,
                Text(
                  "هل لديك حساب ؟",
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: AppColors.blueColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ).hPadding(0.05.width),
            0.1.height.hSpace,
          ],
        ),
      ),
    );
  }
}
