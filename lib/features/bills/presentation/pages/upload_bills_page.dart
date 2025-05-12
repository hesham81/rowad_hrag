import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';

class UploadBillsPage extends StatefulWidget {
  const UploadBillsPage({super.key});

  @override
  State<UploadBillsPage> createState() => _UploadBillsPageState();
}

class _UploadBillsPageState extends State<UploadBillsPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController nameOfTransferController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addNumberController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "رفع ايصالات التحويل ",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            0.01.height.hSpace,
            CustomTextFormField(
              hintText: "اسم المستخدم",
              controller: nameController,
            ),
            0.01.height.hSpace,
            CustomTextFormField(
              hintText: "قيمه المبلغ",
              controller: salaryController,
            ),
            0.01.height.hSpace,
            CustomTextFormField(
              hintText: "البنك الذي تم التحويل إليه",
              controller: bankController,
            ),
            0.01.height.hSpace,
            CustomTextFormField(
              hintText: "اسم المحول",
              controller: nameOfTransferController,
            ),
            0.01.height.hSpace,
            CustomTextFormField(
              hintText: "رقم الجوال المرتبط بعضويتك",
              controller: phoneNumberController,
            ),
            0.01.height.hSpace,
            CustomTextFormField(
              hintText: "رقم الإعلان",
              controller: addNumberController,
            ),
            0.01.height.hSpace,
            CustomTextFormField(
              hintText: "الملاحظات",
              controller: noteController,
            ),
            0.01.height.hSpace,
            CustomElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.primaryColor,
                  ),
                  0.03.width.vSpace,
                  Text(
                    "نسخة من إيصال التحويل",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                  ),
                ],
              ),
              onPressed: () {},
            )
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
