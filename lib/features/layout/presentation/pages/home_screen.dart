import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/alignment.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/services/auth_services.dart';
import 'package:rowad_hrag/core/services/url_launcher_func.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/whatsapp_icon_button.dart';
import 'package:rowad_hrag/features/all_product_search/presentation/pages/all_product_search.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/domain/entities/add_rate_request.dart';
import 'package:rowad_hrag/features/layout/presentation/pages/loaded_home_screen.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/product_widget.dart';
import 'package:rowad_hrag/features/sub_categories/presentation/pages/sub_categories.dart';
import '../../../../core/widget/custom_text_button.dart';
import '../../../../core/widget/custom_text_form_field.dart';
import '/features/layout/presentation/manager/home_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../widget/biggest_inf.dart';
import '../widget/rate_us.dart';
import '../widget/about.dart';
import '../widget/reviews.dart';
import '../widget/special_ads_widget.dart';
import '../widget/categories.dart';
import '/core/extensions/align.dart';
import '/core/constant/app_assets.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';
import '../widget/upper_bar.dart';
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
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://rowad-harag.com/public/uploads/all/zxMmVMJLPhdgIdGmT2ccLXxm89VjD5Qu2U3akNOu.mp4',
      ),
    );

    _controller.initialize().then((_) {
      setState(() {
        _isVideoInitialized = true;
      });
      _controller.setLooping(true);
      _controller.play();
    });
  }

  @override
  void dispose() {
    // Dispose of the video player controller to free resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Scaffold(

      floatingActionButton: WhatsappIconButton(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SvgPicture.asset(
                AppAssets.upperNav,
                fit: BoxFit.cover,
              ),
              Container(
                color: AppColors.primaryColor,
                child: Row(
                  children: [
                    0.02.width.vSpace,
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppColors.blueColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          AppAssets.notificationIcon,
                        ).allPadding(12),
                      ),
                      onTap: () => Navigator.pushNamed(
                        context,
                        RouteNames.notifications,
                      ),
                    ),
                    0.04.width.vSpace,
                    SvgPicture.asset(
                      AppAssets.coloredLogo,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                    0.04.width.vSpace,
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        AppAssets.searchIcon,
                      ).allPadding(12),
                    ),
                    0.02.width.vSpace,
                    Expanded(
                      child: CustomTextFormField(
                        hintText: "أبحث عن ",
                        controller: searchController,
                        // onChange: search,
                      ),
                    ),
                  ],
                ).hPadding(0.02.width).vPadding(0.01.height),
              ),
              Container(
                height: 0.05.height,
                color: AppColors.primaryColor,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (index == 0) return;
                      if (index == 3) {
                        UrlLauncherFunc.openUrl(
                          "https://rowad-harag.com/add-ad",
                        );
                        return;
                      }
                      if (index == 7) {
                        AuthServices.signOut();
                        return;
                      }
                      pushNamed(
                        newPage: cubit.pages[index],
                        context: context,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                        child: Text(
                          labels[index],
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                        ),
                      ).allPadding(3),
                    ),
                  ),
                  separatorBuilder: (context, index) => 0.01.width.vSpace,
                  itemCount: labels.length,
                ),
              ).hPadding(0.01.width),
              Divider(
                color: Colors.black,
                thickness: 1, // Optional: Adjust thickness if needed
              ),
              0.01.height.hSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      height: 0.23.height,
                      child: _isVideoInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Center(
                              child: Container(
                                width: double.maxFinite,
                                height: 0.23.height,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                                child: CircularProgressIndicator(
                                  color: AppColors.secondaryColor,
                                ).center,
                              ),
                            ),
                    ),
                    // Play/Pause Button
                    if (_isVideoInitialized)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black54,
                          radius: 30,
                          child: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                  ],
                ),
              ).hPadding(0.02.width),
              0.01.height.hSpace,
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is LoadedHomeScreen) {
                    return LoadedHomeScreenUi(
                      categories: state.categories,
                      banner: state.banner,
                      secondBanner: state.secondBanner,
                      specialProducts: state.specialProducts,
                      productiveFamiliesProducts:
                          state.productiveFamiliesProducts,
                      specialNeedsProducts: state.specialNeedsProducts,
                      allProducts: state.allProducts,
                      reviews: state.reviews,
                      visitorStatesDataModel: state.visitorStatesDataModel,
                      topSellers: state.topSellers,
                      subCategoriesFunc: (name, id) async {
                        await cubit.getAllSubCategories(id);
                        slideLeftWidget(
                          newPage: SubCategoriesScreen(
                            data: cubit.subCategories,
                            title: name,
                          ),
                          context: context,
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator(
                      color: AppColors.secondaryColor,
                    );
                  }
                },
              ),
              0.01.height.hSpace,
            ],
          ),
        ),
      ),
    );
  }
}
