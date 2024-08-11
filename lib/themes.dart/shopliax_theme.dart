import 'package:flutter/material.dart';
import 'package:shopliax_assesement/themes.dart/colors.dart';
import 'package:shopliax_assesement/themes.dart/shopliax_typography.dart';

class ShopliaxTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      textTheme: ShopliaxTypography.textTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      inputDecorationTheme: _inputDecorationTheme,
    );
  }

  static ThemeData dark() {
    // For now, we'll just return the light theme since we are not building out a dark mode
    return light();
  }

  static const ColorScheme _lightColorScheme = ColorScheme(
    primary: ShopliaxColors.primaryColor,
    primaryContainer: ShopliaxColors.primaryLightColor,
    secondary: ShopliaxColors.secondary,
    secondaryContainer: ShopliaxColors.secondaryLight,
    surface: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: ShopliaxColors.secondary,
    onError: Colors.red,
    brightness: Brightness.light,
  );

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(double.infinity, 52),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: ShopliaxColors.primaryColor,
      foregroundColor: Colors.white,
      disabledBackgroundColor: ShopliaxColors.disabledColor,
      disabledForegroundColor: ShopliaxColors.disabledDarkColor,
      textStyle: ShopliaxTypography.smallButtonText,
    ),
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: ShopliaxColors.borderColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: ShopliaxColors.borderColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide:
          const BorderSide(color: ShopliaxColors.primaryColor, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 1),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    hintStyle:
        ShopliaxTypography.p2.copyWith(color: ShopliaxColors.borderColor),
    // prefixIconColor: BilitColors.harmoniesColor,
    suffixIconColor: ShopliaxColors.primaryColor,
  );
}
