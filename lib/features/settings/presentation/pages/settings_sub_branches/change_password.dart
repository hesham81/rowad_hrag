import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/services/cash_helper.dart';
import 'package:rowad_hrag/core/validations/phone_validation.dart';
import 'package:rowad_hrag/core/validations/validations.dart';
import 'package:rowad_hrag/core/widget/arrow_widget.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';

import '../../../../../core/theme/app_colors.dart';

class ChangePassword extends StatefulWidget {
  final bool isPassword;
  final bool isPhoneNumber;

  const ChangePassword({
    super.key,
    this.isPassword = false,
    this.isPhoneNumber = false,
  });

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String? name;

  Future<void> _getCashedData() async {
    name = await CashHelper.getString("name");
    setState(() {});
  }

  @override
  void initState() {
    Future.wait(
      [
        _getCashedData(),
      ],
    );
    super.initState();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var controller = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  ArrowWidget(
                    isForward: false,
                  ),
                  Spacer(),
                  Text(
                    "اسم عضويتك الحالي $name",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.greenColor,
                        ),
                  ),
                ],
              ),
              0.04.height.hSpace,
              Text(
                (widget.isPassword)
                    ? "كلمة المرور الجديدة"
                    : (widget.isPhoneNumber)
                        ? "رقم الجوال الجديد"
                        : "اسم عضويتك الجديد",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.darkTeal,
                    ),
              ).alignRight(),
              0.02.height.hSpace,
              CustomTextFormField(
                hintText: "",
                controller: controller,
                borderColor: AppColors.greenColor,
                borderRadius: 10,
                isPassword: widget.isPassword,
                validate: (value) => (widget.isPassword)
                    ? Validations.isPasswordValid(value!)
                    : (widget.isPhoneNumber)
                        ? PhoneValidation.check(phoneNumber: value ?? "")
                        : (value!.isNotEmpty)
                            ? null
                            : "هذا الحقل لايمكن ان يكون فارغ",
              ),
              (widget.isPassword)
                  ? Column(
                      children: [
                        0.02.height.hSpace,
                        Text(
                          "تأكيد كلمة المرور ",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.darkTeal,
                                  ),
                        ).alignRight(),
                        0.02.height.hSpace,
                        CustomTextFormField(
                          hintText: "",
                          controller: confirmPasswordController,
                          borderColor: AppColors.greenColor,
                          borderRadius: 10,
                          isPassword: widget.isPassword,
                          validate: (value) => Validations.rePasswordValid(
                            controller.text,
                            value!,
                          ),
                        ),
                        0.04.height.hSpace,
                      ],
                    )
                  : 0.04.height.hSpace,
              CustomElevatedButton(
                child: Text(
                  "تغير",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                onPressed: () {
                  if (!formKey.currentState!.validate()) return;
                },
              )
            ],
          ).hPadding(0.03.width),
        ),
      ),
    );
  }
}
