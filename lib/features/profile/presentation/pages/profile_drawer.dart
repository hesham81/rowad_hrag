// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:route_transitions/route_transitions.dart';
// import 'package:rowad_hrag/core/constant/app_assets.dart';
// import 'package:rowad_hrag/core/extensions/dimensions.dart';
// import 'package:rowad_hrag/core/extensions/extensions.dart';
// import 'package:rowad_hrag/core/theme/app_colors.dart';
// import 'package:rowad_hrag/features/contact_with_support/presentation/pages/contact_with_support.dart';
// import 'package:rowad_hrag/features/credit_cards/presentation/pages/credit_cards_screen.dart';
// import 'package:rowad_hrag/features/settings/presentation/pages/profile_settings.dart';
//
// class ProfileDrawer extends StatelessWidget {
//   const ProfileDrawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 0.7.width,
//       color: Colors.white,
//       child: Expanded(
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SvgPicture.asset(
//                   AppAssets.coloredLogo,
//                 ).allPadding(15),
//                 Divider(),
//                 ListTile(
//                   onTap: () => slideLeftWidget(
//                     newPage: ProfileSettings(),
//                     context: context,
//                   ),
//                   subtitle: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(
//                         Icons.settings,
//                         color: AppColors.secondaryColor,
//                       ),
//                       Text(
//                         "الاعدادات",
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Divider(),
//                 ListTile(
//                   onTap: () {},
//                   subtitle: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(
//                         Icons.ads_click,
//                         color: AppColors.secondaryColor,
//                       ),
//                       Text(
//                         "الاعلانات",
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Divider(),
//                 ListTile(
//                   onTap: () => slideLeftWidget(
//                     newPage: CreditCardsScreen(),
//                     context: context,
//                   ),
//                   subtitle: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(
//                         Icons.credit_card,
//                         color: AppColors.secondaryColor,
//                       ),
//                       Text(
//                         "التحويلات البنكيه",
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Divider(),
//                 ListTile(
//                   onTap: () {},
//                   subtitle: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(
//                         Icons.chat,
//                         color: AppColors.secondaryColor,
//                       ),
//                       Text(
//                         "المحادثات",
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Divider(),
//                 ListTile(
//                   onTap: () => slideLeftWidget(
//                     newPage: ContactWithSupport(),
//                     context: context,
//                   ),
//                   subtitle: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(
//                         Icons.support_agent,
//                         color: AppColors.secondaryColor,
//                       ),
//                       Text(
//                         "تواصل مع الدعم",
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Divider(),
//                 // ListTile(
//                 //   onTap: () => slideLeftWidget(
//                 //     newPage: PlansScreen(),
//                 //     context: context,
//                 //   ),
//                 //   subtitle: Row(
//                 //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //     children: [
//                 //       Icon(
//                 //         Icons.settings,
//                 //         color: AppColors.secondaryColor,
//                 //       ),
//                 //       Text(
//                 //         "الخطط",
//                 //         overflow: TextOverflow.ellipsis,
//                 //         style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                 //               fontWeight: FontWeight.bold,
//                 //             ),
//                 //       )
//                 //     ],
//                 //   ),
//                 // ),
//                 Divider(),
//                 ListTile(
//                   onTap: () {},
//                   subtitle: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(
//                         Icons.logout,
//                         color: AppColors.secondaryColor,
//                       ),
//                       Text(
//                         "تسجيل الخروج",
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Divider(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
