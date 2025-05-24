import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/core/extensions/alignment.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';

class BiggestInf extends StatelessWidget {
  const BiggestInf({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.3.height,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secondaryColor,
        ),
        color: AppColors.secondaryColor.withAlpha(35),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "كبار المعلنين",
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  "https://scontent.fspx1-1.fna.fbcdn.net/v/t39.30808-1/489928976_2045949285915231_1389553330135841803_n.jpg?stp=dst-jpg_p320x320_tt6&_nc_cat=102&ccb=1-7&_nc_sid=e99d92&_nc_ohc=q--Vv0ba5PgQ7kNvwFL51tX&_nc_oc=AdlqgZqCjHNZRJsKdzyG0ly9zk16ekS3aodYvzFJCnFwgu24tuqCmPhkE_rtCkhzIDE&_nc_zt=24&_nc_ht=scontent.fspx1-1.fna&_nc_gid=BAa8osBFWzri3Vo_AmgNeQ&oh=00_AfJZXtpxjsqB3BTyfmtNnsnVctbmCR18bnZiRsMtISh6Fg&oe=68369552",
                ),
                radius: 80,
              ),
              separatorBuilder: (context, index) => 0.03.width.vSpace,
              itemCount: 20,
            ),
          ),
        ],
      ).rightBottomWidget().allPadding(25),
    );
  }
}
