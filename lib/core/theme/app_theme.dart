import 'package:flutter/material.dart';
import '/core/theme/app_colors.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xffE3F1EE),
    fontFamily: 'Cairo',
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor:AppColors.primaryColor,
      iconTheme: IconThemeData(
        color: AppColors.secondaryColor,
      ),
    ),
  );
}
