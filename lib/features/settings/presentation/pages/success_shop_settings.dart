import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/functions/files_pickers.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/validations/validations.dart';
import 'package:rowad_hrag/core/widget/arrow_widget.dart';
import 'package:rowad_hrag/features/profile_drawer/presentation/widgets/custom_profile_tab_icon.dart';
import 'package:rowad_hrag/features/settings/data/models/settings_data_model.dart';
import 'package:rowad_hrag/features/settings/presentation/widgets/confirm_password_modal_sheet_widget.dart';

import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class SuccessShopSettings extends StatefulWidget {
  final List<SettingsDataModel> data;
  final Function() onDone;

  const SuccessShopSettings({
    super.key,
    required this.data,
    required this.onDone,
  });

  @override
  State<SuccessShopSettings> createState() => _SuccessShopSettingsState();
}

class _SuccessShopSettingsState extends State<SuccessShopSettings> {
  File? _pageBannerImage;

  File? _movingImage;
  File? _bannerFullWidth1;
  File? _bannerHalfWidth;

  File? _bannerFullWidth2;
  File? _shopLogo;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _facebookLinkController = TextEditingController();
  final TextEditingController _instagramLinkController =
      TextEditingController();
  final TextEditingController _twitterLinkController = TextEditingController();
  final TextEditingController _youtubeLinkController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _metaDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       0.02.height.hSpace,
    //       Container(
    //         width: double.maxFinite,
    //         padding: EdgeInsets.symmetric(horizontal: 0.015.height),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(15),
    //           border: Border.all(
    //             color: Colors.black.withAlpha(80),
    //           ),
    //         ),
    //         child: Column(
    //           children: [
    //             Text(
    //               "معلومات أساسية",
    //               style: Theme.of(context).textTheme.titleLarge!.copyWith(
    //                     color: Colors.black,
    //                   ),
    //             ).alignTopRight().hPadding(0.015.height),
    //             Divider(),
    //             0.01.height.hSpace,
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.stretch,
    //               children: [
    //                 Text(
    //                   "اسم المعلن الظاهر",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 CustomTextFormField(
    //                   hintText: "",
    //                   controller: _nameController,
    //                   onChange: (v) {
    //                     setState(() {});
    //                   },
    //                   borderRadius: 10,
    //                   borderColor: Colors.grey,
    //                 ),
    //                 0.01.height.hSpace,
    //                 Text(
    //                   "متجر الشعار  ",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 (_shopLogo != null)
    //                     ? ClipRRect(
    //                         borderRadius: BorderRadius.circular(10),
    //                         child: Image.file(_shopLogo!),
    //                       )
    //                     : SizedBox(),
    //                 0.01.height.hSpace,
    //                 CustomElevatedButton(
    //                   onPressed: () async {
    //                     _shopLogo = await FilesPickers.pickImage();
    //                     setState(() {});
    //                   },
    //                   btnColor: Colors.grey,
    //                   borderRadius: 10,
    //                   child: Text(
    //                     "تصفح",
    //                     style:
    //                         Theme.of(context).textTheme.titleMedium!.copyWith(
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white,
    //                             ),
    //                   ),
    //                 ),
    //                 0.01.height.hSpace,
    //                 Text(
    //                   "رقم الهاتف",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 CustomTextFormField(
    //                   onChange: (v) {
    //                     setState(() {});
    //                   },
    //                   hintText: widget.data
    //                       .where(
    //                         (element) => element.type == "contact_phone",
    //                       )
    //                       .first
    //                       .value,
    //                   controller: _phoneNumberController,
    //                   borderRadius: 10,
    //                   borderColor: Colors.grey,
    //                 ),
    //                 0.01.height.hSpace,
    //                 Text(
    //                   "العنوان ",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 CustomTextFormField(
    //                   onChange: (v) {
    //                     setState(() {});
    //                   },
    //                   hintText: widget.data
    //                           .where(
    //                             (element) => element.type == "contact_address",
    //                           )
    //                           .isEmpty
    //                       ? widget.data
    //                           .where(
    //                             (element) => element.type == "contact_address",
    //                           )
    //                           .first
    //                           .value
    //                       : " لايوجد",
    //                   controller: _addressController,
    //                   borderRadius: 10,
    //                   borderColor: Colors.grey,
    //                 ),
    //                 0.01.height.hSpace,
    //                 Text(
    //                   "ميتا الوصف",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 CustomTextFormField(
    //                   onChange: (v) {
    //                     setState(() {});
    //                   },
    //                   maxLine: 5,
    //                   minLine: 5,
    //                   hintText: widget.data
    //                       .where(
    //                         (element) => element.type == "meta_description",
    //                       )
    //                       .first
    //                       .value,
    //                   controller: _metaDescriptionController,
    //                   borderRadius: 10,
    //                   borderColor: Colors.grey,
    //                 ),
    //                 0.01.height.hSpace,
    //                 CustomElevatedButton(
    //                   onPressed: (_nameController.text.isNotEmpty ||
    //                           _metaDescriptionController.text.isNotEmpty ||
    //                           _addressController.text.isNotEmpty ||
    //                           _phoneNumberController.text.isNotEmpty ||
    //                           _shopLogo != null)
    //                       ? widget.onDone
    //                       : null,
    //                   btnColor: Color(0xff2e294e),
    //                   child: Text(
    //                     "حفظ",
    //                     style:
    //                         Theme.of(context).textTheme.titleMedium!.copyWith(
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white,
    //                             ),
    //                   ),
    //                 ),
    //                 0.03.height.hSpace,
    //               ],
    //             ).hPadding(0.01.width),
    //           ],
    //         ),
    //       ),
    //       0.02.height.hSpace,
    //       Container(
    //         width: double.maxFinite,
    //         padding: EdgeInsets.symmetric(horizontal: 0.015.height),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(15),
    //           border: Border.all(
    //             color: Colors.black.withAlpha(80),
    //           ),
    //         ),
    //         child: Column(
    //           children: [
    //             Text(
    //               "إعدادات البانر",
    //               style: Theme.of(context).textTheme.titleLarge!.copyWith(
    //                     color: Colors.black,
    //                   ),
    //             ).alignTopRight().hPadding(0.015.height),
    //             Divider(),
    //             0.01.height.hSpace,
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.stretch,
    //               children: [
    //                 0.01.height.hSpace,
    //                 Text(
    //                   "بنر صفحتك (1920x360)",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 (_pageBannerImage != null)
    //                     ? ClipRRect(
    //                         borderRadius: BorderRadius.circular(10),
    //                         child: Image.file(_pageBannerImage!),
    //                       )
    //                     : SizedBox(),
    //                 0.01.height.hSpace,
    //                 CustomElevatedButton(
    //                   onPressed: () async {
    //                     _pageBannerImage = await FilesPickers.pickImage();
    //                     setState(() {});
    //                   },
    //                   btnColor: Colors.grey,
    //                   borderRadius: 10,
    //                   child: Text(
    //                     "تصفح",
    //                     style:
    //                         Theme.of(context).textTheme.titleMedium!.copyWith(
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white,
    //                             ),
    //                   ),
    //                 ),
    //                 0.01.height.hSpace,
    //                 Text(
    //                   "صور متحركة (1500x450)",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 (_movingImage != null)
    //                     ? ClipRRect(
    //                         borderRadius: BorderRadius.circular(10),
    //                         child: Image.file(_movingImage!),
    //                       )
    //                     : SizedBox(),
    //                 0.01.height.hSpace,
    //                 CustomElevatedButton(
    //                   onPressed: () async {
    //                     _movingImage = await FilesPickers.pickImage();
    //                     setState(() {});
    //                   },
    //                   btnColor: Colors.grey,
    //                   borderRadius: 10,
    //                   child: Text(
    //                     "تصفح",
    //                     style:
    //                         Theme.of(context).textTheme.titleMedium!.copyWith(
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white,
    //                             ),
    //                   ),
    //                 ),
    //                 0.01.height.hSpace,
    //                 Text(
    //                   "Banner Full width 1",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 (_bannerFullWidth1 != null)
    //                     ? ClipRRect(
    //                         borderRadius: BorderRadius.circular(10),
    //                         child: Image.file(_bannerFullWidth1!),
    //                       )
    //                     : SizedBox(),
    //                 0.01.height.hSpace,
    //                 0.01.height.hSpace,
    //                 CustomElevatedButton(
    //                   onPressed: () async {
    //                     _bannerFullWidth1 = await FilesPickers.pickImage();
    //                     setState(() {});
    //                   },
    //                   btnColor: Colors.grey,
    //                   borderRadius: 10,
    //                   child: Text(
    //                     "تصفح",
    //                     style:
    //                         Theme.of(context).textTheme.titleMedium!.copyWith(
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white,
    //                             ),
    //                   ),
    //                 ),
    //                 0.01.height.hSpace,
    //                 Text(
    //                   "Banners half width (2 Equal Banners)",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 (_bannerHalfWidth != null)
    //                     ? ClipRRect(
    //                         borderRadius: BorderRadius.circular(10),
    //                         child: Image.file(_bannerHalfWidth!),
    //                       )
    //                     : SizedBox(),
    //                 0.01.height.hSpace,
    //                 0.01.height.hSpace,
    //                 CustomElevatedButton(
    //                   onPressed: () async {
    //                     _bannerHalfWidth = await FilesPickers.pickImage();
    //                     setState(() {});
    //                   },
    //                   btnColor: Colors.grey,
    //                   borderRadius: 10,
    //                   child: Text(
    //                     "تصفح",
    //                     style:
    //                         Theme.of(context).textTheme.titleMedium!.copyWith(
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white,
    //                             ),
    //                   ),
    //                 ),
    //                 0.01.height.hSpace,
    //                 Text(
    //                   "Banner Full width 2",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 (_bannerFullWidth2 != null)
    //                     ? ClipRRect(
    //                         borderRadius: BorderRadius.circular(10),
    //                         child: Image.file(_bannerFullWidth2!),
    //                       )
    //                     : SizedBox(),
    //                 0.01.height.hSpace,
    //                 0.01.height.hSpace,
    //                 CustomElevatedButton(
    //                   onPressed: () async {
    //                     _bannerFullWidth2 = await FilesPickers.pickImage();
    //                     setState(() {});
    //                   },
    //                   btnColor: Colors.grey,
    //                   borderRadius: 10,
    //                   child: Text(
    //                     "تصفح",
    //                     style:
    //                         Theme.of(context).textTheme.titleMedium!.copyWith(
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white,
    //                             ),
    //                   ),
    //                 ),
    //                 0.02.height.hSpace,
    //                 CustomElevatedButton(
    //                   onPressed: (_pageBannerImage != null ||
    //                           _movingImage != null ||
    //                           _bannerFullWidth1 != null ||
    //                           _bannerHalfWidth != null ||
    //                           _bannerFullWidth2 != null ||
    //                           _pageBannerImage != null)
    //                       ? () {}
    //                       : null,
    //                   btnColor: Color(0xff2e294e),
    //                   child: Text(
    //                     "حفظ",
    //                     style:
    //                         Theme.of(context).textTheme.titleMedium!.copyWith(
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white,
    //                             ),
    //                   ),
    //                 ),
    //                 0.03.height.hSpace,
    //               ],
    //             ).hPadding(0.01.width),
    //           ],
    //         ),
    //       ),
    //       0.02.height.hSpace,
    //       Container(
    //         width: double.maxFinite,
    //         padding: EdgeInsets.symmetric(horizontal: 0.015.height),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(15),
    //           border: Border.all(
    //             color: Colors.black.withAlpha(80),
    //           ),
    //         ),
    //         child: Column(
    //           children: [
    //             Text(
    //               "رابط التواصل الاجتماعي",
    //               style: Theme.of(context).textTheme.titleLarge!.copyWith(
    //                     color: Colors.black,
    //                   ),
    //             ).alignTopRight().hPadding(0.015.height),
    //             Divider(),
    //             0.01.height.hSpace,
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.stretch,
    //               children: [
    //                 Text(
    //                   "موقع التواصل الاجتماعي الفيسبوك",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 CustomTextFormField(
    //                   onChange: (p0) => setState(() {}),
    //                   hintText: widget.data
    //                       .where(
    //                         (element) => element.type == "facebook_link",
    //                       )
    //                       .first
    //                       .value,
    //                   controller: _facebookLinkController,
    //                   borderRadius: 10,
    //                   borderColor: Colors.grey,
    //                 ),
    //                 0.01.height.hSpace,
    //                 Text(
    //                   "Instagram",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 CustomTextFormField(
    //                   onChange: (p0) => setState(() {}),
    //                   hintText: widget.data
    //                       .where(
    //                         (element) => element.type == "instagram_link",
    //                       )
    //                       .first
    //                       .value,
    //                   controller: _instagramLinkController,
    //                   borderRadius: 10,
    //                   borderColor: Colors.grey,
    //                 ),
    //                 0.01.height.hSpace,
    //                 Text(
    //                   "تويتر ",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 CustomTextFormField(
    //                   onChange: (p0) => setState(() {}),
    //                   hintText: widget.data
    //                       .where(
    //                         (element) => element.type == "twitter_link",
    //                       )
    //                       .first
    //                       .value,
    //                   controller: _twitterLinkController,
    //                   borderRadius: 10,
    //                   borderColor: Colors.grey,
    //                 ),
    //                 0.01.height.hSpace,
    //                 // Text(
    //                 //   "جوجل ",
    //                 //   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                 //         color: Colors.black,
    //                 //       ),
    //                 // ).alignRight(),
    //                 // 0.01.height.hSpace,
    //                 // CustomTextFormField(
    //
    //                 //   hintText: data
    //                 //       .where(
    //                 //         (element) => element.type == "facebook_link",
    //                 //       )
    //                 //       .first
    //                 //       .value,
    //                 //   controller: TextEditingController(),
    //                 //   borderRadius: 10,
    //                 //   borderColor: Colors.grey,
    //                 // ),
    //                 0.01.height.hSpace,
    //                 Text(
    //                   "موقع YouTube",
    //                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                 ).alignRight(),
    //                 0.01.height.hSpace,
    //                 CustomTextFormField(
    //                   onChange: (p0) => setState(() {}),
    //                   validate: (value) => Validations.isLinkValid(value!),
    //                   hintText: widget.data
    //                       .where(
    //                         (element) => element.type == "youtube_link",
    //                       )
    //                       .first
    //                       .value,
    //                   controller: _youtubeLinkController,
    //                   borderRadius: 10,
    //                   borderColor: Colors.grey,
    //                 ),
    //                 0.01.height.hSpace,
    //                 CustomElevatedButton(
    //                   onPressed: (_twitterLinkController.text.isNotEmpty ||
    //                           _facebookLinkController.text.isNotEmpty ||
    //                           _instagramLinkController.text.isNotEmpty ||
    //                           _youtubeLinkController.text.isNotEmpty)
    //                       ? () {}
    //                       : null,
    //                   btnColor: Color(0xff2e294e),
    //                   child: Text(
    //                     "حفظ",
    //                     style:
    //                         Theme.of(context).textTheme.titleMedium!.copyWith(
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white,
    //                             ),
    //                   ),
    //                 ),
    //                 0.03.height.hSpace,
    //               ],
    //             ).hPadding(0.01.width),
    //           ],
    //         ),
    //       ),
    //       0.03.height.hSpace,
    //     ],
    //   ).hPadding(0.03.width),
    // );

