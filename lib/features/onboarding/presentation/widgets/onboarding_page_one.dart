import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});
  static final Duration _duration=Duration(seconds: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child:FadeInRight(
                    duration: _duration,
                    child: SvgPicture.asset(AppAssets.topVector,height: 0.8.height ))
                  ),
                Center(
                  child:ZoomIn(
                    duration: _duration,
                    child: SvgPicture.asset(AppAssets.coloredLogo,width: 0.85.width ,))),
                
                Align(
                  alignment: Alignment.bottomLeft,
                  child:FadeInLeft(
                    duration: _duration,
                    child: SvgPicture.asset(AppAssets.bottomVector,height: 0.75.height))
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FadeInUp(
                    // delay: Duration(seconds: 1),
                    duration: _duration,
                    child: Image.asset((AppAssets.one),width: double.infinity,))
                ),
                  
              ],
            ),
    );
  }
}