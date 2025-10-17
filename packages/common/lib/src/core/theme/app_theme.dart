import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Application theme configuration
///
/// Provides Material 3 theme data for light and dark modes with
/// custom styling for Formation Métiers branding.
class AppTheme {
  /// Private constructor to prevent instantiation
  AppTheme._();

  // ============================================================================
  // LIGHT THEME
  // ============================================================================

  /// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      // Material 3
      useMaterial3: true,

      // Color scheme
      colorScheme: AppColors.lightColorScheme,

      // Typography
      textTheme: AppTypography.textTheme,

      // Primary color
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.surface,
      cardColor: AppColors.cardBackground,
      dividerColor: AppColors.divider,
      disabledColor: AppColors.disabled,

      // App Bar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: AppSpacing.elevationLow,
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.onSurface,
        surfaceTintColor: AppColors.surfaceTint,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: AppTypography.titleLarge.copyWith(
          color: AppColors.onSurface,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.onSurface,
          size: AppSpacing.iconLg,
        ),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: AppSpacing.elevationLow,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.buttonPaddingHorizontal,
            vertical: AppSpacing.buttonPaddingVertical,
          ),
          minimumSize: const Size(64, AppSpacing.buttonHeightMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.buttonPaddingHorizontal,
            vertical: AppSpacing.buttonPaddingVertical,
          ),
          minimumSize: const Size(64, AppSpacing.buttonHeightMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.buttonPaddingHorizontal,
            vertical: AppSpacing.buttonPaddingVertical,
          ),
          minimumSize: const Size(64, AppSpacing.buttonHeightMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
          side: const BorderSide(
            color: AppColors.outline,
            width: AppSpacing.borderThin,
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.buttonPaddingHorizontal,
            vertical: AppSpacing.buttonPaddingVertical,
          ),
          minimumSize: const Size(64, AppSpacing.buttonHeightMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      // Icon Button Theme
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(
            AppSpacing.minTapTarget,
            AppSpacing.minTapTarget,
          ),
          iconSize: AppSpacing.iconLg,
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: AppSpacing.elevationMedium,
        highlightElevation: AppSpacing.elevationHigh,
        shape: CircleBorder(),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: AppSpacing.elevationLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(AppSpacing.xs),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceVariant.withValues(alpha: 0.5),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.inputPadding,
          vertical: AppSpacing.inputPaddingVertical,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.outline,
            width: AppSpacing.borderThin,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.outline,
            width: AppSpacing.borderThin,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: AppSpacing.borderMedium,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: AppSpacing.borderThin,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: AppSpacing.borderMedium,
          ),
        ),
        labelStyle: AppTypography.inputLabel,
        hintStyle: AppTypography.inputHint.copyWith(
          color: AppColors.textTertiary,
        ),
        errorStyle: AppTypography.inputError.copyWith(
          color: AppColors.error,
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceVariant,
        deleteIconColor: AppColors.onSurfaceVariant,
        disabledColor: AppColors.disabled,
        selectedColor: AppColors.primaryContainer,
        secondarySelectedColor: AppColors.secondaryContainer,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xxs,
        ),
        labelStyle: AppTypography.labelMedium,
        secondaryLabelStyle: AppTypography.labelSmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
        ),
        side: BorderSide.none,
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        elevation: AppSpacing.elevationExtraHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.dialogRadius),
        ),
        titleTextStyle: AppTypography.headlineSmall.copyWith(
          color: AppColors.onSurface,
        ),
        contentTextStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        elevation: AppSpacing.elevationExtraHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.bottomSheetRadius),
          ),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        contentTextStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.onInverseSurface,
        ),
      ),

      // List Tile Theme
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.listItemPadding,
        ),
        minLeadingWidth: AppSpacing.iconXl,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: AppSpacing.dividerHeight,
        space: 0,
      ),

      // Navigation Bar Theme (Bottom Navigation)
      navigationBarTheme: NavigationBarThemeData(
        height: AppSpacing.bottomNavBarHeight,
        elevation: AppSpacing.elevationLow,
        labelTextStyle: WidgetStateProperty.all(AppTypography.labelMedium),
        iconTheme: WidgetStateProperty.all(
          const IconThemeData(size: AppSpacing.iconLg),
        ),
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.onSurfaceVariant,
        labelStyle: AppTypography.labelLarge,
        unselectedLabelStyle: AppTypography.labelLarge,
        indicatorSize: TabBarIndicatorSize.label,
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.onPrimary;
          }
          return null;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return null;
        }),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),
    );
  }

  // ============================================================================
  // DARK THEME
  // ============================================================================

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      // Material 3
      useMaterial3: true,

      // Color scheme
      colorScheme: AppColors.darkColorScheme,

      // Typography
      textTheme: AppTypography.textTheme.apply(
        bodyColor: AppColors.textPrimaryDark,
        displayColor: AppColors.textPrimaryDark,
      ),

      // Primary color
      primaryColor: AppColors.primaryLight,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      canvasColor: AppColors.surfaceDark,
      cardColor: AppColors.cardBackgroundDark,
      dividerColor: AppColors.dividerDark,
      disabledColor: AppColors.disabledDark,

      // App Bar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: AppSpacing.elevationLow,
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.onSurfaceDark,
        surfaceTintColor: AppColors.surfaceTintDark,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: AppTypography.titleLarge.copyWith(
          color: AppColors.onSurfaceDark,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.onSurfaceDark,
          size: AppSpacing.iconLg,
        ),
      ),

      // Button Themes (same structure as light theme)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: AppSpacing.elevationLow,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.buttonPaddingHorizontal,
            vertical: AppSpacing.buttonPaddingVertical,
          ),
          minimumSize: const Size(64, AppSpacing.buttonHeightMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.buttonPaddingHorizontal,
            vertical: AppSpacing.buttonPaddingVertical,
          ),
          minimumSize: const Size(64, AppSpacing.buttonHeightMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.buttonPaddingHorizontal,
            vertical: AppSpacing.buttonPaddingVertical,
          ),
          minimumSize: const Size(64, AppSpacing.buttonHeightMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
          side: const BorderSide(
            color: AppColors.outlineDark,
            width: AppSpacing.borderThin,
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.buttonPaddingHorizontal,
            vertical: AppSpacing.buttonPaddingVertical,
          ),
          minimumSize: const Size(64, AppSpacing.buttonHeightMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      // Icon Button Theme
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(
            AppSpacing.minTapTarget,
            AppSpacing.minTapTarget,
          ),
          iconSize: AppSpacing.iconLg,
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: AppSpacing.elevationMedium,
        highlightElevation: AppSpacing.elevationHigh,
        shape: CircleBorder(),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: AppSpacing.elevationLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(AppSpacing.xs),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceVariantDark.withValues(alpha: 0.5),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.inputPadding,
          vertical: AppSpacing.inputPaddingVertical,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.outlineDark,
            width: AppSpacing.borderThin,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.outlineDark,
            width: AppSpacing.borderThin,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.primaryLight,
            width: AppSpacing.borderMedium,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.errorLight,
            width: AppSpacing.borderThin,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
          borderSide: const BorderSide(
            color: AppColors.errorLight,
            width: AppSpacing.borderMedium,
          ),
        ),
        labelStyle: AppTypography.inputLabel.copyWith(
          color: AppColors.textSecondaryDark,
        ),
        hintStyle: AppTypography.inputHint.copyWith(
          color: AppColors.textTertiaryDark,
        ),
        errorStyle: AppTypography.inputError.copyWith(
          color: AppColors.errorLight,
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceVariantDark,
        deleteIconColor: AppColors.onSurfaceVariantDark,
        disabledColor: AppColors.disabledDark,
        selectedColor: AppColors.darkColorScheme.primaryContainer,
        secondarySelectedColor: AppColors.darkColorScheme.secondaryContainer,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xxs,
        ),
        labelStyle: AppTypography.labelMedium.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        secondaryLabelStyle: AppTypography.labelSmall.copyWith(
          color: AppColors.textSecondaryDark,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
        ),
        side: BorderSide.none,
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        elevation: AppSpacing.elevationExtraHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.dialogRadius),
        ),
        titleTextStyle: AppTypography.headlineSmall.copyWith(
          color: AppColors.onSurfaceDark,
        ),
        contentTextStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.onSurfaceVariantDark,
        ),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        elevation: AppSpacing.elevationExtraHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.bottomSheetRadius),
          ),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        contentTextStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.onInverseSurfaceDark,
        ),
      ),

      // List Tile Theme
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.listItemPadding,
        ),
        minLeadingWidth: AppSpacing.iconXl,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.dividerDark,
        thickness: AppSpacing.dividerHeight,
        space: 0,
      ),

      // Navigation Bar Theme
      navigationBarTheme: NavigationBarThemeData(
        height: AppSpacing.bottomNavBarHeight,
        elevation: AppSpacing.elevationLow,
        labelTextStyle: WidgetStateProperty.all(
          AppTypography.labelMedium.copyWith(
            color: AppColors.textSecondaryDark,
          ),
        ),
        iconTheme: WidgetStateProperty.all(
          const IconThemeData(size: AppSpacing.iconLg),
        ),
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.primaryLight,
        unselectedLabelColor: AppColors.onSurfaceVariantDark,
        labelStyle: AppTypography.labelLarge,
        unselectedLabelStyle: AppTypography.labelLarge,
        indicatorSize: TabBarIndicatorSize.label,
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.darkColorScheme.onPrimary;
          }
          return null;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryLight;
          }
          return null;
        }),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryLight,
      ),
    );
  }
}
