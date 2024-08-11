import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopliaxTypography {
  static TextStyle _baseStyle(
    double fontSize,
    FontWeight fontWeight,
    double height,
    double letterSpacing,
  ) {
    return GoogleFonts.plusJakartaSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height / fontSize,
      letterSpacing: letterSpacing,
    );
  }

  // Headings
  static TextStyle h1 = _baseStyle(48, FontWeight.bold, 57.6, -0.2);
  static TextStyle h2 = _baseStyle(40, FontWeight.bold, 48, -0.2);
  static TextStyle h3 = _baseStyle(32, FontWeight.bold, 38.4, -0.2);
  static TextStyle h4 = _baseStyle(28, FontWeight.bold, 33.6, -0.2);
  static TextStyle h5 = _baseStyle(24, FontWeight.bold, 28.8, -0.2);
  static TextStyle h6 = _baseStyle(20, FontWeight.bold, 24, -0.2);

  // Body (paragraph)
  static TextStyle p1 = _baseStyle(20, FontWeight.normal, 30, 0);
  static TextStyle p2 = _baseStyle(16, FontWeight.normal, 24, 0);
  static TextStyle p3 = _baseStyle(14, FontWeight.normal, 21, 0);
  static TextStyle p4 = _baseStyle(12, FontWeight.normal, 18, 0);

  // Labels
  static TextStyle bigLabel = _baseStyle(20, FontWeight.w500, 20, 0.5);
  static TextStyle smallLabel = _baseStyle(16, FontWeight.w500, 16, 0.5);

  // Buttons
  static TextStyle bigButtonText = _baseStyle(24, FontWeight.w500, 24, 0);
  static TextStyle smallButtonText = _baseStyle(16, FontWeight.w500, 16, 0);

  // Create a TextTheme using our custom styles
  static TextTheme textTheme = TextTheme(
    displayLarge: h1,
    displayMedium: h2,
    displaySmall: h3,
    headlineMedium: h4,
    headlineSmall: h5,
    titleLarge: h6,
    bodyLarge: p1,
    bodyMedium: p2,
    bodySmall: p3,
    labelLarge: bigLabel,
    labelMedium: smallLabel,
    labelSmall: p4,
  );
}
