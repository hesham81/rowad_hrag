import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';

class OnboardingPageTwo extends StatelessWidget {
  const OnboardingPageTwo({super.key});

  static final Duration _duration = Duration(seconds: 2);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0.12.height,
            left: 0.18.width,
            child: Column(
              children: [
                ZoomIn(
                    duration: _duration,
                    child: SvgPicture.asset(AppAssets.coloredLogo,
                        width: 0.35.width)),
                70.hSpace,
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      text: ".ابحث عنه. أحبه",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 44),
                      children: <TextSpan>[
                        TextSpan(
                          text: "\n اشتريه",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 44,
                            color: AppColors.secondaryColor,
                          ),
                        )
                      ]),
                ),
              ],
            )),
        Center(
          child: SvgPicture.asset(
            AppAssets.centerVector,
            width: double.infinity,
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: FadeInUp(
                delay: Duration(milliseconds: 700),
                duration: _duration,
                child: Image.asset(
                  (AppAssets.imageTwo),
                ))),
      ],
    );
  }
}
