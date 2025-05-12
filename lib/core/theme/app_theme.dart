import 'package:flutter/material.dart';
import '/core/theme/app_colors.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
    // scaffoldBackgroundColor: Color(0xffE3F1EE),
    scaffoldBackgroundColor:AppColors.primaryColor,
    fontFamily: 'Cairo',
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor:AppColors.secondaryColor,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),
  );
}
