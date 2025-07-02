import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/functions/files_pickers.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';

import '../../../../core/theme/app_colors.dart';

class AddNewContact extends StatefulWidget {
  const AddNewContact({super.key});

  @override
  State<AddNewContact> createState() => _AddNewContactState();
}

class _AddNewContactState extends State<AddNewContact> {
  File? file;

  final TextEditingController subjectController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
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
                controller: subjectController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return "من فضلك ادخل الموضوع";
                  }
                  return null;
                },
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
                controller: detailsController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return "من فضلك ادخل الوصف";
                  }
                  return null;
                },
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
                onPressed: () async {
                  file = await FilesPickers.pickFile();
                  setState(() {});
                },
              ),
              if (file != null)
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  child: Row(
                    children: [
                      // Show image preview if it's an image
                      if (['jpg', 'jpeg', 'png', 'gif']
                          .contains(file!.path.split('.').last.toLowerCase()))
                        Image.file(
                          file!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        )
                      else
                        Icon(
                          Icons.insert_drive_file,
                          size: 40,
                          color: AppColors.secondaryColor,
                        ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          file!.path.split('/').last,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ).hPadding(0.03.width),
        ),
      ),
    );
  }
}
