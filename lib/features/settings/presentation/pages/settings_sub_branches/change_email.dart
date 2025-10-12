import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';

import '../../../../../core/services/cash_helper.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widget/arrow_widget.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../core/widget/custom_text_form_field.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({super.key});

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  // String? name;

  // Future<void> _getCashedData() async {
  //   name = await CashHelper.getString("name");
  //   setState(() {});
  // }
  //
  // @override
  // void initState() {
  //   Future.wait(
  //     [
  //       _getCashedData(),
  //     ],
  //   );
  //   super.initState();
  // }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var controller = TextEditingController();

  // var confirmPasswordController = TextEditingController();

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
                    "تغير البريد الالكتروني ",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.greenColor,
                        ),
                  ),
                ],
              ),
              0.04.height.hSpace,
              Text(
                "البريد الالكتروني الجديد",
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
                validate: (value) => (value!.isNotEmpty)
                    ? null
                    : "هذا الحقل لايمكن ان يكون فارغ",
              ),
              0.04.height.hSpace,
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
