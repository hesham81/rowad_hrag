import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';

void configLoading() {

  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = Colors.white
    ..textColor = AppColors.secondaryColor
    ..indicatorColor = AppColors.secondaryColor
    ..userInteractions = false
    ..dismissOnTap = false;

}