    _modelSheet() {
      log("Called");
      showBottomSheet(
        context: context,
        builder: (context) {
          return ConfirmPasswordModalSheetWidget();
        },
      );
    }

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArrowWidget(
              isForward: false,
            ),
            0.05.height.hSpace,
            Container(
              width: 0.9.width,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.greenColor.withAlpha(30),
              ),
              child: Column(
                children: [
                  0.05.height.hSpace,
                  CustomProfileTabIcon(
                    text: "تغير اسم العضوية",
                    imagePath:
                        "assets/icons/2f83d3608ee132ff39b96eb08a795cb7eac7e6ea.png",
                    onTap: () {},
                  ),
                  0.05.height.hSpace,
                  CustomProfileTabIcon(
                    text: "تغير كلمة المرور",
                    imagePath:
                        "assets/icons/cad2e844758de939723988d0d6e4d4790a917961.png",
                    onTap: _modelSheet,
                  ),
                  0.05.height.hSpace,
                  CustomProfileTabIcon(
                    text: "نسيت كلمة المرور",
                    imagePath:
                        "assets/icons/cad2e844758de939723988d0d6e4d4790a917961.png",
                    onTap: () {},
                  ),
                  0.05.height.hSpace,
                  CustomProfileTabIcon(
                    text: "تغير البريد الالكتروني",
                    imagePath:
                        "assets/icons/c2737c1fe42bc6b549f9ea89161017d4a633ad56.png",
                    onTap: () {},
                  ),
                  0.05.height.hSpace,
                  CustomProfileTabIcon(
                    text: "تغير رقم الجوال",
                    imagePath:
                        "assets/icons/d221df25eda381cdc31c0422d0b5b3b461a358b9.png",
                    onTap: () {},
                  ),
                  0.05.height.hSpace,
                  CustomProfileTabIcon(
                    text: "حذف الحساب",
                    imagePath:
                        "assets/icons/503993e91348226d4ca35d8d1b30c4057b6a80c9.png",
                    onTap: () {},
                  ),
                  0.1.height.hSpace,
                ],
              ),
            ).center,
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
