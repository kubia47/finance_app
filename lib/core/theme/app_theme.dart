import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFFE2F5E8); // Light mint green
  static const Color primaryYellow = Color(0xFFFCFA63);
  static const Color textPrimary = Color(0xFF1E2124);
  static const Color textSecondary = Color(0xFF7B8B80);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color greenPositive = Color(0xFF2EA752);
  static const Color redNegative = Color(0xFFE34D43);
  static const Color surfaceWhite = Color(0xFFFBFDFB);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryYellow,
        primary: AppColors.black,
        surface: AppColors.background,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return lightTheme; // For this specific design, default to light
  }
}
