/// Application spacing system
///
/// Defines consistent spacing values based on an 8px (or 4px) grid system.
/// Provides padding, margin, border radius, and other spacing constants.
class AppSpacing {
  /// Private constructor to prevent instantiation
  AppSpacing._();

  // ============================================================================
  // BASE SPACING UNIT
  // ============================================================================

  /// Base spacing unit (4px)
  static const double baseUnit = 4.0;

  // ============================================================================
  // SPACING SCALE - Based on 4px increments
  // ============================================================================

  /// Extra extra small spacing - 4px
  static const double xxs = baseUnit * 1; // 4

  /// Extra small spacing - 8px
  static const double xs = baseUnit * 2; // 8

  /// Small spacing - 12px
  static const double sm = baseUnit * 3; // 12

  /// Medium spacing - 16px (most common)
  static const double md = baseUnit * 4; // 16

  /// Large spacing - 20px
  static const double lg = baseUnit * 5; // 20

  /// Extra large spacing - 24px
  static const double xl = baseUnit * 6; // 24

  /// Extra extra large spacing - 32px
  static const double xxl = baseUnit * 8; // 32

  /// Extra extra extra large spacing - 40px
  static const double xxxl = baseUnit * 10; // 40

  /// Huge spacing - 48px
  static const double huge = baseUnit * 12; // 48

  /// Massive spacing - 64px
  static const double massive = baseUnit * 16; // 64

  // ============================================================================
  // COMMON PADDING VALUES
  // ============================================================================

  /// Page padding (screen edges) - 16px
  static const double pagePadding = md;

  /// Page padding large (desktop) - 24px
  static const double pagePaddingLarge = xl;

  /// Card padding - 16px
  static const double cardPadding = md;

  /// Card padding large - 20px
  static const double cardPaddingLarge = lg;

  /// Section padding - 24px
  static const double sectionPadding = xl;

  /// Section padding large - 32px
  static const double sectionPaddingLarge = xxl;

  /// List item padding - 12px
  static const double listItemPadding = sm;

  /// Button padding horizontal - 16px
  static const double buttonPaddingHorizontal = md;

  /// Button padding vertical - 12px
  static const double buttonPaddingVertical = sm;

  /// Input padding - 16px
  static const double inputPadding = md;

  /// Input padding vertical - 12px
  static const double inputPaddingVertical = sm;

  /// Dialog padding - 24px
  static const double dialogPadding = xl;

  /// Bottom sheet padding - 16px
  static const double bottomSheetPadding = md;

  // ============================================================================
  // BORDER RADIUS
  // ============================================================================

  /// No radius
  static const double radiusNone = 0.0;

  /// Extra small radius - 4px
  static const double radiusXs = xxs;

  /// Small radius - 8px
  static const double radiusSm = xs;

  /// Medium radius - 12px (most common)
  static const double radiusMd = sm;

  /// Large radius - 16px
  static const double radiusLg = md;

  /// Extra large radius - 20px
  static const double radiusXl = lg;

  /// Extra extra large radius - 24px
  static const double radiusXxl = xl;

  /// Circular radius - 9999px (fully rounded)
  static const double radiusCircular = 9999.0;

  // ============================================================================
  // COMPONENT-SPECIFIC BORDER RADIUS
  // ============================================================================

  /// Button border radius - 8px
  static const double buttonRadius = radiusSm;

  /// Card border radius - 12px
  static const double cardRadius = radiusMd;

  /// Input border radius - 8px
  static const double inputRadius = radiusSm;

  /// Chip border radius - 16px
  static const double chipRadius = radiusLg;

  /// Badge border radius - 12px
  static const double badgeRadius = radiusMd;

  /// Dialog border radius - 20px
  static const double dialogRadius = radiusXl;

  /// Bottom sheet border radius - 20px
  static const double bottomSheetRadius = radiusXl;

  /// Avatar border radius - circular
  static const double avatarRadius = radiusCircular;

  // ============================================================================
  // ICON SIZES
  // ============================================================================

  /// Extra small icon - 12px
  static const double iconXs = 12.0;

  /// Small icon - 16px
  static const double iconSm = 16.0;

  /// Medium icon - 20px
  static const double iconMd = 20.0;

  /// Large icon - 24px
  static const double iconLg = 24.0;

  /// Extra large icon - 32px
  static const double iconXl = 32.0;

  /// Extra extra large icon - 40px
  static const double iconXxl = 40.0;

  /// Huge icon - 48px
  static const double iconHuge = 48.0;

  // ============================================================================
  // DIVIDER AND BORDER WIDTHS
  // ============================================================================

  /// Thin border - 1px
  static const double borderThin = 1.0;

  /// Medium border - 2px
  static const double borderMedium = 2.0;

  /// Thick border - 3px
  static const double borderThick = 3.0;

  /// Extra thick border - 4px
  static const double borderExtraThick = 4.0;

  /// Divider height - 1px
  static const double dividerHeight = borderThin;

  // ============================================================================
  // ELEVATION (for shadow depths)
  // ============================================================================

  /// No elevation
  static const double elevationNone = 0.0;

  /// Minimal elevation - 1dp
  static const double elevationMin = 1.0;

  /// Low elevation - 2dp
  static const double elevationLow = 2.0;

  /// Medium elevation - 4dp
  static const double elevationMedium = 4.0;

