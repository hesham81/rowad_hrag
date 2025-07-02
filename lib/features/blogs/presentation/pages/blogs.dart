import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/blogs/presentation/manager/blog_cubit.dart';
import 'package:rowad_hrag/features/blogs/presentation/pages/all_blog_details.dart';
import 'package:rowad_hrag/features/blogs/presentation/widgets/blog_item.dart';

import '../../domain/entities/blog.dart';

class Blogs extends StatefulWidget {
  const Blogs({super.key});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  var service = WebServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المدونات",
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            0.01.height.hSpace,
            // CupertinoSearchTextField(),
            0.01.height.hSpace,
            // ListView.separated(
            //   padding: EdgeInsets.zero,
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) => GestureDetector(
            //     onTap: () => slideLeftWidget(
            //       newPage: AllBlogDetails(
            //         blog: cubit.blogDataModel[index],
            //       ),
            //       context: context,
            //     ),
            //     child: BlogItem(
            //       blog: cubit.blogDataModel[index],
            //     ),
            //   ),
            //   separatorBuilder: (context, index) => 0.01.height.hSpace,
            //   itemCount: cubit.blogDataModel.length,
            // ),
            BlocBuilder<BlogCubit, BlogState>(
              builder: (context, state) {
                if (state is BlogLoaded) {
                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => slideLeftWidget(
                        newPage: AllBlogDetails(
                          blog: state.blogs[index],
                        ),
                        context: context,
                      ),
                      child: BlogItem(
                        blog: state.blogs[index],
                      ),
                    ),
                    separatorBuilder: (context, index) => 0.01.height.hSpace,
                    itemCount: state.blogs.length,
                  );
                } else if (state is BlogError) {
                  return Text(
                    state.message,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                  );
                }
                else
                  {
                    return SizedBox();
                  }
              },
            ),

            0.02.height.hSpace,
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
