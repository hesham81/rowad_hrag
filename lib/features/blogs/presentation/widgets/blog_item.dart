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
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: CachedNetworkImage(
              imageUrl: blog.imageUrl,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                blog.title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                (blog.shDescription.length < 150)
                    ? blog.shDescription
                    : blog.shDescription.substring(0, 150),
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.black,
                    ),
              ),
              CustomElevatedButton(
                btnColor: AppColors.primaryColor,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.secondaryColor,
                    ),
                    0.01.width.vSpace,
                    Text(
                      "Read Full Blog",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                    ),
                  ],
                ).hPadding(0.03.width),
                onPressed: () => slideLeftWidget(
                  newPage: AllBlogDetails(
                    blog: blog,
                  ),
                  context: context,
                ),
              )
            ],
          ).hPadding(0.03.width),
        ],
      ),
    );
  }
}
