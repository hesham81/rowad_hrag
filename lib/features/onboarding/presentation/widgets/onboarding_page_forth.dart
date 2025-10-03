import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/services/cash_helper.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';

class OnboardingPageForth extends StatelessWidget {
  const OnboardingPageForth({super.key});
  static final Duration _duration=Duration(seconds: 2);
    
  @override
  Widget build(BuildContext context) {
    void finishOnboarding() async {
    await CashHelper.setBool("isFirstTime", true);
    Navigator.pushReplacementNamed(context, RouteNames.signIn);
  }
    return Stack(
        children: [
          Align(
            alignment: AlignmentGeometry.centerRight,
            child: SvgPicture.asset(AppAssets.rightVector,height: 1.height,),
          ),
          Positioned(
            top: 0.12.height,
            left: 0.18.width,
            child:Column(
              children: [
                ZoomIn(
                  duration: _duration,
                  child: SvgPicture.asset(AppAssets.coloredLogo,width: 0.35.width)),
                32.hSpace,
                Text.rich(
                  textAlign: TextAlign.center,
                    TextSpan(
                      text:"،صور، اعرض، بيع",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 42),
                      children: <TextSpan>[
                      TextSpan(
                      text:"\n صار السوق في",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 42,color: AppColors.secondaryColor,),
                      ),
                      TextSpan(
                      text:"\n .ايدك",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 42,color: AppColors.secondaryColor,),
                      )
                      ]
                    ),
                      
                ),


              ],
            )
            
            ),
          
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: FadeInRight(
              delay: Duration(milliseconds: 600),
              duration: _duration,
              child: Image.asset((AppAssets.money),height: 0.59.height,))
            ),
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: FadeInUp(
              delay: Duration(seconds: 1),
              duration: _duration,
              child: SizedBox(
                width: 0.9.width,
                child: CustomElevatedButton(
                  btnColor: AppColors.thirdColor,
                child: Text(
                  "لنبدأ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        
                      ),
                ),
                onPressed: () => finishOnboarding()
                ),
              ).hPadding(10).vPadding(16),
            ),
          )
        ],
    );
 

  }
}