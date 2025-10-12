import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';
import 'package:rowad_hrag/core/widget/icon_error.dart';
import 'package:rowad_hrag/features/settings/presentation/manager/shop_settings_cubit.dart';
import 'package:rowad_hrag/features/settings/presentation/pages/success_shop_settings.dart';

import '../../../profile/presentation/manager/profile_cubit.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShopSettingsCubit>();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "إعدادات المتجر ",
      //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
      //           fontWeight: FontWeight.bold,
      //           color: AppColors.primaryColor,
      //         ),
      //   ),
      //   leading: IconButton(
      //     onPressed: () => Navigator.pop(context),
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: AppColors.primaryColor,
      //     ),
      //   ),
      // ),
      body: BlocBuilder<ShopSettingsCubit, ShopSettingsState>(
        builder: (context, state) {
          if (state is ShopSettingsErrorState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconError(
                  error: state.errorMessage,
                ),
              ],
            );
          } else if (state is ShopSettingsLoadedState) {
            return SuccessShopSettings(
              data: state.settings,
              onDone: cubit.updateSettings,
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: AppColors.secondaryColor,
                ).center,
              ],
            );
          }
        },
      ),
    );
  }
}
