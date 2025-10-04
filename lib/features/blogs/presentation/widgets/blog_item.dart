import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import '../../domain/entities/blog.dart';
import '../pages/all_blog_details.dart';

class BlogItem extends StatelessWidget {
  final Blog blog;

  const BlogItem({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              10
            ),
            child: CachedNetworkImage(
              imageUrl: blog.imageUrl,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
          ).allPadding(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              0.01.height.hSpace,
              Text(
                blog.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              0.02.height.hSpace,
              Text(
                (blog.shDescription.length < 150)
                    ? blog.shDescription
                    : blog.shDescription.substring(0, 150),
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.black.withAlpha(210),
                    ),
              ),
              0.02.height.hSpace,
              Row(
                children: [
                  0.01.width.vSpace,
                  Text(
                    "قراءة المزيد",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                  ),
                ],
              ).hPadding(0.03.width),
              0.02.height.hSpace,
            ],
          ).hPadding(0.03.width),
        ],
      ),
    );
  }
}
