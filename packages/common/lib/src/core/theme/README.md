# Theme Module

## Overview
Comprehensive theming system for Formation Métiers application. Provides consistent colors, typography, and spacing across mobile and web platforms using Material 3 design principles.

## Files

### app_colors.dart
Complete color palette with light and dark theme support.

### app_typography.dart
Typography system with Material 3 text styles and custom application styles.

### app_spacing.dart
Spacing system based on 4px grid with responsive breakpoints.

### app_theme.dart
Main theme configuration combining colors, typography, and component themes.

## Usage

### Basic Setup

```dart
// In mobile or web package main.dart
import 'package:flutter/material.dart';
import 'package:common/common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formation Métiers',
      // Light theme
      theme: AppTheme.lightTheme,
      // Dark theme
      darkTheme: AppTheme.darkTheme,
      // System theme mode
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
```

## Colors

### Using Colors

```dart
import 'package:common/common.dart';

// Primary colors
Container(
  color: AppColors.primary, // Professional blue
  child: Text(
    'Formation Métiers',
    style: TextStyle(color: AppColors.onPrimary), // White
  ),
)

// Semantic colors
Container(
  color: AppColors.success, // Green for success
  child: Icon(Icons.check, color: AppColors.onSuccess),
)

// Error handling
Container(
  color: AppColors.errorContainer,
  child: Text(
    'Error message',
    style: TextStyle(color: AppColors.onErrorContainer),
  ),
)

// Surface and background
Scaffold(
  backgroundColor: AppColors.background,
  body: Card(
    color: AppColors.surface,
    child: Text(
      'Content',
      style: TextStyle(color: AppColors.onSurface),
    ),
  ),
)
```

### Color Palette

**Primary (Professional Blue)**
- `AppColors.primary` - #0066CC
- `AppColors.primaryLight` - #3384D6
- `AppColors.primaryDark` - #004D99

