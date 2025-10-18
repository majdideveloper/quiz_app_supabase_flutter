import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile;
  }

  static bool isTablet(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isTablet;
  }

  static bool isDesktop(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isDesktop;
  }

  static bool isMobileOrTablet(BuildContext context) {
    return isMobile(context) || isTablet(context);
  }

  /// Get responsive padding
  static double getHorizontalPadding(BuildContext context) {
    if (isMobile(context)) return 16.0;
    if (isTablet(context)) return 32.0;
    return 64.0;
  }

  /// Get max content width for centered layouts
  static double getMaxContentWidth(BuildContext context) {
    if (isMobile(context)) return double.infinity;
    if (isTablet(context)) return 900.0;
    return 1200.0;
  }

  /// Get number of columns for grid
  static int getGridColumns(BuildContext context) {
    if (isMobile(context)) return 1;
    if (isTablet(context)) return 2;
    return 3;
  }
}
