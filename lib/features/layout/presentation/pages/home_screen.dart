import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/services/auth_services.dart';
import 'package:rowad_hrag/core/services/url_launcher_func.dart';
import 'package:rowad_hrag/core/widget/custom_text_button.dart';
import 'package:rowad_hrag/core/widget/icon_error.dart';
import 'package:rowad_hrag/core/widget/whatsapp_icon_button.dart';
import 'package:rowad_hrag/features/all_product_search/presentation/widgets/all_products_widget.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/presentation/pages/all_products_viewer.dart';
import 'package:rowad_hrag/features/layout/presentation/pages/loaded_home_screen.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/categories.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/product_widget.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/special_products_home_screen.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/speical_product_widget.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/story_widget.dart';
import 'package:rowad_hrag/features/stories/presentation/pages/stories.dart';
import 'package:rowad_hrag/features/sub_categories/presentation/pages/sub_categories.dart';
import '../../../../core/widget/custom_text_form_field.dart';
import '/features/layout/presentation/manager/home_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '/core/extensions/align.dart';
import '/core/constant/app_assets.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => pushNamed(
                        newPage: RouteNames.notifications,
                        context: context,
                      ),
                      child: Image.asset(
                        "assets/images/Frame 1261153646.png",
                      ),
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      AppAssets.coloredLogo,
                      width: 60,
                    ),
                  ],
                ).hPadding(0.03.width),
                SizedBox(
                  height: 0.12.height,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => StoryWidget(
                      imageUrl:
                          "https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/522598565_2125203187989840_3408856964049920562_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Ly6Lftnf6JcQ7kNvwGFDiXt&_nc_oc=AdmK6cC-Tf7Okr3EjN541Am8WlDg7lgwzI3o53soUy-xTzSyo4e9UvwsUlM4hXYHxu0&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=58q98s7-_6DOUoEVFZcuNA&oh=00_Afe5wiHkTiNwD55e52OoEKgGw-ZRnqEN8mxMA2lQ1p5CDw&oe=68F6C8D1",
                    ),
                    separatorBuilder: (context, index) => 0.03.width.vSpace,
                    itemCount: 15,
                  ),
                ).hPadding(0.03.width),
                0.03.height.hSpace,
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: AppColors.secondaryColor,
                      width: 1.5,
                    ),
                  ),
                  child: Image.asset(
                    "assets/images/b6ed44f0e1c7f0429b7e8125b3d937cef6c1ddfa.png",
                    height: 0.2.height,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ).hPadding(0.03.width),
                0.02.height.hSpace,
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is LoadedHomeScreen) {
                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: state.banner.last.imageUrl,
                            ),
                          ).hPadding(0.03.width),
                          0.02.height.hSpace,
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                "استكشاف الفئات",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greenColor,
                                    ),
                              ),
                              Spacer(),
                              CustomTextButton(
                                text: "المزيد",
                                onPressed: () {},
                              ),
                            ],
                          ).hPadding(0.03.width),
                          0.02.height.hSpace,
                          GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 3,
                              crossAxisSpacing: 3,
                            ),
                            itemBuilder: (context, index) => Column(
                              children: [
                                Categories(
                                  index: index,
                                  imageUrl: state.categories[index].icon,
                                  text: state.categories[index].name,
                                ).allPadding(8),
                                Expanded(
                                  child: Text(
                                    state.categories[index].name.replaceFirst(
                                      "حراج",
                                      "",
                                    ),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            itemCount: 8,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          ),
                          0.02.height.hSpace,
                          CachedNetworkImage(
                            imageUrl: state.secondBanner.first.imageUrl,
                          ),
                          0.02.height.hSpace,
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                "إعلانات مميزة",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: AppColors.greenColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () => slideLeftWidget(
                                  newPage: AllProductsViewer(
                                    title: "إعلانات مميزة",
                                    products: state.specialProducts,
                                    isSpecial: true,
                                  ),
                                  context: context,
                                ),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.greenColor,
                                ),
                              ),
                            ],
                          ).hPadding(0.03.width),
                          0.02.height.hSpace,
                          SizedBox(
                            height: 0.4.height,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  SpecialProductWidget(
                                product: state.specialProducts[index],
                              ),
                              separatorBuilder: (context, index) =>
                                  0.02.width.vSpace,
                              itemCount: state.specialProducts.length,
                            ),
                          ).hPadding(0.03.width),
                          0.02.height.hSpace,
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                "إعلانات الأسر المنتجة",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: AppColors.greenColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () => slideLeftWidget(
                                  newPage: AllProductsViewer(
                                    title: "إعلانات الأسر المنتجة",
                                    products: state.productiveFamiliesProducts,
                                  ),
                                  context: context,
                                ),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.greenColor,
                                ),
                              ),
                            ],
                          ).hPadding(0.03.width),
                          0.02.height.hSpace,
                          SizedBox(
                            height: 0.3.height,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => ProductWidget(
                                product:
                                    state.productiveFamiliesProducts[index],
                              ),
                              separatorBuilder: (context, index) =>
                                  0.02.width.vSpace,
                              itemCount:
                                  state.productiveFamiliesProducts.length,
                            ),
                          ).hPadding(0.03.width),
                          0.02.height.hSpace,
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                "إعلانات لذوي الاحتياجات الخاصة",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: AppColors.greenColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () => slideLeftWidget(
                                    newPage: AllProductsViewer(
                                      title: "إعلانات لذوي الاحتياجات الخاصة",
                                      products: state.specialNeedsProducts,
                                    ),
                                    context: context),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.greenColor,
                                ),
                              ),
                            ],
                          ).hPadding(0.03.width),
                          0.02.height.hSpace,
                          SizedBox(
                            height: 0.3.height,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => ProductWidget(
                                product: state.specialNeedsProducts[index],
                              ),
                              separatorBuilder: (context, index) =>
                                  0.02.width.vSpace,
                              itemCount: state.specialNeedsProducts.length,
                            ),
                          ).hPadding(0.03.width),
                          0.02.height.hSpace,
                          Image.asset(
                            "assets/images/4c44065dbf4502f0ede58e0ce947e46c6e1f717b.png",
                          ),
                          0.03.height.hSpace,
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                "كل الاعلانات",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: AppColors.greenColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )
                            ],
                          ).hPadding(0.03.width),
                          0.03.height.hSpace,
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => AllProductsWidget(
                              isOdd: index.isOdd,
                              product: state.allProducts[index],
                            ),
                            separatorBuilder: (context, index) =>
                                0.02.height.hSpace,
                            itemCount: state.allProducts.length,
                          )
                        ],
                      );
                    } else if (state is HomeError) {
                      return ErrorWidget(
                        state.message,
                      );
                    } else {
                      return CircularProgressIndicator(
                        color: AppColors.greenColor,
                      ).center;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
