import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';

import '../../../../core/theme/app_colors.dart';

class AddsTextFormField extends StatelessWidget {
  final TextEditingController controller;

  final String text;

  final String? Function(String?)? validate;

  const AddsTextFormField({
    super.key,
    required this.controller,
    required this.text,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          0.01.height.hSpace,
          CustomTextFormField(
            hintText: "",
            controller: controller,
            validate: validate,
            borderRadius: 10,
            borderColor: Colors.black.withAlpha(80),
          )
        ],
      ),
    );
  }
}
