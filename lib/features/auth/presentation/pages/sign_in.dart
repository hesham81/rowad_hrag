// ignore_for_file: unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/features/auth/presentation/manager/auth_cubit.dart';
import '/core/validations/validations.dart';
import '/core/extensions/alignment.dart';
import '/core/widget/custom_elevated_button.dart';
import '/core/widget/custom_text_button.dart';
import '/core/widget/custom_text_form_field.dart';
import '/core/constant/app_assets.dart';
import '/core/extensions/align.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SvgPicture.asset(
                        AppAssets.coloredLogo,
                      ).center,
                      0.01.height.hSpace,
                      Text(
                        "مرحبا بك في رواد حراج",
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ).center,
                      0.01.height.hSpace,
                      Text(
                        "تسجيل الدخول",
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ).center,
                      0.01.height.hSpace,
                      CustomTextFormField(
                        hintText: "البريد الالكتروني",
                        controller: cubit.signInController,
                        validate: (value) {
                          return Validations.isEmailValid(value!);
                        },
                      ),
                      0.03.height.hSpace,
                      CustomTextFormField(
                        hintText: "كلمه المرور",
                        controller: cubit.signInPasswordController,
                        isPassword: true,
                        suffixIcon: Icons.remove_red_eye_outlined,
                        validate: (value) {
                          return Validations.isPasswordValid(value!);
                        },
                      ),
                      0.01.height.hSpace,
                      Row(
                        children: [
                          CustomTextButton(
                            text: " نسيت كلمه السر؟ ",
                            onPressed: () {},
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "تذكرني",
                                style: theme.textTheme.titleMedium!.copyWith(
                                  color: AppColors.blueColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
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
                          )
                        ],
                      ),
                      0.04.height.hSpace,
                    ],
                  ).hPadding(0.02.width),
                ),
              ),
              0.02.height.hSpace,
              CustomElevatedButton(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.1.width,
                  vertical: 0.02.height,
                ),
                borderRadius: 50,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var reseponse = await cubit.signIn();
                    if (reseponse) {
                      Navigator.pushNamed(
                        context,
                        RouteNames.home,
                      );
                    }
                  }
                },
                child: Text(
                  "تسجيل الدخول",
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              0.05.height.hSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(
                    text: "انشاء حساب",
                    btnColor: AppColors.secondaryColor,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.signUp,
                      );
                    },
                  ),
                  0.01.width.vSpace,
                  Text(
                    "ليس لديك حساب ؟ ",
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: AppColors.blueColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ).center,
                ],
              ).hPadding(0.03.width),
              0.03.height.hSpace,
              Text(
                "الدخول كزائر",
                style: theme.textTheme.titleMedium!.copyWith(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ).rightBottomWidget().hPadding(0.03.width)
            ],
          ),
        ),
      ),
    );
  }
}
