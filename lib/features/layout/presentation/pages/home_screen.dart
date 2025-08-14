import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/services/auth_services.dart';
import 'package:rowad_hrag/core/services/url_launcher_func.dart';
import 'package:rowad_hrag/core/widget/whatsapp_icon_button.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/presentation/pages/loaded_home_screen.dart';
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

  int selectedStarterIndex = 0;

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
                color: Colors.grey,
                thickness: 1, // Optional: Adjust thickness if needed
              ),
              SizedBox(
                height: 0.04.height,
                child: Marquee(

                  text: 'سجل معنا برواد حراج واكسب ٥٠ نقطة       نزل أربعة إعلانات واكسب ٢٠٠ نقطة       شارك الآن واحصل على مكافآت خاصة',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  velocity: 60, // Speed of scroll (pixels per second)
                  numberOfRounds: 1000, // Number of times the text scrolls (high = long time)
                  startPadding: 20, // Add padding at the start
                  blankSpace: 50, // Extra space after text before it loops
                  textDirection: TextDirection.rtl, // Essential for Arabic
                  accelerationDuration: Duration.zero, // No acceleration (constant speed)
                  accelerationCurve: Curves.linear,
                  decelerationDuration: Duration.zero,
                  decelerationCurve: Curves.linear,
                  pauseAfterRound: const Duration(milliseconds: 500), // Small pause between loops
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1, // Optional: Adjust thickness if needed
              ),
              GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  // Define a threshold for velocity to detect intentional drag
                  const double velocityThreshold = 300;

                  if (details.primaryVelocity != null) {
                    if (details.primaryVelocity! > velocityThreshold) {
                      // Dragged right → increase index
                      if (selectedStarterIndex < 2) {
                        setState(() {
                          selectedStarterIndex++;
                        });
                      }
                    } else if (details.primaryVelocity! < -velocityThreshold) {
                      // Dragged left → decrease index
                      if (selectedStarterIndex > 0) {
                        setState(() {
                          selectedStarterIndex--;
                        });
                      }
                    }
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: (selectedStarterIndex != 0)
                      ? GestureDetector(
                          onTap: () {
                            UrlLauncherFunc.openUrl(
                                images[selectedStarterIndex]);
                          },
                          child: CachedNetworkImage(
                              imageUrl: images[selectedStarterIndex]),
                        )
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              height: 0.23.height,
                              child: _isVideoInitialized
                                  ? AspectRatio(
                                      aspectRatio:
                                          _controller.value.aspectRatio,
                                      child: VideoPlayer(_controller),
                                    )
                                  : Center(
                                      child: Container(
                                        width: double.maxFinite,
                                        height: 0.23.height,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
