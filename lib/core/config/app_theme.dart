import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF003366); // Deep Blue
  static const Color accentColor = Color(0xFFFFD700); // Bright Yellow
  static const Color backgroundColor = Color(0xFFF5F5F5); // Light Grey
  static const Color secondaryTextColor = Color(0xFF333333); // Dark Grey
  static const Color successColor = Color(0xFF28A745); // Green
  static const Color errorColor = Color(0xFFDC3545); // Red

  // Font
  static const String fontFamily = 'Poppins';

  // Padding & Margins
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;

  static const double defaultMargin = 16.0;
  static const double smallMargin = 8.0;
  static const double largeMargin = 24.0;

  // Text Theme
  static final TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: secondaryTextColor,
      fontFamily: fontFamily,
    ),
    displayMedium: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: secondaryTextColor,
      fontFamily: fontFamily,
    ),
    displaySmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: secondaryTextColor,
      fontFamily: fontFamily,
    ),

    headlineLarge: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: secondaryTextColor,
      fontFamily: fontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: secondaryTextColor,
      fontFamily: fontFamily,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: secondaryTextColor,
      fontFamily: fontFamily,
    ),

    titleLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: secondaryTextColor,
      fontFamily: fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: secondaryTextColor,
      fontFamily: fontFamily,
    ),
    titleSmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: secondaryTextColor,
      fontFamily: fontFamily,
    ),

    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: secondaryTextColor,
      fontFamily: fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: secondaryTextColor,
      fontFamily: fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      color: secondaryTextColor,
      fontFamily: fontFamily,
    ),

    labelLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: accentColor,
      fontFamily: fontFamily,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: accentColor,
      fontFamily: fontFamily,
    ),
    labelSmall: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.bold,
      color: accentColor,
      fontFamily: fontFamily,
    ),
  );

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: fontFamily, // Set global font family
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      error: errorColor,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: secondaryTextColor,
    ),
    textTheme: textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentColor,
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        textStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
      ),
    ),
  );
}
