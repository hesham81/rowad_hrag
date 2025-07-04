import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Make sure this is imported

import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';
import 'package:rowad_hrag/features/contact_with_support/data/models/add_new_ticket_data_model.dart';

import '../../../../core/theme/app_colors.dart';

class AddNewContact extends StatefulWidget {
  final Function(AddNewTicketDataModel) onSend;

  const AddNewContact({
    super.key,
    required this.onSend,
  });

  @override
  State<AddNewContact> createState() => _AddNewContactState();
}

class _AddNewContactState extends State<AddNewContact> {
  List<File>? files; // Changed from File? to List<File>?

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
            "اضافة تذكرة جديدة",
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
                    "إرسال التذكرة",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var ticket = AddNewTicketDataModel(
                        subject: subjectController.text,
                        details: detailsController.text,
                        attachments: files,
                      );
                      widget.onSend(ticket);
                    }
                  },
                ),
              ),
              0.01.width.vSpace,
              Expanded(
                child: CustomElevatedButton(
                  btnColor: Colors.red,
                  child: Text(
                    "إلغاء",
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
                "الموضوع",
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
                    return "من فضلك أدخل الموضوع";
                  }
                  return null;
                },
              ),
              0.01.height.hSpace,
              Text(
                "وصف مفصل",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ).alignRight(),
              0.01.height.hSpace,
              CustomTextFormField(
                hintText: "قدم وصفًا مفصلًا",
                borderRadius: 10,
                controller: detailsController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return "من فضلك أدخل الوصف";
                  }
                  return null;
                },
              ),
              0.01.height.hSpace,
              Text(
                "مرفق ملفات",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ).alignRight(),
              0.01.height.hSpace,
              CustomElevatedButton(
                child: Text(
                  "اختر ملفات",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                    allowMultiple: true,
                  );

                  if (result != null) {
                    setState(() {
                      files = result.paths.map((path) => File(path!)).toList();
                    });
                  }
                },
              ),

              // Show selected files
              if (files != null && files!.isNotEmpty)
                ...files!.map((file) {
                  String fileName = file.path.split('/').last;
                  String fileExtension =
                  fileName.split('.').last.toLowerCase();

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.secondaryColor),
                    ),
                    child: Row(
                      children: [
                        // Show image preview if it's an image file
                        if (['jpg', 'jpeg', 'png', 'gif']
                            .contains(fileExtension))
                          Image.file(
                            file,
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
                            fileName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
            ],
          ).hPadding(0.03.width),
        ),
      ),
    );
  }
}