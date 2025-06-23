import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/whatsapp_icon_button.dart';
import 'package:rowad_hrag/features/credit_cards/presentation/pages/credit_cards_screen.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/adds_screen.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/profile_drawer.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/profile_states/success_profile_states.dart';
import 'package:rowad_hrag/features/profile/presentation/widgets/points_item_cart.dart';
import 'package:rowad_hrag/features/profile/presentation/widgets/profile_item_cart.dart';
import 'package:rowad_hrag/features/settings/presentation/pages/profile_settings.dart';

import '../manager/profile_cubit.dart';

class Profile extends StatelessWidget {
  final bool isHome;

  const Profile({
    super.key,
    this.isHome = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: WhatsappIconButton(),
      appBar: AppBar(
        title: Text(
          "الملف الشخصي",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () => slideLeftWidget(
              newPage: ProfileSettings(),
              context: context,
            ),
            icon: Icon(
              Icons.settings,
              color: AppColors.primaryColor,
            ),
          ),
          IconButton(
            onPressed: () => slideLeftWidget(
              newPage: CreditCardsScreen(),
              context: context,
            ),
            icon: Icon(
              Icons.credit_card,
              color: AppColors.primaryColor,
            ),
          ),
          IconButton(
            onPressed: () => slideLeftWidget(
              newPage: CreditCardsScreen(),
              context: context,
            ),
            icon: Icon(
              Icons.file_open_sharp,
              color: AppColors.primaryColor,
            ),
          ),
        ],
        leading: (isHome)
            ? SizedBox()
            : IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primaryColor,
                ),
              ),
      ),
      drawer: (isHome) ? ProfileDrawer() : null,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoaded) {
            return SuccessProfileStates(
              profileDataModel: state.sellerProfileDataModel,
            );
          } else if (state is ProfileError) {
            return Center(
              child: Text(state.message),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
