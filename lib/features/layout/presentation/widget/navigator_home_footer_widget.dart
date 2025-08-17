import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/services/url_launcher_func.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';
import 'package:rowad_hrag/features/payment_footer/presentation/manager/plans_cubit.dart';

import '../../../../core/services/cash_helper.dart';

class NavigatorHomeFooterWidget extends StatefulWidget {
  const NavigatorHomeFooterWidget({super.key});

  @override
  State<NavigatorHomeFooterWidget> createState() =>
      _NavigatorHomeFooterWidgetState();
}

class _NavigatorHomeFooterWidgetState extends State<NavigatorHomeFooterWidget> {
  var amountController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  String? token;

  Future<void> _getCurrentToken() async {
    token = await CashHelper.getString("token");
    // log("Current Token is $token");
    setState(() {});
  }

  @override
  void initState() {
    Future.wait(
      [
        _getCurrentToken(),
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PlansCubit>();

    return Form(
      key: formKey,
      child: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Color(0xFF121212), // Dark background
        ),
        child: SingleChildScrollView(
          // ✅ Added: Allows scrolling
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo at the top
              SvgPicture.asset(
                AppAssets.coloredLogo,
                height: 50,
              ).alignRight(),
              0.01.height.hSpace,

              // Payment options section
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
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
                        controller: amountController,
                        isFilled: true,
                        borderColor: Colors.white,
                        keyboardType: TextInputType.number,
                        borderRadius: 0,
                        fillColor: AppColors.primaryColor,
                        validate: (value) =>
                            (value!.isEmpty) ? "ادخل المبلغ" : null,
                      ),
                    ),
                    0.02.height.hSpace,
                    SizedBox(
                      width: 0.3.width,
                      child: CustomElevatedButton(
                        onPressed: (token == null)
                            ? () => pushNamed(
                                newPage: RouteNames.signIn, context: context)
                            : () {
                                if (formKey.currentState!.validate()) {
                                  cubit.payCustomAmount(
                                    double.parse(amountController.text),
                                  );
                                }
                              },
                        child: Text(
                          "ادفع الأن",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                "assets/images/aiIuFRJGAGgwX6ZDb6sDdzaJMNXnLKAKgAx3ddEP.jpg",
              ),
              0.03.height.hSpace,

              // Bank details section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor, // Green background
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    // Bank details row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Bank Al-Rajhi
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "بنك الراجحي",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "رقم الحساب: 01400028419910",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "IBAN: SA2810000001400028419910",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Al Ahli Bank
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "البنك الأهلي",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "رقم الحساب: 336000010006086342540",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "IBAN: SA4580000336608016342540",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Footer text
                    Text(
                      "الموقع يأخذ عمولة 1% من أي عملية بيع تقوم بها، يرجى التأكد من تحويل النسبة للموقع، وهذه المسؤولية تقع بينك وبين ضميرك.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),

              0.03.height.hSpace,

              // Saudi Business Center section
              GestureDetector(
                onTap: () => UrlLauncherFunc.openUrl(
                  "https://eauthenticate.saudibusiness.gov.sa/inquiry?certificateRefID=0000151540",
                ),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        "موثق من المركز السعودي للأعمال",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.secondaryColor,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Image.asset(
                        "assets/images/المركز-السعودي-للأعمال.png",
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "الجهة الرسمية الحكومية لتوثيق الأعمال. رقم التوثيق (0000151540) ويمكنك زيارة صفحة التوثيق الرسمية من هنا",
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondaryColor,
                                ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20), // Final padding
            ],
          ),
        ),
      ),
    );
  }
}
