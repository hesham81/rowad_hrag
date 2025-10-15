import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/services/cash_helper.dart';
import 'package:rowad_hrag/core/widget/arrow_widget.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/features/profile/data/models/seller_profile_data_model.dart';

import '../../../../../core/theme/app_colors.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  File? image;

  _uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  SellerProfileDataModel? profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ArrowWidget(
                    isForward: false,
                  ),
                  Text(
                    profile?.name ?? "Hisham Aymen",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.greenColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SvgPicture.asset(
                    AppAssets.coloredLogo,
                    height: 47,
                  )
                ],
              ),
            ),
            0.02.height.hSpace,
            CustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "توثيق العضوية و إضافة التراخيص ِ",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.greenColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  0.02.height.hSpace,
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        "عند توثيق حسابك ستظهر علامةِ",
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.labelLarge!.copyWith(),
                      ),
                      0.01.width.vSpace,
                      Image.asset(
                        "assets/icons/d7f4e965357d344bdd5315140623af610efad73d.png",
                        height: 18,
                      ),
                      0.01.width.vSpace,
                      Text(
                        "بجانب اسم الحسابِ",
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.labelLarge!.copyWith(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            0.02.height.hSpace,
            CustomContainer(
              child: Column(
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Image.asset(
                        "assets/icons/Frame 1261153776.png",
                        height: 26,
                        width: 26,
                      ),
                      0.02.width.vSpace,
                      Text(
                        "توثيق بطاقة احوال او اقامة (للافراد) عن طريق ابشرر",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.black.withAlpha(150)),
                      ),
                    ],
                  ),
                  0.04.height.hSpace,
                  SizedBox(
                    width: 0.6.width,
                    child: CustomElevatedButton(
                      btnColor: Color.fromRGBO(0, 136, 136, 0.25),
                      border:
                          BorderSide(color: AppColors.greenColor, width: 1.8),
                      borderRadius: 20,
                      onPressed: _uploadImage,
                      child: Text(
                        "توثيق",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            0.03.height.hSpace,
            (image == null) ? SizedBox() : Image.file(image!),
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
