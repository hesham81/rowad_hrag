import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:video_player/video_player.dart';

import '../manager/home_cubit.dart';
import '../widget/about.dart';
import '../widget/biggest_inf.dart';
import '../widget/categories.dart';
import '../widget/rate_us.dart';
import '../widget/reviews.dart';
import '../widget/special_ads_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  late VideoPlayerController _controller;
  bool _isVideoInitialized = false; // Track video initialization status
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              color: AppColors.primaryColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    SizedBox(
                      width: 1.width, // Full screen width
                      child: Divider(
                        color: Colors.black,
                        thickness: 1, // Optional: Adjust thickness if needed
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.snbBank,
                        ),
                        Text(
                          "01400028419910 ",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.secondaryColor,
                                    fontSize: 10,
                                  ),
                        ),
                        0.01.width.vSpace,
                        Text(
                          "رقم الحساب المصر في ",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.secondaryColor,
                                    fontSize: 10,
                                  ),
                        ),
                        0.01.width.vSpace,
                        Text(
                          "البنك الأهلي",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.blueColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                        ),
                      ],
                    ).hPadding(0.01.width),
                  ],
                ),
              ),
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
                if (state is HomeLoading || state is HomeInitial) {
                  return Center(child: CircularProgressIndicator());
                } else if (handler is HomeLoaded) {
                  return SizedBox(
                    height: 0.15.height,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Categories(
                        imageUrl: handler.categories[index].icon,
                        text: handler.categories[index].name,
                      ),
                      separatorBuilder: (context, index) => 0.01.width.vSpace,
                      itemCount: 10,
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            CarouselSlider(
              items: ads.map((e) => Image.asset(e)).toList(),
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
            SpecialAdsWidget(
              title: "إعلانات مميزة",
            ).hPadding(0.03.width),
            0.01.height.hSpace,
            SpecialAdsWidget(
              title: 'إعلانات ذوي الاحتياجات الخاصة',
            ).hPadding(0.03.width),
            0.01.height.hSpace,
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SvgPicture.asset(
                "assets/images/click_here.svg",
              ),
            ).hPadding(0.03.width),
            0.01.height.hSpace,
            About().hPadding(0.03.width),
            0.01.height.hSpace,
            Reviews().hPadding(0.03.width),
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
