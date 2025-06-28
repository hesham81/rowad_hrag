import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/icon_error.dart';
import 'package:rowad_hrag/features/adds_reviews/presentation/pages/adds_reviews_ui.dart';

import '../manager/adds_reviews_cubit.dart';

class AddsReviews extends StatelessWidget {
  const AddsReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تقييمات الاعلانات",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<AddsReviewsCubit, AddsReviewsState>(
        builder: (context, state) {
          if (state is LoadedAddsReviewsState) {
            return AddsReviewsUi(
              reviews: state.addsReviews,
            );
          } else if (state is ErrorAddsReviewsState) {
            return IconError(
              error: state.message,
            ).center;
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.secondaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
