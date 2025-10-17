import 'package:flutter/material.dart';

/// Application color palette
///
/// Defines all colors used in the application with support for light and dark themes.
/// Based on Material 3 color system with Quebec/Canadian professional branding.
class AppColors {
  /// Private constructor to prevent instantiation
  AppColors._();

  // ============================================================================
  // PRIMARY COLORS - Blue (Professional, Trust, Quebec branding)
  // ============================================================================

  /// Primary brand color - Professional blue
  static const Color primary = Color(0xFF0066CC);
  static const Color primaryLight = Color(0xFF3384D6);
  static const Color primaryDark = Color(0xFF004D99);

  /// Color to use on top of primary color
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Primary container color
  static const Color primaryContainer = Color(0xFFD9E7F7);
  static const Color onPrimaryContainer = Color(0xFF001B3D);

  // ============================================================================
  // SECONDARY COLORS - Complementary accent
  // ============================================================================

  /// Secondary brand color - Warm accent
  static const Color secondary = Color(0xFF5A6A7D);
  static const Color secondaryLight = Color(0xFF7B8A9D);
  static const Color secondaryDark = Color(0xFF3F4D5E);

  /// Color to use on top of secondary color
  static const Color onSecondary = Color(0xFFFFFFFF);

  /// Secondary container color
  static const Color secondaryContainer = Color(0xFFDEE3EB);
  static const Color onSecondaryContainer = Color(0xFF17202B);

  // ============================================================================
  // TERTIARY COLORS - Additional accent
  // ============================================================================

  /// Tertiary color for additional variety
  static const Color tertiary = Color(0xFF6D5C9C);
  static const Color tertiaryLight = Color(0xFF8B7BB3);
  static const Color tertiaryDark = Color(0xFF574975);

  /// Color to use on top of tertiary color
  static const Color onTertiary = Color(0xFFFFFFFF);

  /// Tertiary container color
  static const Color tertiaryContainer = Color(0xFFE9E0F5);
  static const Color onTertiaryContainer = Color(0xFF281845);

  // ============================================================================
  // SEMANTIC COLORS - Status and feedback
  // ============================================================================

