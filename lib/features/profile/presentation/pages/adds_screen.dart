import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/adds/presentation/pages/adds_page.dart';

class AddsScreen extends StatelessWidget {
  const AddsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الاعلانات",
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
            0.02.height.hSpace,
            Container(
              width: double.maxFinite,
              height: 0.3.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black.withAlpha(80),
                ),
              ),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => slideLeftWidget(
                  newPage: AddsPage(),
                  context: context,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.add,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    0.02.height.hSpace,
                    Text(
                      "إضافة إعلان جديد",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            0.02.height.hSpace,
            Text(
              "جميع الإعلانات",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ).alignTopRight(),
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