**Semantic Colors**
- `AppColors.success` - Green (#28A745)
- `AppColors.error` - Red (#DC3545)
- `AppColors.warning` - Orange (#FFC107)
- `AppColors.info` - Light Blue (#17A2B8)

**Neutral Colors**
- `AppColors.background` - Main background
- `AppColors.surface` - Card/surface background
- `AppColors.textPrimary` - Main text color
- `AppColors.textSecondary` - Secondary text
- `AppColors.divider` - Divider lines

### Theme-Aware Colors

```dart
// Access theme colors from context
final theme = Theme.of(context);
final colorScheme = theme.colorScheme;

Container(
  color: colorScheme.primary, // Automatically adapts to light/dark
  child: Text(
    'Themed',
    style: TextStyle(color: colorScheme.onPrimary),
  ),
)
```

## Typography

### Text Styles

```dart
import 'package:common/common.dart';

// Display styles (largest)
Text(
  'Formation Métiers',
  style: AppTypography.displayLarge, // 57sp
)

// Headlines
Text(
  'Cours disponibles',
  style: AppTypography.headlineMedium, // 28sp
)

// Titles
Text(
  'Électricien CCQ',
  style: AppTypography.titleLarge, // 22sp
)

// Body text (main content)
Text(
  'Description du cours...',
  style: AppTypography.bodyMedium, // 14sp - default
)

// Labels (buttons, chips)
Text(
  'S\'INSCRIRE',
  style: AppTypography.labelLarge, // 14sp medium weight
)

// Custom styles
Text(
  'Course Title',
  style: AppTypography.courseTitle, // 20sp semibold
)

Text(
  '$99.99',
  style: AppTypography.price, // 20sp bold
)
```

### Customizing Text Styles

```dart
// Add color
Text(
  'Colored text',
  style: AppTypography.withColor(AppTypography.bodyLarge, AppColors.primary),
)

// Change weight
Text(
  'Bold text',
  style: AppTypography.withWeight(AppTypography.bodyMedium, AppTypography.bold),
)

// Multiple properties
Text(
  'Custom',
  style: AppTypography.customize(
    AppTypography.bodyMedium,
    color: AppColors.primary,
    fontWeight: AppTypography.semiBold,
    fontSize: 18,
  ),
)

// Using copyWith
Text(
  'Modified',
  style: AppTypography.titleMedium.copyWith(
    color: AppColors.error,
    fontWeight: FontWeight.w700,
  ),
)
```

### Theme Text Styles

```dart
// Access from theme
final textTheme = Theme.of(context).textTheme;

Text('Display', style: textTheme.displayLarge)
Text('Headline', style: textTheme.headlineMedium)
Text('Title', style: textTheme.titleLarge)
Text('Body', style: textTheme.bodyMedium)
```

## Spacing

### Basic Spacing

```dart
import 'package:common/common.dart';

// Padding
Container(
  padding: EdgeInsets.all(AppSpacing.md), // 16px
  margin: EdgeInsets.symmetric(
    horizontal: AppSpacing.lg, // 20px
    vertical: AppSpacing.sm, // 12px
  ),
)

// Spacing scale
SizedBox(height: AppSpacing.xs) // 8px
SizedBox(height: AppSpacing.sm) // 12px
SizedBox(height: AppSpacing.md) // 16px
SizedBox(height: AppSpacing.lg) // 20px
SizedBox(height: AppSpacing.xl) // 24px
SizedBox(height: AppSpacing.xxl) // 32px
```

### Border Radius

```dart
// Card with rounded corners
Container(
  decoration: BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppSpacing.cardRadius), // 12px
  ),
)

// Button
ElevatedButton(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.buttonRadius), // 8px
    ),
  ),
)

// Circular avatar
CircleAvatar(
  radius: AppSpacing.avatarMedium / 2, // 20px
)
```

### Component Sizes

```dart
// Icons
Icon(Icons.star, size: AppSpacing.iconLg) // 24px
Icon(Icons.add, size: AppSpacing.iconXl) // 32px

// Buttons
SizedBox(
  height: AppSpacing.buttonHeightMedium, // 40px
  child: ElevatedButton(...),
)

// Avatars
CircleAvatar(
  radius: AppSpacing.avatarLarge / 2, // 28px (56/2)
)

// Course cards
Container(
  height: AppSpacing.courseCardHeight, // 200px
)
```

### Responsive Breakpoints

```dart
// Check screen size
final width = MediaQuery.of(context).size.width;

if (width < AppSpacing.breakpointMobile) {
  // Mobile layout (< 600px)
  return MobileLayout();
} else if (width < AppSpacing.breakpointTablet) {
  // Tablet layout (600-900px)
  return TabletLayout();
} else {
  // Desktop layout (> 900px)
  return DesktopLayout();
}

// Responsive padding
EdgeInsets.all(
  width < AppSpacing.breakpointMobile
      ? AppSpacing.pagePadding // 16px mobile
      : AppSpacing.pagePaddingLarge, // 24px desktop
)
```

### Layout Constraints

```dart
// Max content width for readability
Center(
  child: ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: AppSpacing.maxContentWidth, // 1200px
    ),
    child: content,
  ),
)

// Form width
ConstrainedBox(
  constraints: BoxConstraints(
    maxWidth: AppSpacing.maxFormWidth, // 480px
  ),
  child: LoginForm(),
)
```

## Complete Examples

### Course Card

```dart
class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  const CourseCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSpacing.elevationLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppSpacing.cardRadius),
            ),
            child: Image.network(
              imageUrl,
              height: AppSpacing.courseThumbnailHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(AppSpacing.cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: AppTypography.courseTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: AppSpacing.xs),

                // Description
                Text(
                  description,
                  style: AppTypography.courseDescription.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: AppSpacing.md),

                // Price and button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: AppTypography.price.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: const Text('S\'INSCRIRE'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### Login Form

```dart
class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.pagePadding),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppSpacing.maxFormWidth,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            Text(
              'Connexion',
              style: AppTypography.headlineMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSpacing.xl),

            // Email field
            TextField(
              decoration: const InputDecoration(
                labelText: 'Courriel',
                hintText: 'votre@courriel.com',
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: AppSpacing.md),

            // Password field
            TextField(
              decoration: const InputDecoration(
                labelText: 'Mot de passe',
                hintText: '••••••••',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),

            const SizedBox(height: AppSpacing.xl),

            // Login button
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                minimumSize: const Size(
                  double.infinity,
                  AppSpacing.buttonHeightLarge,
                ),
              ),
              child: const Text('SE CONNECTER'),
            ),

            const SizedBox(height: AppSpacing.md),

            // Register link
            TextButton(
              onPressed: () {},
              child: const Text('Créer un compte'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Responsive Layout

```dart
class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formation Métiers'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < AppSpacing.breakpointMobile) {
            return _buildMobileLayout();
          } else if (constraints.maxWidth < AppSpacing.breakpointTablet) {
            return _buildTabletLayout();
          } else {
            return _buildDesktopLayout();
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout() {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.pagePadding),
      children: [
        // Mobile: Single column
        // ...
      ],
    );
  }

  Widget _buildTabletLayout() {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(AppSpacing.pagePaddingLarge),
      crossAxisSpacing: AppSpacing.gridSpacing,
      mainAxisSpacing: AppSpacing.gridSpacing,
      children: [
        // Tablet: 2 columns
        // ...
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppSpacing.maxContentWidth,
        ),
        child: GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.all(AppSpacing.pagePaddingLarge),
          crossAxisSpacing: AppSpacing.gridSpacingLarge,
          mainAxisSpacing: AppSpacing.gridSpacingLarge,
          children: [
            // Desktop: 3 columns, max width
            // ...
          ],
        ),
      ),
    );
  }
}
```

## Best Practices

### 1. Always Use Theme Constants
```dart
// ✅ Good - Uses theme constants
Container(
  padding: EdgeInsets.all(AppSpacing.md),
  decoration: BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
  ),
)

// ❌ Bad - Hardcoded values
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Color(0xFF0066CC),
    borderRadius: BorderRadius.circular(12),
  ),
)
```

### 2. Use Semantic Color Names
```dart
// ✅ Good - Semantic naming
Container(
  color: AppColors.success,
  child: Text('Success', style: TextStyle(color: AppColors.onSuccess)),
)

// ❌ Bad - Direct color names
Container(
  color: AppColors.green,
  child: Text('Success', style: TextStyle(color: Colors.white)),
)
```

### 3. Respect the Spacing Scale
```dart
// ✅ Good - Uses spacing scale
SizedBox(height: AppSpacing.md) // 16px
SizedBox(height: AppSpacing.xl) // 24px

// ❌ Bad - Random values
SizedBox(height: 18) // Not in scale
SizedBox(height: 23) // Not in scale
```

### 4. Use Material Theme Components
```dart
// ✅ Good - Uses theme
final theme = Theme.of(context);
Container(
  color: theme.colorScheme.primary,
  child: Text(
    'Themed',
    style: theme.textTheme.titleLarge,
  ),
)

// Also good - Direct constants
Container(
  color: AppColors.primary,
  child: Text('Direct', style: AppTypography.titleLarge),
)
```

### 5. Support Dark Mode
```dart
// ✅ Good - Theme-aware
Container(
  color: Theme.of(context).colorScheme.surface,
  child: Text(
    'Content',
    style: TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
    ),
  ),
)
```

## Customization

### Extend Colors
```dart
// In your package-specific code
class MyCustomColors {
  static const courseComplete = Color(0xFF00C853);
  static const courseInProgress = Color(0xFF2196F3);
  static const courseNotStarted = Color(0xFF9E9E9E);
}
```

### Add Custom Text Styles
```dart
// In your package-specific code
class MyCustomTypography {
  static const quizQuestion = TextStyle(
    fontFamily: AppTypography.fontFamily,
    fontSize: 18,
    height: 1.4,
    fontWeight: AppTypography.medium,
  );
}
```

## Migration from Old Theme

If migrating from hardcoded values:

1. Replace all color values with `AppColors.*`
2. Replace all spacing/padding with `AppSpacing.*`
3. Replace all TextStyles with `AppTypography.*`
4. Use `Theme.of(context)` for dynamic theming
5. Test in both light and dark modes

## Resources

- [Material 3 Design Guidelines](https://m3.material.io/)
- [Flutter Theming Guide](https://docs.flutter.dev/cookbook/design/themes)
- [Color System](https://m3.material.io/styles/color/overview)
- [Typography System](https://m3.material.io/styles/typography/overview)
