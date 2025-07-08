import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';

import '../../../../core/services/url_launcher_func.dart';
import '../../domain/entities/banner.dart';

class BannersHomeScreen extends StatelessWidget {
  final List<BannerEntity> banners;

  const BannersHomeScreen({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: banners
          .map(
            (e) => GestureDetector(
              onTap: () {
                UrlLauncherFunc.openUrl(e.url);
              },
              child: CachedNetworkImage(imageUrl: e.imageUrl),
            ),
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
    );
  }
}
