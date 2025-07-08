import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/layout/data/models/banner_data_model.dart';

import '../../../../core/services/url_launcher_func.dart';

class SecondBannersWidgetHomeScreen extends StatelessWidget {
  final List<BannerDataModel> secondBanner;

  const SecondBannersWidgetHomeScreen({
    super.key,
    required this.secondBanner,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => UrlLauncherFunc.openUrl(
        (secondBanner.isEmpty)
            ? "https://www.tiktok.com/@rowadharrag?lang=ar"
            : secondBanner[0].url,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: (secondBanner.isEmpty)
              ? "https://rowad-harag.com/public/uploads/all/lOO4a6OEYOD4oTWF1v4paCWTD4bxN1wRIcVohrba.png"
              : secondBanner[0].imageUrl,
        ),
      ).hPadding(0.03.width),
    );
  }
}