  /// Error color - Red for errors and destructive actions
  static const Color error = Color(0xFFDC3545);
  static const Color errorLight = Color(0xFFE45866);
  static const Color errorDark = Color(0xFFC82333);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFCE4E6);
  static const Color onErrorContainer = Color(0xFF410002);

  /// Success color - Green for success states
  static const Color success = Color(0xFF28A745);
  static const Color successLight = Color(0xFF4FB865);
  static const Color successDark = Color(0xFF218838);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color successContainer = Color(0xFFD4EDDA);
  static const Color onSuccessContainer = Color(0xFF00210A);

  /// Warning color - Orange for warnings
  static const Color warning = Color(0xFFFFC107);
  static const Color warningLight = Color(0xFFFFCD38);
  static const Color warningDark = Color(0xFFFFB300);
  static const Color onWarning = Color(0xFF000000);
  static const Color warningContainer = Color(0xFFFFF3CD);
  static const Color onWarningContainer = Color(0xFF332400);

  /// Info color - Light blue for informational messages
  static const Color info = Color(0xFF17A2B8);
  static const Color infoLight = Color(0xFF45B5C6);
  static const Color infoDark = Color(0xFF138496);
  static const Color onInfo = Color(0xFFFFFFFF);
  static const Color infoContainer = Color(0xFFD1ECF1);
  static const Color onInfoContainer = Color(0xFF002832);

  // ============================================================================
  // NEUTRAL COLORS - Backgrounds, surfaces, and greys
  // ============================================================================

  /// Background colors
  static const Color background = Color(0xFFFCFCFF);
  static const Color backgroundDark = Color(0xFF1A1C1E);
  static const Color onBackground = Color(0xFF1A1C1E);
  static const Color onBackgroundDark = Color(0xFFE2E2E5);

  /// Surface colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1A1C1E);
  static const Color onSurface = Color(0xFF1A1C1E);
  static const Color onSurfaceDark = Color(0xFFE2E2E5);

  /// Surface variant
  static const Color surfaceVariant = Color(0xFFE1E2EC);
  static const Color surfaceVariantDark = Color(0xFF44474F);
  static const Color onSurfaceVariant = Color(0xFF44474F);
  static const Color onSurfaceVariantDark = Color(0xFFC5C6D0);

  /// Surface tint
  static const Color surfaceTint = primary;
  static const Color surfaceTintDark = primaryLight;

  // ============================================================================
  // OUTLINE COLORS - Borders and dividers
  // ============================================================================

  /// Outline color for borders
  static const Color outline = Color(0xFF75767F);
  static const Color outlineDark = Color(0xFF8F9099);

  /// Outline variant for subtle borders
  static const Color outlineVariant = Color(0xFFC5C6D0);
  static const Color outlineVariantDark = Color(0xFF44474F);

  // ============================================================================
  // SHADOW AND OVERLAY
  // ============================================================================

  /// Shadow color
  static const Color shadow = Color(0xFF000000);

  /// Scrim color for overlays
  static const Color scrim = Color(0xFF000000);

  /// Inverse colors
  static const Color inverseSurface = Color(0xFF2F3033);
  static const Color inverseSurfaceDark = Color(0xFFE2E2E5);
  static const Color onInverseSurface = Color(0xFFF1F0F4);
  static const Color onInverseSurfaceDark = Color(0xFF1A1C1E);
  static const Color inversePrimary = Color(0xFFACC7FF);
  static const Color inversePrimaryDark = Color(0xFF0066CC);

  // ============================================================================
  // TEXT COLORS
  // ============================================================================

  /// Text colors for light theme
  static const Color textPrimary = Color(0xFF1A1C1E);
  static const Color textSecondary = Color(0xFF44474F);
  static const Color textTertiary = Color(0xFF75767F);
  static const Color textDisabled = Color(0xFFC5C6D0);

  /// Text colors for dark theme
  static const Color textPrimaryDark = Color(0xFFE2E2E5);
  static const Color textSecondaryDark = Color(0xFFC5C6D0);
  static const Color textTertiaryDark = Color(0xFF8F9099);
  static const Color textDisabledDark = Color(0xFF44474F);

  // ============================================================================
  // SPECIAL PURPOSE COLORS
  // ============================================================================

  /// Transparent color
  static const Color transparent = Colors.transparent;

  /// White
  static const Color white = Color(0xFFFFFFFF);

  /// Black
  static const Color black = Color(0xFF000000);

  /// Divider color
  static const Color divider = Color(0xFFE0E0E0);
  static const Color dividerDark = Color(0xFF2C2C2C);

  /// Card background
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardBackgroundDark = Color(0xFF242629);

  /// Disabled color
  static const Color disabled = Color(0xFFBDBDBD);
  static const Color disabledDark = Color(0xFF424242);

  // ============================================================================
  // MATERIAL 3 COLOR SCHEME BUILDERS
  // ============================================================================

  /// Light theme color scheme
  static ColorScheme get lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        surface: surface,
        onSurface: onSurface,
        surfaceContainerHighest: surfaceVariant,
        onSurfaceVariant: onSurfaceVariant,
        outline: outline,
        outlineVariant: outlineVariant,
        shadow: shadow,
        scrim: scrim,
        inverseSurface: inverseSurface,
        onInverseSurface: onInverseSurface,
        inversePrimary: inversePrimary,
        surfaceTint: surfaceTint,
      );

  /// Dark theme color scheme
  static ColorScheme get darkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: primaryLight,
        onPrimary: Color(0xFF00315A),
        primaryContainer: Color(0xFF004880),
        onPrimaryContainer: Color(0xFFD9E7F7),
        secondary: secondaryLight,
        onSecondary: Color(0xFF283542),
        secondaryContainer: Color(0xFF3F4D5E),
        onSecondaryContainer: onSecondaryContainer,
        tertiary: tertiaryLight,
        onTertiary: Color(0xFF3E2E5E),
        tertiaryContainer: Color(0xFF574975),
        onTertiaryContainer: onTertiaryContainer,
        error: errorLight,
        onError: Color(0xFF690005),
        errorContainer: Color(0xFF93000A),
        onErrorContainer: errorContainer,
        surface: surfaceDark,
        onSurface: onSurfaceDark,
        surfaceContainerHighest: surfaceVariantDark,
        onSurfaceVariant: onSurfaceVariantDark,
        outline: outlineDark,
        outlineVariant: outlineVariantDark,
        shadow: shadow,
        scrim: scrim,
        inverseSurface: inverseSurfaceDark,
        onInverseSurface: onInverseSurfaceDark,
        inversePrimary: inversePrimaryDark,
        surfaceTint: surfaceTintDark,
      );
}
