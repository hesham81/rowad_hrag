import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/services/auth_services.dart';
import 'package:rowad_hrag/core/services/url_launcher_func.dart';
import 'package:rowad_hrag/core/widget/icon_error.dart';
import 'package:rowad_hrag/core/widget/whatsapp_icon_button.dart';
import 'package:rowad_hrag/features/all_product_search/presentation/widgets/all_products_widget.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/presentation/pages/loaded_home_screen.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/product_widget.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/special_products_home_screen.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/speical_product_widget.dart';
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
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false; // Track video initialization status

  final TextEditingController _reviewController = TextEditingController();
  double? rate;

  // search(String? searchParameter) {
  //   List<ProductsDataModel> allProducts =
  //
  // }

  List<String> profiles = [
    "https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/481198415_2008116629698497_3187727101447524743_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=0yCGK_Q-XDcQ7kNvwGsjEfB&_nc_oc=AdlXUC4JFjQmtXXyAoKr6SsgjBAOu0imgqLpn6TRN_Mv4OwKod8kFdcXCCuV46dXeaI&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=4VpsaL_zMajxR1vYThrCQQ&oh=00_AfcTB1mtlBuOHg_RtKKgndxU62y6CsUfDHr-6LjS0z_-PA&oe=68F1A42C",
    "https://scontent.fcai30-1.fna.fbcdn.net/v/t1.6435-9/127164874_1005637176613119_2491557231776884345_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=RbVqYr9eVxgQ7kNvwGx3jMv&_nc_oc=AdmweJa5-m_nnwJ7rCk3Zggviiyt62GW2NrpAsqhGmmJkBl2LSpUCkYCdQxzmHfaQGs&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=K1-3lUPe5wkoat2h8P61Yg&oh=00_AfdjA5EofuADl5mhaCkuGCL9pgs_1FL05qyf3A2219k4Qw&oe=691371E2",
    "https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/483103367_2018925161950977_3530181175992229483_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=u03X-0Zge2YQ7kNvwFSrgkj&_nc_oc=AdmUaK1uuKrnYvfuhGtLhWFoZswJRpXid0JWH2ZLSqaRs9aYj5lkqJJ_-W6PvGHTQSo&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=7HHdDwE-RrO4WS2ejN9-dA&oh=00_AfeWEdCqRLl52CPHd_706xC6Sn-9p4HjJzuoHKhXrMv0oQ&oe=68F1AAF1",
    "https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/483601244_2014988165678010_3165195477285177409_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=986cXwwpHMcQ7kNvwGTab9R&_nc_oc=AdnUCuC9jbsS-U7nOkda5NzAOql1x_6qZTUgWiIaMWc8LGVnM3QfFpnSAw8PyHiydRI&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=lbus7VQEDztrcf1Naakn4g&oh=00_AfcjT7vKOBVzD4bjJuegY3Uo_wXnI3Q-uF_INBFH7kKfVg&oe=68F1C05D",
  ];
  List<String> images = [
    "",
    "https://rowad-harag.com/public/uploads/all/rszSya92uYGmmNDrRsdrR0u3BQvzT29xTC8E8sYh.png",
    "https://rowad-harag.com/public/uploads/all/NQcldX63YJlRKfbjxHvbVBkCNDnWDBNVwur2Pqbd.png",
  ];

  TextEditingController searchController = TextEditingController();
  List<String> labels = [
    "الصفحة الرئيسية",
    "المدونات",
    "جميع الفئات",
    // "رفع ايصالات التحويل",
    "أضف اعلان",
    "سداد الرسوم و  الاشتراكات",
    "تواصل مع الدعم",
    "حسابي",
    "تسجيل خروج"
  ];
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isSend = false;

  List<ProductsDataModel> searchedProducts = [];

  @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.networkUrl(
  //     Uri.parse(
  //       'https://rowad-harag.com/public/uploads/all/zxMmVMJLPhdgIdGmT2ccLXxm89VjD5Qu2U3akNOu.mp4',
  //     ),
  //   );
  //
  //   _controller.initialize().then((_) {
  //     setState(() {
  //       _isVideoInitialized = true;
  //     });
  //     _controller.setLooping(true);
  //     _controller.play();
  //   });
  // }

  @override
  void dispose() {
    // Dispose of the video player controller to free resources
    _controller.dispose();
    super.dispose();
  }

  int selectedStarterIndex = 0;

  List<ProductsDataModel> products = [];

  _search(String? query) {
    searchedProducts = [];
    if (query != null && query.trim().isNotEmpty) {
      searchedProducts = products
          .where((product) =>
              product.name!.toLowerCase().contains(query.toLowerCase().trim()))
          .toSet()
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    // return Scaffold(
    //   floatingActionButton: WhatsappIconButton(),
    //   body: SingleChildScrollView(
    //     child: Form(
    //       key: formKey,
    //       child: Column(
    //         children: [
    //           SvgPicture.asset(
    //             AppAssets.upperNav,
    //             fit: BoxFit.cover,
    //           ),
    //           Container(
    //             color: AppColors.primaryColor,
    //             child: Row(
    //               children: [
    //                 0.02.width.vSpace,
    //                 GestureDetector(
    //                   child: Container(
    //                     height: 50,
    //                     width: 50,
    //                     decoration: BoxDecoration(
    //                       color: AppColors.blueColor,
    //                       borderRadius: BorderRadius.circular(10),
    //                     ),
    //                     child: SvgPicture.asset(
    //                       AppAssets.notificationIcon,
    //                     ).allPadding(12),
    //                   ),
    //                   onTap: () => Navigator.pushNamed(
    //                     context,
    //                     RouteNames.notifications,
    //                   ),
    //                 ),
    //                 0.04.width.vSpace,
    //                 SvgPicture.asset(
    //                   AppAssets.coloredLogo,
    //                   height: 40,
    //                   width: 40,
    //                   fit: BoxFit.cover,
    //                 ),
    //                 0.04.width.vSpace,
    //                 Container(
    //                   height: 50,
    //                   width: 50,
    //                   decoration: BoxDecoration(
    //                     color: AppColors.secondaryColor,
    //                     borderRadius: BorderRadius.circular(10),
    //                   ),
    //                   child: SvgPicture.asset(
    //                     AppAssets.searchIcon,
    //                   ).allPadding(12),
    //                 ),
    //                 0.02.width.vSpace,
    //                 Expanded(
    //                   child: CustomTextFormField(
    //                     hintText: "أبحث عن ",
    //                     controller: searchController,
    //                     onChange: _search,
    //                     // onChange: search,
    //                   ),
    //                 ),
    //               ],
    //             ).hPadding(0.02.width).vPadding(0.01.height),
    //           ),
    //           Container(
    //             height: 0.05.height,
    //             color: AppColors.primaryColor,
    //             child: ListView.separated(
    //               scrollDirection: Axis.horizontal,
    //               itemBuilder: (context, index) => GestureDetector(
    //                 onTap: () {
    //                   if (index == 0) return;
    //                   if (index == 3) {
    //                     UrlLauncherFunc.openUrl(
    //                       "https://rowad-harag.com/add-ad",
    //                     );
    //                     return;
    //                   }
    //                   if (index == 7) {
    //                     AuthServices.signOut();
    //                     return;
    //                   }
    //                   pushNamed(
    //                     newPage: cubit.pages[index],
    //                     context: context,
    //                   );
    //                 },
    //                 child: Container(
    //                   decoration: BoxDecoration(
    //                     color: AppColors.secondaryColor,
    //                     borderRadius: BorderRadius.circular(3),
    //                   ),
    //                   child: Center(
    //                     child: Text(
    //                       labels[index],
    //                       style:
    //                           Theme.of(context).textTheme.titleMedium!.copyWith(
    //                                 color: AppColors.primaryColor,
    //                               ),
    //                     ),
    //                   ).allPadding(3),
    //                 ),
    //               ),
    //               separatorBuilder: (context, index) => 0.01.width.vSpace,
    //               itemCount: labels.length,
    //             ),
    //           ).hPadding(0.01.width),
    //           Divider(
    //             color: Colors.grey,
    //             thickness: 1, // Optional: Adjust thickness if needed
    //           ),
    //           SizedBox(
    //             height: 0.04.height,
    //             child: Marquee(
    //               text:
    //                   'سجل معنا برواد حراج واكسب ٥٠ نقطة       نزل أربعة إعلانات واكسب ٢٠٠ نقطة       شارك الآن واحصل على مكافآت خاصة',
    //               style: const TextStyle(
    //                 fontSize: 14.0,
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.w500,
    //               ),
    //               velocity: 60,
    //               // Speed of scroll (pixels per second)
    //               numberOfRounds: 1000,
    //               // Number of times the text scrolls (high = long time)
    //               startPadding: 20,
    //               // Add padding at the start
    //               blankSpace: 50,
    //               // Extra space after text before it loops
    //               textDirection: TextDirection.rtl,
    //               // Essential for Arabic
    //               accelerationDuration: Duration.zero,
    //               // No acceleration (constant speed)
    //               accelerationCurve: Curves.linear,
    //               decelerationDuration: Duration.zero,
    //               decelerationCurve: Curves.linear,
    //               pauseAfterRound: const Duration(
    //                   milliseconds: 500), // Small pause between loops
    //             ),
    //           ),
    //           Divider(
    //             color: Colors.grey,
    //             thickness: 1, // Optional: Adjust thickness if needed
    //           ),
    //           Visibility(
    //               visible: searchController.text.isEmpty,
    //               replacement: (searchedProducts.isEmpty)
    //                   ? Column(
    //                       textDirection: TextDirection.ltr,
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                         Text(
    //                           '" نتيجة البحث عن"${searchController.text}',
    //                           textAlign: TextAlign.right,
    //                           style: Theme.of(context)
    //                               .textTheme
    //                               .titleLarge!
    //                               .copyWith(
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                         ).alignRight().hPadding(0.02.width),
    //                         0.1.height.hSpace,
    //                         Icon(
    //                           Icons.do_not_disturb_outlined,
    //                           color: Colors.grey,
    //                           size: 0.3.height,
    //                         ).center,
    //                         0.01.height.hSpace,
    //                         Text(
    //                           "لايوجد نتائج",
    //                           style: Theme.of(context)
    //                               .textTheme
    //                               .titleLarge!
    //                               .copyWith(
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                         ),
    //                       ],
    //                     )
    //                   : Column(
    //                       children: [
    //                         Text(
    //                           '" نتيجة البحث عن"${searchController.text}',
    //                           style: Theme.of(context)
    //                               .textTheme
    //                               .titleLarge!
    //                               .copyWith(
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                         ).alignRight().hPadding(0.02.width),
    //                         0.01.height.hSpace,
    //                         ListView.separated(
    //                           padding: EdgeInsets.zero,
    //                           shrinkWrap: true,
    //                           physics: const NeverScrollableScrollPhysics(),
    //                           itemBuilder: (context, index) =>
    //                               AllProductsWidget(
    //                                       product: searchedProducts[index])
    //                                   .hPadding(0.03.width),
    //                           separatorBuilder: (context, index) =>
    //                               0.01.height.hSpace,
    //                           itemCount: searchedProducts.length,
    //                         ),
    //                       ],
    //                     ),
    //               child: Column(
    //                 children: [
    //                   GestureDetector(
    //                     onHorizontalDragEnd: (DragEndDetails details) {
    //                       // Define a threshold for velocity to detect intentional drag
    //                       const double velocityThreshold = 300;
    //
    //                       if (details.primaryVelocity != null) {
    //                         if (details.primaryVelocity! > velocityThreshold) {
    //                           // Dragged right → increase index
    //                           if (selectedStarterIndex < 2) {
    //                             setState(() {
    //                               selectedStarterIndex++;
    //                             });
    //                           }
    //                         } else if (details.primaryVelocity! <
    //                             -velocityThreshold) {
    //                           // Dragged left → decrease index
    //                           if (selectedStarterIndex > 0) {
    //                             setState(() {
    //                               selectedStarterIndex--;
    //                             });
    //                           }
    //                         }
    //                       }
    //                     },
    //                     child: ClipRRect(
    //                       borderRadius: BorderRadius.circular(10),
    //                       child: (selectedStarterIndex != 0)
    //                           ? GestureDetector(
    //                               onTap: () {
    //                                 UrlLauncherFunc.openUrl(
    //                                     images[selectedStarterIndex]);
    //                               },
    //                               child: CachedNetworkImage(
    //                                   imageUrl: images[selectedStarterIndex]),
    //                             )
    //                           : Stack(
    //                               alignment: Alignment.center,
    //                               children: [
    //                                 SizedBox(
    //                                   width: double.maxFinite,
    //                                   height: 0.23.height,
    //                                   child: _isVideoInitialized
    //                                       ? AspectRatio(
    //                                           aspectRatio:
    //                                               _controller.value.aspectRatio,
    //                                           child: VideoPlayer(_controller),
    //                                         )
    //                                       : Center(
    //                                           child: Container(
    //                                             width: double.maxFinite,
    //                                             height: 0.23.height,
    //                                             decoration: BoxDecoration(
    //                                               borderRadius:
    //                                                   BorderRadius.circular(10),
    //                                               border: Border.all(
    //                                                 color: AppColors
    //                                                     .secondaryColor,
    //                                               ),
    //                                             ),
    //                                             child:
    //                                                 CircularProgressIndicator(
    //                                               color:
    //                                                   AppColors.secondaryColor,
    //                                             ).center,
    //                                           ),
    //                                         ),
    //                                 ),
    //                                 // Play/Pause Button
    //                                 if (_isVideoInitialized)
    //                                   GestureDetector(
    //                                     onTap: () {
    //                                       setState(() {
    //                                         if (_controller.value.isPlaying) {
    //                                           _controller.pause();
    //                                         } else {
    //                                           _controller.play();
    //                                         }
    //                                       });
    //                                     },
    //                                     child: CircleAvatar(
    //                                       backgroundColor: Colors.black54,
    //                                       radius: 30,
    //                                       child: Icon(
    //                                         _controller.value.isPlaying
    //                                             ? Icons.pause
    //                                             : Icons.play_arrow,
    //                                         color: Colors.white,
    //                                         size: 40,
    //                                       ),
    //                                     ),
    //                                   ),
    //                               ],
    //                             ),
    //                     ).hPadding(0.02.width),
    //                   ),
    //                   0.01.height.hSpace,
    //                   BlocBuilder<HomeCubit, HomeState>(
    //                     builder: (context, state) {
    //                       if (state is LoadedHomeScreen) {
    //                         products.addAll(
    //                             state.specialProducts.map((e) => e).toList());
    //                         products.addAll(state.productiveFamiliesProducts
    //                             .map((e) => e)
    //                             .toList());
    //                         products.addAll(state.specialNeedsProducts
    //                             .map((e) => e)
    //                             .toList());
    //                         products.addAll(
    //                             state.allProducts.map((e) => e).toList());
    //                         return LoadedHomeScreenUi(
    //                           categories: state.categories,
    //                           banner: state.banner,
    //                           secondBanner: state.secondBanner,
    //                           specialProducts: state.specialProducts,
    //                           productiveFamiliesProducts:
    //                               state.productiveFamiliesProducts,
    //                           specialNeedsProducts: state.specialNeedsProducts,
    //                           allProducts: state.allProducts,
    //                           reviews: state.reviews,
    //                           visitorStatesDataModel:
    //                               state.visitorStatesDataModel,
    //                           topSellers: state.topSellers,
    //                           subCategoriesFunc: (name, id) async {
    //                             await cubit.getAllSubCategories(id);
    //                             slideLeftWidget(
    //                               newPage: SubCategoriesScreen(
    //                                 data: cubit.subCategories,
    //                                 title: name,
    //                               ),
    //                               context: context,
    //                             );
    //                           },
    //                         );
    //                       } else if (state is HomeError) {
    //                         return IconError(
    //                           error: state.message,
    //                         );
    //                       } else {
    //                         return CircularProgressIndicator(
    //                           color: AppColors.secondaryColor,
    //                         );
    //                       }
    //                     },
    //                   ),
    //                 ],
    //               ))
    //         ],
    //       ),
    //     ),
    //   ),
    // );
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
                  height: 0.1.height,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        slideLeftWidget(
                          newPage: Stories(),
                          context: context,
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          profiles[index],
                        ),
                        radius: 40,
                      ),
                    ),
                    separatorBuilder: (context, index) => 0.03.width.vSpace,
                    itemCount: profiles.length,
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
                          Placeholder(),
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
                                onPressed: () {},
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
                                "إعلانات الأسر المنتجة والحرف اليدوية",
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
                                onPressed: () {},
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
                          // Row(
                          //   textDirection: TextDirection.rtl,
                          //   children: [
                          //     Text(
                          //       "إعلانات لذوي الاحتياجات الخاصة",
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .titleLarge!
                          //           .copyWith(
                          //             color: AppColors.greenColor,
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //     ),
                          //     Spacer(),
                          //     IconButton(
                          //       onPressed: () {},
                          //       icon: Icon(
                          //         Icons.arrow_back,
                          //         color: AppColors.greenColor,
                          //       ),
                          //     ),
                          //   ],
                          // ).hPadding(0.03.width),
                          0.02.height.hSpace,
                          // SizedBox(
                          //   height: 0.3.height,
                          //   child: ListView.separated(
                          //     scrollDirection: Axis.horizontal,
                          //     itemBuilder: (context, index) => ProductWidget(
                          //       product: state.specialNeedsProducts[index],
                          //     ),
                          //     separatorBuilder: (context, index) =>
                          //         0.02.width.vSpace,
                          //     itemCount: state.specialNeedsProducts.length,
                          //   ),
                          // ).hPadding(0.03.width),
                          0.02.height.hSpace,
                          Image.asset(
                            "assets/images/4c44065dbf4502f0ede58e0ce947e46c6e1f717b.png",
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
