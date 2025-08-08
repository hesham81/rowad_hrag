import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';
import 'package:rowad_hrag/features/product_details/data/models/message_request_data_model.dart';

import '../../../../core/theme/app_colors.dart';

class MessageContent extends StatefulWidget {
  final String hintText;

  final int userId;

  final Function(MessageRequestDataModel) onSend;

  const MessageContent({
    super.key,
    required this.hintText,
    required this.onSend,
    required this.userId,
  });

  @override
  State<MessageContent> createState() => _MessageContentState();
}

class _MessageContentState extends State<MessageContent> {
  var formKey = GlobalKey<FormState>();
  var messageController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 0.5.height,
      width: double.maxFinite,
      child: Form(
        key: formKey,
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
              hintText: widget.hintText,
              borderColor: Colors.black,
              borderRadius: 0,
              borderWidth: 0,
              controller: nameController,
            ),
            0.03.height.hSpace,
            CustomTextFormField(
              hintText: "سؤالك",
              borderColor: Colors.black,
              borderRadius: 0,
              borderWidth: 0,
              minLine: 5,
              maxLine: 5,
              controller: messageController,
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.onSend(
                        MessageRequestDataModel(
                          message: messageController.text,
                          conversationId: widget.userId,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
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
                  border: BorderSide(color: AppColors.secondaryColor),
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
      ),
    );
  }
}
