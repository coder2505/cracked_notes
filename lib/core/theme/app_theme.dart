import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  // Light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondary,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 57,
        fontWeight: FontWeight.bold, // w700
      ),
      displayMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 45,
        fontWeight: FontWeight.w600, // SemiBold
      ),
      displaySmall: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 36,
        fontWeight: FontWeight.w600, // SemiBold
      ),

      headlineLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 32,
        fontWeight: FontWeight.w700, // Bold
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 28,
        fontWeight: FontWeight.w600, // SemiBold
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w500, // Medium
      ),

      titleLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w600, // SemiBold
      ),
      titleMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w500, // Medium
      ),
      titleSmall: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w500, // Medium
      ),

      bodyLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondary,
        fontSize: 16,
        fontWeight: FontWeight.w400, // Regular
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w400, // Regular
      ),
      bodySmall: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondary,
        fontSize: 12,
        fontWeight: FontWeight.w400, // Regular
      ),

      labelLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w600, // SemiBold
      ),
      labelMedium: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondary,
        fontSize: 12,
        fontWeight: FontWeight.w500, // Medium
      ),
      labelSmall: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textSecondary,
        fontSize: 11,
        fontWeight: FontWeight.w500, // Medium
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: AppColors.textSecondary, fontSize: 16),
      hintStyle: TextStyle(color: AppColors.textSecondary),
      helperStyle: TextStyle(color: AppColors.textSecondary),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
      error: AppColors.danger,
      onPrimary: AppColors.textOnPrimary,
      onSecondary: AppColors.textPrimary,
      onSurface: AppColors.textPrimary,
      onError: AppColors.textOnDanger,
    ),
  );

  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.textOnPrimary,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondaryDark,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.surface),
      bodyMedium: TextStyle(color: AppColors.textSecondary),
      bodySmall: TextStyle(color: AppColors.textSecondary, fontSize: 14),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      surface: AppColors.surface,
      error: AppColors.danger,
      onPrimary: AppColors.textOnPrimary,
      onSecondary: AppColors.surface,
      onSurface: AppColors.surface,
      onError: AppColors.textOnDanger,
    ),
  );
}
