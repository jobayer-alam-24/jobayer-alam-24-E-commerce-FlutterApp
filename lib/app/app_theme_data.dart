import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      scaffoldBackgroundColor: Colors.white,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.themeColor
      )
    );
  }
  static ThemeData get darkThemeData {
    return ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        brightness: Brightness.dark,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: AppColors.themeColor
        )
    );
  }
}