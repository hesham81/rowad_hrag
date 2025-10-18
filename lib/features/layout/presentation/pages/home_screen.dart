import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:marquee/marquee.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/services/auth_services.dart';
import 'package:rowad_hrag/core/services/hive_helper.dart';
import 'package:rowad_hrag/core/services/url_launcher_func.dart';
import 'package:rowad_hrag/core/widget/custom_text_button.dart';
import 'package:rowad_hrag/core/widget/icon_error.dart';
import 'package:rowad_hrag/core/widget/whatsapp_icon_button.dart';
import 'package:rowad_hrag/features/all_product_search/presentation/widgets/all_products_widget.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/presentation/pages/all_products_viewer.dart';
import 'package:rowad_hrag/features/layout/presentation/pages/loaded_home_screen.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/categories.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/filter_button.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/product_widget.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/special_products_home_screen.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/speical_product_widget.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/story_widget.dart';
import 'package:rowad_hrag/features/stories/presentation/pages/stories.dart';
import 'package:rowad_hrag/features/sub_categories/presentation/pages/sub_categories.dart';
import '../../../../core/services/cash_helper.dart';
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
  List<String> selectedItems = [];
  List<ProductsDataModel> filteredData = [];
  var images = [
    "https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/510327662_2100046467172179_6995335266952488580_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=833d8c&_nc_ohc=8Y1c0htakCoQ7kNvwGuBVST&_nc_oc=AdmdL29J-advNS8f1TyGl7kC2Ld6lsHP4fNUry1gDvfYAiKiM6mgFHDzk78TIqIilXI&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=6lzdHrcXP81Xenbfo9S5HQ&oh=00_Afd39PNwp81_A-WZ8EQrlbvAty1pFIaO-2swtV5CkASdjA&oe=68F6E6F8",
    "https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/522598565_2125203187989840_3408856964049920562_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Ly6Lftnf6JcQ7kNvwGFDiXt&_nc_oc=AdmK6cC-Tf7Okr3EjN541Am8WlDg7lgwzI3o53soUy-xTzSyo4e9UvwsUlM4hXYHxu0&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=58q98s7-_6DOUoEVFZcuNA&oh=00_Afe5wiHkTiNwD55e52OoEKgGw-ZRnqEN8mxMA2lQ1p5CDw&oe=68F6C8D1",
    "https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/509868952_2100046417172184_7191003219048399424_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=833d8c&_nc_ohc=pmUJ4Xq0omYQ7kNvwGZd8EC&_nc_oc=Adk4_4mHczPKFirsYYyS6dNN-Y2Mx0C6plymJqMJHWSo3zSQqe4u9Ii-21Ppg_jK-p4&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=iJfUU2htz9YOpp_ceXMOGg&oh=00_AfdtOcDAzKKCmwxdFgMXPLA0s_22FB86p8bRyIGmLJMhLA&oe=68F704BD",
    "https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/509815362_2100046733838819_4844070285046835763_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_ohc=-IAmG7I0k4wQ7kNvwGvUL--&_nc_oc=AdlnFCUYdGAwo6uedwYlxWJqVXjIOuA3PlDGKRq7ZEUAEDh_w8bd8il_4xJjxx50VbM&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=s7vrDtBARX7QmLD3ZqOdeg&oh=00_AfcRii12SH0BMMrYEgpeeGN0WK7uEAh66QaP27aTm8NeZw&oe=68F70736",
  ];

  @override
  Widget build(BuildContext context) {
    HiveHelper.getFromLocal("allProducts").then(
      (value) => log(value.toString()),
    );
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
                StoryWidget(
                  imageUrl: images[1],
                ).alignLeft().hPadding(0.03.width),
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
                              imageUrl: "https://rowad-harag.com/public/uploads/all/CmzvnOH0njRJeTAbCDPOMpDqjERN4ZldBGpiYUHL.png",
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
                            imageUrl: "https://rowad-harag.com/public/uploads/all/lOO4a6OEYOD4oTWF1v4paCWTD4bxN1wRIcVohrba.png",
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
                              ),
                              Spacer(),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Text(
                                    'المنطقة',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: AppColors.greenColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  iconStyleData: IconStyleData(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: AppColors.greenColor,
                                    ),
                                  ),
                                  buttonStyleData: ButtonStyleData(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    height: 0.06.height,
                                    width: 0.3.width,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      border: Border.all(
                                        width: 1,
                                        color:
                                            AppColors.greenColor.withAlpha(100),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  items: state.allProducts
                                      .where((e) => e.cityName != null)
                                      .map((e) => e.cityName!)
                                      .toSet()
                                      .toList()
                                      .map((item) {
                                    return DropdownMenuItem(
                                      value: item,
                                      enabled: false,
                                      child: StatefulBuilder(
                                        builder: (context, menuSetState) {
                                          final isSelected =
                                              selectedItems.contains(item);
                                          return InkWell(
                                            onTap: () {
                                              if (isSelected) {
                                                selectedItems.remove(
                                                  item,
                                                );
                                              } else {
                                                selectedItems.add(item);
                                              }

                                              if (selectedItems.isEmpty) {
                                                filteredData = List.from(
                                                  state.allProducts,
                                                );
                                              } else {
                                                filteredData = state.allProducts
                                                    .where((e) =>
                                                        e.cityName != null &&
                                                        selectedItems.contains(
                                                            e.cityName))
                                                    .toList();
                                              }

                                              setState(() {});
                                              menuSetState(() {});
                                            },
                                            child: Container(
                                              height: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16.0,
                                              ),
                                              child: Row(
                                                children: [
                                                  if (isSelected)
                                                    const Icon(
                                                      Icons.check_box_outlined,
                                                    )
                                                  else
                                                    const Icon(
                                                      Icons
                                                          .check_box_outline_blank,
                                                    ),
                                                  const SizedBox(width: 16),
                                                  Expanded(
                                                    child: Text(
                                                      item,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }).toList(),
                                  //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                                  value: selectedItems.isEmpty
                                      ? null
                                      : selectedItems.last,
                                  onChanged: (value) {},
                                  selectedItemBuilder: (context) {
                                    return state.allProducts
                                        .where((e) => e.cityName != null)
                                        .map((e) => e.cityName!)
                                        .toSet()
                                        .toList()
                                        .map(
                                      (item) {
                                        return Container(
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Text(
                                            selectedItems.join(', '),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            maxLines: 1,
                                          ),
                                        );
                                      },
                                    ).toList();
                                  },
                                  menuItemStyleData: MenuItemStyleData(
                                    height: 40,
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ],
                          ).hPadding(0.03.width),
                          0.03.height.hSpace,
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => AllProductsWidget(
                              isOdd: index.isOdd,
                              product: (filteredData.isNotEmpty)
                                  ? filteredData[index]
                                  : state.allProducts[index],
                            ),
                            separatorBuilder: (context, index) =>
                                0.02.height.hSpace,
                            itemCount: (filteredData.isNotEmpty)
                                ? filteredData.length
                                : state.allProducts.length,
                          ),
                          0.03.height.hSpace,
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
