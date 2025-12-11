import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';

class ComingSoon extends StatelessWidget {
  final bool showButton;

  const ComingSoon({
    super.key,
    this.showButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppAssets.comingSoon,
            options: LottieOptions(
              enableApplyingOpacityToLayers: true,
            ),
            onLoaded: (p0) {
              print("The Ending is Come");
              // log("Ended");
            },
            repeat: false,
          ),
          0.02.height.hSpace,
          Visibility(
            visible: showButton,
            replacement: Container(),
            child: FadeInUp(
              delay: Duration(seconds: 3),
              duration: Duration(seconds: 3),
              child: SizedBox(
                width: double.maxFinite,
                child: CustomElevatedButton(
                  child: Text(
                    "رجوع",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ).hPadding(0.04.width),
            ),
          ),
        ],
      ),
    );
  }
}
