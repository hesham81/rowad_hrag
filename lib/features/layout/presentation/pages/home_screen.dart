import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/product_widget.dart';
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

  TextEditingController searchController = TextEditingController();
  List<String> labels = [
    "الصفحة الرئيسية",
    "المدونات",
    "جميع الفئات",
    "رفع ايصالات التحويل",
    "أضف اعلان",
    "الخطط",
    "تواصل مع الدعم",
    "حسابي",
    "تسجيل خروج"
  ];
  List<String> ads = [
    "assets/images/adds/1.png",
    "assets/images/adds/2.png",
    "assets/images/adds/3.png",
    "assets/images/adds/4.png",
    "assets/images/adds/5.png",
  ];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              AppAssets.upperNav,
              fit: BoxFit.cover,
            ),
            Container(
              color: AppColors.primaryColor,
              child: UpperBar(),
            ),
            Container(
              height: 0.05.height,
              color: AppColors.primaryColor,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
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
                var handler = state as Handling;
                if (state is HomeLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.secondaryColor,
                    ),
                  );
                } else if (handler is HomeLoaded) {
                  return SizedBox(
                    height: 0.17.height,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Categories(
                        imageUrl: handler.categories[index].icon,
                        text: handler.categories[index].name,
                      ),
                      separatorBuilder: (context, index) => 0.05.width.vSpace,
                      itemCount: handler.categories.length,
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            Skeletonizer(
              enabled: cubit.isBannersLoading,
              child: CarouselSlider(
                items: cubit.banners
                    .map(
                      (e) => CachedNetworkImage(imageUrl: e.imageUrl),
                    )
                    .toList(),
                options: CarouselOptions(
                  initialPage: 0,
                  height: 0.4.height,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            0.01.height.hSpace,
            Divider(),
            0.01.height.hSpace,
            Text(
              "اعلانات مميزه",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ).alignRight(),
            0.01.height.hSpace,
            SizedBox(
              height: 0.3.height,
              child: ListView.separated(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ProductWidget(
                  product: cubit.specialProducts[index],
                ).hPadding(0.03.width),
                separatorBuilder: (context, index) => 0.01.width.vSpace,
                itemCount: cubit.specialProducts.length,
              ),
            ),
            0.01.height.hSpace,
            Divider(),
            0.01.height.hSpace,
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: (cubit.secondBanner.isEmpty)
                    ? "https://rowad-harag.com/public/uploads/all/lOO4a6OEYOD4oTWF1v4paCWTD4bxN1wRIcVohrba.png"
                    : cubit.secondBanner[0].imageUrl,
              ),
            ).hPadding(0.03.width),
            0.03.height.hSpace,
            About().hPadding(0.03.width),
            0.01.height.hSpace,
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: AppColors.secondaryColor,
                ),
              ),
              child: Column(
                children: [
                  0.01.height.hSpace,
                  Text(
                    "المراجعات والتقيمات",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ).alignRight().allPadding(5),
                  ReviewsWidget(
                    reviews: (cubit.reviews.length < 3)
                        ? cubit.reviews
                        : cubit.reviews.sublist(0, 3),
                  ),
                ],
              ),
            ).hPadding(0.03.width),
            0.01.height.hSpace,
            RateUs().hPadding(0.03.width),
            0.01.height.hSpace,
            BiggestInf().hPadding(0.03.width),
            0.01.height.hSpace,
          ],
        ),
      ),
    );
  }
}
