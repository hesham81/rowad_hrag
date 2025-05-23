import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/functions/filter_texts.dart';
import 'package:rowad_hrag/features/blogs/data/models/blog_data_model.dart';

import '../../../../core/theme/app_colors.dart';

class AllBlogDetails extends StatelessWidget {
  final BlogDataModel blog;

  const AllBlogDetails({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "اسم المدونه",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/adds/1.png",
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: 0.4.height,
            ),
            0.01.height.hSpace,
            Text(
              FilterTexts.getText(text: blog.descrption ?? ""),
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.titleMedium,
            ).hPadding(0.01.width),
          ],
        ),
      ),
    );
  }
}
