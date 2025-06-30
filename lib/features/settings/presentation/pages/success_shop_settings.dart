import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/functions/files_pickers.dart';
import 'package:rowad_hrag/features/settings/data/models/settings_data_model.dart';

import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class SuccessShopSettings extends StatefulWidget {
  final List<SettingsDataModel> data;

  const SuccessShopSettings({
    super.key,
    required this.data,
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          0.02.height.hSpace,
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 0.015.height),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black.withAlpha(80),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "معلومات أساسية",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                      ),
                ).alignTopRight().hPadding(0.015.height),
                Divider(),
                0.01.height.hSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "اسم المعلن الظاهر",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    CustomTextFormField(
                      hintText: "Hisham Aymen ",
                      controller: TextEditingController(),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                    ),
                    0.01.height.hSpace,
                    Text(
                      "متجر الشعار  ",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    (_shopLogo != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(_shopLogo!),
                          )
                        : SizedBox(),
                    0.01.height.hSpace,
                    CustomElevatedButton(
                      onPressed: () async {
                        _shopLogo = await FilesPickers.pickImage();
                        setState(() {});
                      },
                      btnColor: Colors.grey,
                      borderRadius: 10,
                      child: Text(
                        "تصفح",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    0.01.height.hSpace,
                    Text(
                      "رقم الهاتف",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    CustomTextFormField(
                      hintText: widget.data
                          .where(
                            (element) => element.type == "contact_phone",
                          )
                          .first
                          .value,
                      controller: TextEditingController(),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                    ),
                    0.01.height.hSpace,
                    Text(
                      "العنوان ",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    CustomTextFormField(
                      hintText: widget.data
                              .where(
                                (element) => element.type == "contact_address",
                              )
                              .isEmpty
                          ? widget.data
                              .where(
                                (element) => element.type == "contact_address",
                              )
                              .first
                              .value
                          : " لايوجد",
                      controller: TextEditingController(),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                    ),
                    0.01.height.hSpace,
                    Text(
                      "ميتا الوصف",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    CustomTextFormField(
                      maxLine: 5,
                      minLine: 5,
                      hintText: widget.data
                          .where(
                            (element) => element.type == "meta_description",
                          )
                          .first
                          .value,
                      controller: TextEditingController(),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                    ),
                    0.01.height.hSpace,
                    CustomElevatedButton(
                      onPressed: () {},
                      btnColor: Color(0xff2e294e),
                      child: Text(
                        "حفظ",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    0.03.height.hSpace,
                  ],
                ).hPadding(0.01.width),
              ],
            ),
          ),
          0.02.height.hSpace,
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 0.015.height),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black.withAlpha(80),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "إعدادات البانر",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                      ),
                ).alignTopRight().hPadding(0.015.height),
                Divider(),
                0.01.height.hSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    0.01.height.hSpace,
                    Text(
                      "بنر صفحتك (1920x360)",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    (_pageBannerImage != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(_pageBannerImage!),
                          )
                        : SizedBox(),
                    0.01.height.hSpace,
                    CustomElevatedButton(
                      onPressed: () async {
                        _pageBannerImage = await FilesPickers.pickImage();
                        setState(() {});
                      },
                      btnColor: Colors.grey,
                      borderRadius: 10,
                      child: Text(
                        "تصفح",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    0.01.height.hSpace,
                    Text(
                      "صور متحركة (1500x450)",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    (_movingImage != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(_movingImage!),
                          )
                        : SizedBox(),
                    0.01.height.hSpace,
                    CustomElevatedButton(
                      onPressed: () async {
                        _movingImage = await FilesPickers.pickImage();
                        setState(() {});
                      },
                      btnColor: Colors.grey,
                      borderRadius: 10,
                      child: Text(
                        "تصفح",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    0.01.height.hSpace,
                    Text(
                      "Banner Full width 1",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    (_bannerFullWidth1 != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(_bannerFullWidth1!),
                          )
                        : SizedBox(),
                    0.01.height.hSpace,
                    0.01.height.hSpace,
                    CustomElevatedButton(
                      onPressed: () async {
                        _bannerFullWidth1 = await FilesPickers.pickImage();
                        setState(() {});
                      },
                      btnColor: Colors.grey,
                      borderRadius: 10,
                      child: Text(
                        "تصفح",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    0.01.height.hSpace,
                    Text(
                      "Banners half width (2 Equal Banners)",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    (_bannerHalfWidth != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(_bannerHalfWidth!),
                          )
                        : SizedBox(),
                    0.01.height.hSpace,
                    0.01.height.hSpace,
                    CustomElevatedButton(
                      onPressed: () async {
                        _bannerHalfWidth = await FilesPickers.pickImage();
                        setState(() {});
                      },
                      btnColor: Colors.grey,
                      borderRadius: 10,
                      child: Text(
                        "تصفح",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    0.01.height.hSpace,
                    Text(
                      "Banner Full width 2",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    (_bannerFullWidth2 != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(_bannerFullWidth2!),
                          )
                        : SizedBox(),
                    0.01.height.hSpace,
                    0.01.height.hSpace,
                    CustomElevatedButton(
                      onPressed: () async {
                        _bannerFullWidth2 = await FilesPickers.pickImage();
                        setState(() {});
                      },
                      btnColor: Colors.grey,
                      borderRadius: 10,
                      child: Text(
                        "تصفح",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    0.02.height.hSpace,
                    CustomElevatedButton(
                      onPressed: (_pageBannerImage != null ||
                              _movingImage != null ||
                              _bannerFullWidth1 != null ||
                              _bannerHalfWidth != null ||
                              _bannerFullWidth2 != null ||
                              _pageBannerImage != null)
                          ? () {}
                          : null,
                      btnColor: Color(0xff2e294e),
                      child: Text(
                        "حفظ",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    0.03.height.hSpace,
                  ],
                ).hPadding(0.01.width),
              ],
            ),
          ),
          0.02.height.hSpace,
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 0.015.height),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black.withAlpha(80),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "رابط التواصل الاجتماعي",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                      ),
                ).alignTopRight().hPadding(0.015.height),
                Divider(),
                0.01.height.hSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "موقع التواصل الاجتماعي الفيسبوك",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    CustomTextFormField(
                      hintText: widget.data
                          .where(
                            (element) => element.type == "facebook_link",
                          )
                          .first
                          .value,
                      controller: TextEditingController(),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                    ),
                    0.01.height.hSpace,
                    Text(
                      "Instagram",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    CustomTextFormField(
                      hintText: widget.data
                          .where(
                            (element) => element.type == "instagram_link",
                          )
                          .first
                          .value,
                      controller: TextEditingController(),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                    ),
                    0.01.height.hSpace,
                    Text(
                      "تويتر ",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    CustomTextFormField(
                      hintText: widget.data
                          .where(
                            (element) => element.type == "twitter_link",
                          )
                          .first
                          .value,
                      controller: TextEditingController(),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                    ),
                    0.01.height.hSpace,
                    // Text(
                    //   "جوجل ",
                    //   style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    //         color: Colors.black,
                    //       ),
                    // ).alignRight(),
                    // 0.01.height.hSpace,
                    // CustomTextFormField(
                    //   hintText: data
                    //       .where(
                    //         (element) => element.type == "facebook_link",
                    //       )
                    //       .first
                    //       .value,
                    //   controller: TextEditingController(),
                    //   borderRadius: 10,
                    //   borderColor: Colors.grey,
                    // ),
                    0.01.height.hSpace,
                    Text(
                      "موقع YouTube",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ).alignRight(),
                    0.01.height.hSpace,
                    CustomTextFormField(
                      hintText: widget.data
                          .where(
                            (element) => element.type == "youtube_link",
                          )
                          .first
                          .value,
                      controller: TextEditingController(),
                      borderRadius: 10,
                      borderColor: Colors.grey,
                    ),
                    0.01.height.hSpace,
                    CustomElevatedButton(
                      onPressed: () {},
                      btnColor: Color(0xff2e294e),
                      child: Text(
                        "حفظ",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    0.03.height.hSpace,
                  ],
                ).hPadding(0.01.width),
              ],
            ),
          ),
          0.03.height.hSpace,
        ],
      ).hPadding(0.03.width),
    );
  }
}
