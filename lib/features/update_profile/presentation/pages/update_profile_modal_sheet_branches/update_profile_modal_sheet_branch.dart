import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/services/bot_toast.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';

import '../../../../../core/theme/app_colors.dart';

class UpdateProfileModalSheetBranch extends StatefulWidget {
  const UpdateProfileModalSheetBranch({super.key});

  @override
  State<UpdateProfileModalSheetBranch> createState() =>
      _UpdateProfileModalSheetBranchState();
}

class _UpdateProfileModalSheetBranchState
    extends State<UpdateProfileModalSheetBranch> {
  File? _profileImage ;
  _uploadImage()async{
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
    BotToastServices.showSuccessMessage("تم رفع الصوره بنجاح");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 0.57.height,
            child: Stack(
              children: [
                InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 0.3.height,
                      imageUrl:
                          "https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/480665651_2001369400373220_7048298799208039212_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=ySr3hElViDoQ7kNvwGicKe8&_nc_oc=Adn5qF01bGEI-39ABmMvFQdCQ88HXKtFH1KDJjP-dnFZOkhtfSvL1NPHSVFTbTqhSfw&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=ZFqGXwhLDtWrSD3MVpqYyw&oh=00_AfdZtnAQd7bfcu6AUEtNZ_DQYBGnl68tdYlZsOI4J_IdgA&oe=68F4D0D3",
                    ),
                  ),
                ),
                SafeArea(
                  child: Positioned.directional(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.secondaryColor,
                                width: 1.8,
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.secondaryColor,
                            ).center.hPadding(5),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ).hPadding(0.04.width),
                Positioned.fill(
                  bottom: 0.18.height,
                  child: CircleAvatar(
                    radius: 90,
                    child: InkWell(
                      onTap: _uploadImage,
                      child: Lottie.asset(
                        "assets/icons/Camera.json",
                        repeat: false,
                      ),
                    ),
                  ).alignBottom(),
                ),
                Positioned.fill(
                  top: 0.27.height,
                  child: Text(
                    "Hisham Aymen",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.greenColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ).center,
                ),
              ],
            ),
          ),
          Text(
            "وصف ملفك الشخصي",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ).hPadding(0.03.width).alignRight(),
          0.02.height.hSpace,
          CustomTextFormField(
            hintText: "",
            borderRadius: 20,
            controller: TextEditingController(),
            maxLine: 7,
            minLine: 7,
          ).hPadding(0.03.width),
          0.05.height.hSpace,
          CustomElevatedButton(
            child: Text(
              "حفظ",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            onPressed: () {},
          ).allPadding(10),
        ],
      ),
    );
  }
}
