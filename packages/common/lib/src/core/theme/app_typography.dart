import 'package:flutter/material.dart';

/// Application typography system
///
/// Defines all text styles used in the application following Material 3 typography guidelines.
/// Optimized for French language content and cross-platform consistency.
class AppTypography {
  /// Private constructor to prevent instantiation
  AppTypography._();

  // ============================================================================
  // FONT FAMILIES
  // ============================================================================

  /// Primary font family
  /// Uses system fonts for optimal rendering across platforms
  static const String fontFamilyPrimary = 'Inter';

  /// Fallback font families
  static const List<String> fontFamilyFallback = [
    'SF Pro Display', // iOS
    'Roboto', // Android
    'Segoe UI', // Windows
    '-apple-system', // macOS
    'system-ui', // Generic system font
  ];

  /// Get font family with fallbacks
  static String get fontFamily => fontFamilyPrimary;

  // ============================================================================
  // FONT WEIGHTS
  // ============================================================================

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  // ============================================================================
  // DISPLAY STYLES - Largest text, for short, important text or numerals
  // ============================================================================

  /// Display Large - 57sp
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 57,
    height: 1.12, // 64px line height
    letterSpacing: -0.25,
    fontWeight: regular,
  );

  /// Display Medium - 45sp
  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 45,
    height: 1.16, // 52px line height
    letterSpacing: 0,
    fontWeight: regular,
  );

  /// Display Small - 36sp
  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 36,
    height: 1.22, // 44px line height
    letterSpacing: 0,
    fontWeight: regular,
  );

  // ============================================================================
  // HEADLINE STYLES - High-emphasis text for short, important text
  // ============================================================================

  /// Headline Large - 32sp
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 32,
    height: 1.25, // 40px line height
    letterSpacing: 0,
    fontWeight: regular,
  );

  /// Headline Medium - 28sp
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 28,
    height: 1.29, // 36px line height
    letterSpacing: 0,
    fontWeight: regular,
  );

  /// Headline Small - 24sp
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 24,
    height: 1.33, // 32px line height
    letterSpacing: 0,
    fontWeight: regular,
  );

  // ============================================================================
  // TITLE STYLES - Medium-emphasis text for shorter, medium text
  // ============================================================================

  /// Title Large - 22sp
  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 22,
    height: 1.27, // 28px line height
    letterSpacing: 0,
    fontWeight: regular,
  );

  /// Title Medium - 16sp (Medium weight)
  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 16,
    height: 1.50, // 24px line height
    letterSpacing: 0.15,
    fontWeight: medium,
  );

  /// Title Small - 14sp (Medium weight)
  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 14,
    height: 1.43, // 20px line height
    letterSpacing: 0.1,
    fontWeight: medium,
  );

  // ============================================================================
  // BODY STYLES - Main content text
  // ============================================================================

  /// Body Large - 16sp
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 16,
    height: 1.50, // 24px line height
    letterSpacing: 0.5,
    fontWeight: regular,
  );

  /// Body Medium - 14sp (default body text)
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 14,
    height: 1.43, // 20px line height
    letterSpacing: 0.25,
    fontWeight: regular,
  );

  /// Body Small - 12sp
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 12,
    height: 1.33, // 16px line height
    letterSpacing: 0.4,
    fontWeight: regular,
  );

  // ============================================================================
  // LABEL STYLES - UI elements like buttons, chips, tabs
  // ============================================================================

  /// Label Large - 14sp (Medium weight)
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 14,
    height: 1.43, // 20px line height
    letterSpacing: 0.1,
    fontWeight: medium,
  );

  /// Label Medium - 12sp (Medium weight)
  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 12,
    height: 1.33, // 16px line height
    letterSpacing: 0.5,
    fontWeight: medium,
  );

  /// Label Small - 11sp (Medium weight)
  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 11,
    height: 1.45, // 16px line height
    letterSpacing: 0.5,
    fontWeight: medium,
  );

  // ============================================================================
  // CUSTOM STYLES - Application-specific text styles
  // ============================================================================

  /// Course title style
  static const TextStyle courseTitle = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 20,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: semiBold,
  );

  /// Course description style
  static const TextStyle courseDescription = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 14,
    height: 1.5,
    letterSpacing: 0.25,
    fontWeight: regular,
  );

  /// Button text large
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 16,
    height: 1.25,
    letterSpacing: 0.5,
    fontWeight: semiBold,
  );

  /// Button text medium
  static const TextStyle buttonMedium = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 14,
    height: 1.43,
    letterSpacing: 0.4,
    fontWeight: medium,
  );

  /// Button text small
  static const TextStyle buttonSmall = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.5,
    fontWeight: medium,
  );

  /// Caption text (helper text, timestamps)
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.4,
    fontWeight: regular,
  );

  /// Overline text (categories, labels)
  static const TextStyle overline = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 10,
    height: 1.6,
    letterSpacing: 1.5,
    fontWeight: medium,
  );

  /// Input text style
  static const TextStyle inputText = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.5,
    fontWeight: regular,
  );

  /// Input label style
  static const TextStyle inputLabel = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.4,
    fontWeight: medium,
  );

  /// Input hint style
  static const TextStyle inputHint = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.5,
    fontWeight: regular,
  );

  /// Input error style
  static const TextStyle inputError = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.4,
    fontWeight: regular,
  );

  /// Card title
  static const TextStyle cardTitle = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.15,
    fontWeight: semiBold,
  );

  /// Card subtitle
  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 14,
    height: 1.43,
    letterSpacing: 0.25,
    fontWeight: regular,
  );

  /// Price text
  static const TextStyle price = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 20,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: bold,
  );

  /// Badge text
  static const TextStyle badge = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: 11,
    height: 1.45,
    letterSpacing: 0.5,
    fontWeight: semiBold,
  );

  // ============================================================================
  // TEXT THEME BUILDER
  // ============================================================================

  /// Get Material TextTheme
  static TextTheme get textTheme => const TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
      );

  // ============================================================================
  // UTILITY METHODS
  // ============================================================================

  /// Apply color to a text style
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  /// Apply font weight to a text style
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  /// Apply font size to a text style
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }

  /// Apply multiple properties to a text style
  static TextStyle customize(
    TextStyle style, {
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    double? height,
    double? letterSpacing,
  }) {
    return style.copyWith(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
