// ignore_for_file: unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
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
  bool isLoginSelected=true;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Lottie.asset(
                          AppAssets.profileLogo,
                          width: 0.4.width,
                          height: 0.16.height,
                        ).center,
                        0.02.height.hSpace,
                        
                       TabBar(
                          dividerColor: AppColors.thirdColor.withAlpha(40),
                          indicatorColor: AppColors.thirdColor,
                          indicatorSize: TabBarIndicatorSize.tab,
                          onTap: (value) {
                            value == 0?
                              Navigator.pushReplacementNamed(context, RouteNames.signUp)
                              :null;
                            
                          },
                          tabs: [
                            Text("حساب جديد",
                                style: theme.textTheme.titleMedium!.copyWith(
                                  color:Colors.black,
                                  fontWeight: FontWeight.w700,
                                )),
                            Text("تسجيل دخول",
                                style: theme.textTheme.titleMedium!.copyWith(
                                  color: AppColors.thirdColor,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                        0.04.height.hSpace,
                        Text(
                          "مرحبا بك",
                          style: theme.textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ).hPadding(10),
                        16.hSpace,
                        Text(
                          "البريد الالكتروني",
                          style: theme.textTheme.labelMedium!.copyWith(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontWeight: FontWeight.w400,
                            ),
                        ).hPadding(10),
                        12.hSpace,
                        CustomTextFormField(
                          hintText: "",
                          controller: cubit.signInController,
                          borderRadius: 10,
                          validate: (value) {
                            return Validations.isEmailValid(value!);
                          },
                        ),
                        30.hSpace,
                        Text(
                         "كلمة المرور",
                          style: theme.textTheme.labelMedium!.copyWith(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontWeight: FontWeight.w400,
                            ),
                        ).hPadding(10),
                        12.hSpace,
                        CustomTextFormField(
                          hintText: "",
                          controller: cubit.signInPasswordController,
                          isPassword: true,
                          borderRadius: 10,
                          suffixIcon: Icons.remove_red_eye_outlined,
                          validate: (value) {
                            return Validations.isPasswordValid(value!);
                          },
                        ),
                        0.01.height.hSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Text( "هل نسيت كلمة السر؟",
                              style: theme.textTheme.labelSmall!.copyWith(
                                color: AppColors.thirdColor,
                                fontWeight: FontWeight.bold
                              )
                              ),
              
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteNames.forgetPassword,
                                );
                              },
                            ),
                           
                          ],
                        ),
                        0.04.height.hSpace,
                      ],
                    )
                    // .hPadding(0.02.width)
                    ,
                  ),
                ),
                0.005.height.hSpace,
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.1.width,
                      vertical: 0.02.height,
                    ),
                    borderRadius: 10,
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
                      "الدخول",style: theme.textTheme.titleMedium!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                0.02.height.hSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextButton(
                      text: "سجل الان",
                      btnColor: AppColors.thirdColor,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.signUp,
                        );
                      },
                    ),
            
                    Text(
                      "ليس لديك حساب ؟ ",
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ).hPadding(0.03.width),
                
                
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}