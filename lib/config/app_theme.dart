import 'package:flutter/material.dart';
import 'package:the_coterie/config/text_theme.dart';

class AppColors {
  // Primary Purple (Main brand color)
  static const Color primary = Color(0xFF3738D3);
  static const Color primaryGray = Color(0xFFCECDDF);
  // Light Background
  static const Color background = Color(0xFFFFFDFB);

  // Dark Blue (For text/accents)
  static const Color secondary = Color(0xFF082563);
  static const Color tertiary = Color(0xFFD2D2ED);
  static const Color tertiaryLight = Color(0xFFE1E6F0);

  static const Color contrast = Color(0xFF902D41);

  // Additional recommended variants
  static const Color primaryLight = Color(0xFFA9C8E6);
  static const Color primaryPeach = Color(0xFFE39AA1);
  static const Color primaryYellow= Color(0xFFFFD17B);
  static const Color primaryDark = Color(0xFF3A1D99);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textOnDark = Color(0xFFF1F5FF);
  static const Color textOnLight = Color(0xFF1A1A1A);
}

ThemeData buildAppTheme() {
  return ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiary,
      tertiaryContainer: AppColors.tertiaryLight,
      surface:AppColors.background,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onTertiary: AppColors.textOnLight,
      onSurface: AppColors.textPrimary,
      primaryContainer: AppColors.primaryDark,
      secondaryContainer: AppColors.secondary,
    ),
    textTheme: buildCustomTextTheme(),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(8),
    ),
    // Add more theme customizations
  );
}
