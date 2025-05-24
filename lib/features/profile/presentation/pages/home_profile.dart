import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/whatsapp_icon_button.dart';
import 'package:rowad_hrag/features/credit_cards/presentation/pages/credit_cards_screen.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/adds_screen.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/profile_drawer.dart';
import 'package:rowad_hrag/features/profile/presentation/widgets/points_item_cart.dart';
import 'package:rowad_hrag/features/profile/presentation/widgets/profile_item_cart.dart';
import 'package:rowad_hrag/features/settings/presentation/pages/profile_settings.dart';

class HomeProfile extends StatelessWidget {
  const HomeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:WhatsappIconButton(),
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
      ),
      drawer: ProfileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            0.01.height.hSpace,
            CircleAvatar(
              radius: 150,
              backgroundImage: CachedNetworkImageProvider(
                  "https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-6/489928976_2045949285915231_1389553330135841803_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=KNM_MyIEYasQ7kNvwELseOa&_nc_oc=Adm0BU_r7N8UkLkzdeG3srrmBdki4zhcRG5VYRNBXTANl-8WQEWrj1VRM7x_uyW08AQ&_nc_zt=23&_nc_ht=scontent.fcai22-1.fna&_nc_gid=gFELZSanVuecKEMVYZX38Q&oh=00_AfLLE-VHWpt9-knuD4ZqxHHGj3Cv976fDKd_aakfNe42Yw&oe=68286C14"),
            ),
            0.01.height.hSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hisham Aymen",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                0.02.width.vSpace,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "50 نقاط",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
            Text(
              "heshamaymen8@gmail.com",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withAlpha(50),
                  ),
            ),
            0.01.height.hSpace,
            0.01.height.hSpace,
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    child: Text(
                      "الاعلانات",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    onPressed: () => slideLeftWidget(
                      newPage: AddsScreen(),
                      context: context,
                    ),
                  ),
                ),
                0.01.width.vSpace,
                Expanded(
                  child: CustomElevatedButton(
                    child: Text(
                      "تعليقات الاعلانات",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            0.01.height.hSpace,
            ProfileItemCart(
              imagePath: "assets/images/box.jpg",
              title: "الاعلانات",
              count: "0",
            ),
            0.01.height.hSpace,
            ProfileItemCart(
              imagePath: "assets/images/star.jpg",
              title: "تقييم",
              count: "0",
              withPadding: true,
            ),
            0.01.height.hSpace,
            PointsItemCart(
              color: Color(0xff0abb75),
              title: 'النقاط النشطة',
              desc: "إجمالي النقاط النشطة",
              totalPoints: "50",
              balance: "3",
            ),
            0.02.height.hSpace,
            PointsItemCart(
              color: Color(0xfff24b6c),
              title: 'النقاط المنتهيه',
              desc: "إجمالي النقاط المنتهيه",
              totalPoints: "0",
              balance: "0",
            ),
            0.02.height.hSpace,
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