  /// High elevation - 8dp
  static const double elevationHigh = 8.0;

  /// Extra high elevation - 12dp
  static const double elevationExtraHigh = 12.0;

  /// Maximum elevation - 24dp
  static const double elevationMax = 24.0;

  // ============================================================================
  // CONTAINER CONSTRAINTS
  // ============================================================================

  /// Maximum content width for desktop (readability)
  static const double maxContentWidth = 1200.0;

  /// Maximum text width for readability - 720px
  static const double maxTextWidth = 720.0;

  /// Maximum form width - 480px
  static const double maxFormWidth = 480.0;

  /// Maximum card width - 360px
  static const double maxCardWidth = 360.0;

  /// Minimum tap target size (accessibility) - 48px
  static const double minTapTarget = 48.0;

  // ============================================================================
  // RESPONSIVE BREAKPOINTS
  // ============================================================================

  /// Mobile breakpoint (< 600px)
  static const double breakpointMobile = 600.0;

  /// Tablet breakpoint (600px - 900px)
  static const double breakpointTablet = 900.0;

  /// Desktop breakpoint (> 900px)
  static const double breakpointDesktop = 1200.0;

  /// Large desktop breakpoint (> 1200px)
  static const double breakpointLargeDesktop = 1536.0;

  // ============================================================================
  // APP BAR AND NAVIGATION
  // ============================================================================

  /// App bar height - 56px
  static const double appBarHeight = 56.0;

  /// App bar height large (desktop) - 64px
  static const double appBarHeightLarge = 64.0;

  /// Bottom navigation bar height - 56px
  static const double bottomNavBarHeight = 56.0;

  /// Tab bar height - 48px
  static const double tabBarHeight = 48.0;

  /// Drawer width - 304px
  static const double drawerWidth = 304.0;

  /// Rail width (collapsed) - 72px
  static const double railWidth = 72.0;

  /// Rail width (extended) - 256px
  static const double railWidthExtended = 256.0;

  // ============================================================================
  // BUTTONS AND INPUTS
  // ============================================================================

  /// Button height small - 32px
  static const double buttonHeightSmall = 32.0;

  /// Button height medium - 40px
  static const double buttonHeightMedium = 40.0;

  /// Button height large - 48px
  static const double buttonHeightLarge = 48.0;

  /// Input height - 48px
  static const double inputHeight = 48.0;

  /// Input height large - 56px
  static const double inputHeightLarge = 56.0;

  /// Floating action button size - 56px
  static const double fabSize = 56.0;

  /// Floating action button size small - 40px
  static const double fabSizeSmall = 40.0;

  /// Floating action button size large - 64px
  static const double fabSizeLarge = 64.0;

  // ============================================================================
  // LIST AND GRID
  // ============================================================================

  /// List item height - 56px
  static const double listItemHeight = 56.0;

  /// List item height large - 72px
  static const double listItemHeightLarge = 72.0;

  /// Grid spacing - 16px
  static const double gridSpacing = md;

  /// Grid spacing small - 8px
  static const double gridSpacingSmall = xs;

  /// Grid spacing large - 24px
  static const double gridSpacingLarge = xl;

  // ============================================================================
  // AVATARS AND IMAGES
  // ============================================================================

  /// Avatar size small - 24px
  static const double avatarSmall = 24.0;

  /// Avatar size medium - 40px
  static const double avatarMedium = 40.0;

  /// Avatar size large - 56px
  static const double avatarLarge = 56.0;

  /// Avatar size extra large - 80px
  static const double avatarXl = 80.0;

  /// Avatar size huge - 120px
  static const double avatarHuge = 120.0;

  /// Thumbnail size - 80px
  static const double thumbnailSize = 80.0;

  /// Thumbnail size small - 48px
  static const double thumbnailSmall = 48.0;

  /// Thumbnail size large - 120px
  static const double thumbnailLarge = 120.0;

  // ============================================================================
  // COURSE-SPECIFIC SIZES
  // ============================================================================

  /// Course card height - 200px
  static const double courseCardHeight = 200.0;

  /// Course card height large - 240px
  static const double courseCardHeightLarge = 240.0;

  /// Course thumbnail height - 180px
  static const double courseThumbnailHeight = 180.0;

  /// Lesson item height - 64px
  static const double lessonItemHeight = 64.0;

  /// Quiz card height - 120px
  static const double quizCardHeight = 120.0;

  // ============================================================================
  // ANIMATION DURATIONS (in milliseconds)
  // ============================================================================

  /// Fast animation - 150ms
  static const int durationFast = 150;

  /// Normal animation - 250ms
  static const int durationNormal = 250;

  /// Slow animation - 350ms
  static const int durationSlow = 350;

  /// Extra slow animation - 500ms
  static const int durationExtraSlow = 500;

  // ============================================================================
  // OPACITY VALUES
  // ============================================================================

  /// Disabled opacity - 38%
  static const double opacityDisabled = 0.38;

  /// Medium emphasis opacity - 60%
  static const double opacityMedium = 0.60;

  /// High emphasis opacity - 87%
  static const double opacityHigh = 0.87;

  /// Overlay opacity - 8%
  static const double opacityOverlay = 0.08;

  /// Hover opacity - 12%
  static const double opacityHover = 0.12;

  /// Focus opacity - 16%
  static const double opacityFocus = 0.16;
}
