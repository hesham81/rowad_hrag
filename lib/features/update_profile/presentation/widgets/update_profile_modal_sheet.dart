import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/profile_drawer/presentation/widgets/custom_profile_tab_icon.dart';
import 'package:rowad_hrag/features/update_profile/presentation/pages/update_profile_modal_sheet_branches/update_profile_modal_sheet_branch.dart';
import 'package:rowad_hrag/features/update_profile/presentation/pages/update_profile_modal_sheet_branches/verification.dart';

class UpdateProfileModalSheet extends StatelessWidget {
  const UpdateProfileModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greenColor.withAlpha(160),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              "assets/icons/x-circle.svg",
            ).alignRight(),
          ).allPadding(14),
          0.06.height.hSpace,
          CustomProfileTabIcon(
            isWithArrow: false,
            isWhiteColor: true,
            text: "اعضاء يتابعونك",
            imagePath:
                "assets/icons/22030f70d7de1db6db5c8105773f6a2d951b9429.png",
            onTap: () {},
          ),
          0.03.height.hSpace,
          CustomProfileTabIcon(
            isWithArrow: false,
            isWhiteColor: true,
            text: "تعديل المتجر",
            imagePath:
                "assets/icons/7a72fc85e98efd18dc8c54535b64a5685a390b67.png",
            onTap: () => slideLeftWidget(
              newPage: UpdateProfileModalSheetBranch(),
              context: context,
            ),
          ),
          0.03.height.hSpace,
          CustomProfileTabIcon(
            isWithArrow: false,
            isWhiteColor: true,
            text: "طلب تقييم",
            imagePath:
                "assets/icons/a8c0f80d3c319dff44dc1111041e514f7d406e38.png",
            onTap: () {},
          ),
          0.03.height.hSpace,
          CustomProfileTabIcon(
            isWithArrow: false,
            isWhiteColor: true,
            text: "دفع الرسوم",
            imagePath:
                "assets/icons/c68ea8e7f4fd23e8223e779ba4b00d74d3eb27a8.png",
            onTap: () {},
          ),
          0.03.height.hSpace,
          CustomProfileTabIcon(
            isWithArrow: false,
            isWhiteColor: true,
            text: "طلب توثيق الحساب",
            imagePath:
                "assets/icons/d7f4e965357d344bdd5315140623af610efad73d.png",
            onTap: () => slideLeftWidget(
              newPage: Verification(),
              context: context,
            ),
          ),
        ],
      ).hPadding(0.03.width),
    );
  }
}
