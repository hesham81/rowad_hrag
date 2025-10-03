import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/sized_box.dart';

class OnboardingPageThree extends StatelessWidget {
  const OnboardingPageThree({super.key});
  static final Duration _duration=Duration(seconds: 2);
  
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
            top: 0.12.height,
            left: 0.18.width,
            child:Column(
              children: [
                ZoomIn(
                  duration: _duration,
                  child: SvgPicture.asset(AppAssets.coloredLogo,width: 0.35.width)),
                30.hSpace,
                Text.rich(
                  textAlign: TextAlign.center,
                    TextSpan(
                      text:"،ابحث عن غرضك، اتصل",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),
                      children: <TextSpan>[
                      TextSpan(
                      text:"\n .ادفع، أصبح الأمر سهلاً",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,),
                      )
                      ]
                    ),
                      
                ),
              ],
            )
            
            ),
          
          Center(
            // child: ZoomIn(duration: _duration,
            child:  SvgPicture.asset(AppAssets.centerVectorTwo,width: double.infinity,)
            // )
            ),
          Positioned(
            top: 0.27.height,
            left: 0.08.width,
            child: FadeInDown(
              delay: Duration(seconds: 1),
              duration: _duration,
              child: Image.asset((AppAssets.cards),width: 0.95.width,))
            ),
            Positioned(
            top: 0.43.height,
            child: FadeInLeft(
              delay: Duration(seconds: 2),
              duration: _duration,
              child: Image.asset((AppAssets.fawry),width: 0.9.width,))
            ),
            Positioned(
              top: 0.51.height,
              right: 0.0.width,
              child: FadeInRight(
                delay: Duration(seconds: 2),
                duration: _duration,
                child: Image.asset(AppAssets.dollars,width: 0.7.width,)))
        ],
    );
  }
}