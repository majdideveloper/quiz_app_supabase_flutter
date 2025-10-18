# Phase 11 Implementation Guide: Web Package - Public Landing Page & Auth UI

**Status**: ✅ COMPLETED
**Actual Time**: ~3 hours
**Files Created**: 17 new files + 3 modified
**Current State**: Web package fully implemented with public landing page and auth UI

---

## Prerequisites

✅ Web package already has:
- `pubspec.yaml` with all dependencies configured
- Basic `main.dart` placeholder
- `responsive_framework`, `go_router`, `flutter_bloc` dependencies

✅ Common package has:
- All BLoCs (Auth, Course, Dashboard, Quiz, Profile)
- All use cases and repositories
- Shared theme (AppColors, AppTypography, AppSpacing)

---

## Implementation Checklist

### Phase 11.1: Core Setup (30 min) ✅

- ✅ **Task 1.1**: Update pubspec.yaml to add `url_strategy` package
- ✅ **Task 1.2**: Create `lib/src/app.dart` - Main app widget
- ✅ **Task 1.3**: Create `lib/src/core/routes/app_router.dart` - Router with public/protected routes
- ✅ **Task 1.4**: Remove DI container (use common package directly)
- ✅ **Task 1.5**: Create `lib/src/core/utils/responsive_helper.dart` - Responsive utilities
- ✅ **Task 1.6**: Update `main.dart` to use proper setup
- ✅ **Task 1.7**: Run `flutter pub get` in web package

### Phase 11.2: Common Widgets (30 min) ✅

- ✅ **Task 2.1**: Create `lib/src/common/widgets/app_navbar.dart` - Navigation bar
- ✅ **Task 2.2**: Create `lib/src/common/widgets/app_footer.dart` - Footer
- ⬜ **Task 2.3**: (Skipped) Create `lib/src/common/widgets/responsive_layout.dart` - Not needed

### Phase 11.3: Home/Landing Page (45 min) ✅

- ✅ **Task 3.1**: Create `lib/src/features/home/pages/home_page.dart` - Main landing page
- ✅ **Task 3.2**: Create `lib/src/features/home/widgets/hero_section.dart` - Hero banner
- ✅ **Task 3.3**: Create `lib/src/features/home/widgets/features_section.dart` - Features grid
- ✅ **Task 3.4**: Create `lib/src/features/home/widgets/course_preview_section.dart` - Course cards
- ✅ **Task 3.5**: Create `lib/src/features/home/widgets/testimonials_section.dart` - Testimonials
- ✅ **Task 3.6**: Create `lib/src/features/home/widgets/feature_card.dart` - Individual feature card
- ✅ **Task 3.7**: Create `lib/src/features/home/widgets/testimonial_card.dart` - Individual testimonial

### Phase 11.4: Auth Pages (30 min) ✅

- ✅ **Task 4.1**: Create `lib/src/features/auth/widgets/auth_form_field.dart` - Styled form field
- ✅ **Task 4.2**: Create `lib/src/features/auth/widgets/auth_button.dart` - Primary button
- ✅ **Task 4.3**: Create `lib/src/features/auth/pages/login_page.dart` - Login page
- ✅ **Task 4.4**: Create `lib/src/features/auth/pages/register_page.dart` - Register page

### Phase 11.5: Testing & Polish (15 min) ✅

- ✅ **Task 5.1**: Run `flutter analyze` and fix all errors
- ✅ **Task 5.2**: Test web app: `flutter run -d chrome`
- ✅ **Task 5.3**: Test navigation between all pages
- ✅ **Task 5.4**: Test responsive breakpoints (mobile, tablet, desktop)
- ✅ **Task 5.5**: Commit all changes to feature branch

### Phase 11.6: Bug Fixes & Polish ✅

- ✅ **Task 6.1**: Fix package name conflict (renamed to web_app)
- ✅ **Task 6.2**: Fix .env file asset loading for Flutter web
- ✅ **Task 6.3**: Fix Platform.isIOS web compatibility in EnvConfig
- ✅ **Task 6.4**: Create assets directory and copy .env.develop
- ✅ **Task 6.5**: Update common package for web platform support

---

## Detailed Implementation Steps

## Step 1: Update Dependencies

### File: `packages/web/pubspec.yaml`

Add to dependencies:
```yaml
  # URL Strategy (for clean URLs without #)
  url_strategy: ^0.2.0
```

Run:
```bash
cd packages/web
flutter pub get
```

---

## Step 2: Create App Widget

### File: `packages/web/lib/src/app.dart`

```dart
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:common/common.dart';

import 'core/routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Formation Métiers',
      debugShowCheckedModeBanner: false,

      // Use theme from common package
      theme: AppTheme.lightTheme,

      // Router configuration
      routerConfig: AppRouter.createRouter(),

      // Responsive framework
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 600, name: MOBILE),
          const Breakpoint(start: 601, end: 1024, name: TABLET),
          const Breakpoint(start: 1025, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
```

---

## Step 3: Create Responsive Helper

### File: `packages/web/lib/src/core/utils/responsive_helper.dart`

```dart
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
```

---

## Step 4: Create App Router

### File: `packages/web/lib/src/core/routes/app_router.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/auth/pages/register_page.dart';
// import '../di/injection_container.dart';

class AppRouter {
  AppRouter._();

  // Route paths
  static const String homePath = '/';
  static const String loginPath = '/login';
  static const String registerPath = '/register';
  static const String coursesPath = '/courses';
  static const String courseDetailPath = '/courses/:id';
  static const String dashboardPath = '/dashboard';
  static const String profilePath = '/profile';

  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: homePath,
      debugLogDiagnostics: true,

      // Redirect logic for auth
      redirect: (context, state) {
        final publicRoutes = [
          homePath,
          loginPath,
          registerPath,
          coursesPath,
        ];

        final isPublicRoute = publicRoutes.any(
          (route) => state.matchedLocation == route ||
                     state.matchedLocation.startsWith('/courses/')
        );

        // TODO: Implement proper auth check
        final isLoggedIn = false; // Replace with actual auth check

        // Redirect to login if accessing protected route while not logged in
        if (!isLoggedIn && !isPublicRoute) {
          return loginPath;
        }

        // Redirect to dashboard if logged in user tries to access auth pages
        if (isLoggedIn &&
            (state.matchedLocation == loginPath ||
             state.matchedLocation == registerPath)) {
          return dashboardPath;
        }

        return null; // No redirect
      },

      routes: [
        // ========================================================================
        // PUBLIC ROUTES
        // ========================================================================

        GoRoute(
          path: homePath,
          name: 'home',
          builder: (context, state) => const HomePage(),
        ),

        GoRoute(
          path: loginPath,
          name: 'login',
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<AuthBloc>(),
            child: const LoginPage(),
          ),
        ),

        GoRoute(
          path: registerPath,
          name: 'register',
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<AuthBloc>(),
            child: const RegisterPage(),
          ),
        ),

        // Courses routes will be added later

        // ========================================================================
        // PROTECTED ROUTES (TODO: Add after home/auth pages work)
        // ========================================================================

        // Dashboard, Profile, etc.
      ],

      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text('Error: ${state.error}'),
        ),
      ),
    );
  }
}
```

---

## Step 5: Create DI Container

### File: `packages/web/lib/src/core/di/injection_container.dart`

```dart
import 'package:get_it/get_it.dart';
import 'package:common/common.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Initialize Supabase
  await Supabase.initialize(
    url: EnvConfig.supabaseUrl,
    anonKey: EnvConfig.supabaseAnonKey,
  );

  // Register Supabase client
  getIt.registerLazySingleton<SupabaseClient>(
    () => Supabase.instance.client,
  );

  // Initialize common package dependencies (BLoCs, use cases, repositories)
  getIt.init();
}
```

---

## Step 6: Update Main.dart

### File: `packages/web/lib/main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/app.dart';
import 'src/core/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Use path URL strategy (removes # from URLs)
  setPathUrlStrategy();

  // Load environment variables
  await dotenv.load(fileName: '.env.develop');

  // Initialize dependencies
  await initializeDependencies();

  runApp(const App());
}
```

---

## Step 7: Create App Navbar

### File: `packages/web/lib/src/common/widgets/app_navbar.dart`

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';

import '../../core/utils/responsive_helper.dart';

class AppNavbar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      title: Row(
        children: [
          // Logo/Brand
          Text(
            'Formation Métiers',
            style: AppTypography.headlineSmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (!isMobile) ...[
            const SizedBox(width: 48),
            // Navigation links
            TextButton(
              onPressed: () => context.go('/'),
              child: const Text('Home'),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: () => context.go('/courses'),
              child: const Text('Courses'),
            ),
          ],
        ],
      ),
      actions: [
        if (!isMobile) ...[
          // Login button
          OutlinedButton(
            onPressed: () => context.go('/login'),
            child: const Text('Login'),
          ),
          const SizedBox(width: 16),
          // Register button
          ElevatedButton(
            onPressed: () => context.go('/register'),
            child: const Text('Get Started'),
          ),
          const SizedBox(width: 24),
        ] else [
          // Mobile menu
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // TODO: Show mobile drawer
            },
          ),
        ],
      ],
    );
  }
}
```

---

## Step 8: Create App Footer

### File: `packages/web/lib/src/common/widgets/app_footer.dart`

```dart
import 'package:flutter/material.dart';
import 'package:common/common.dart';

import '../../core/utils/responsive_helper.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      color: AppColors.surfaceVariant,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context),
        vertical: isMobile ? 32 : 48,
      ),
      child: Column(
        children: [
          if (isMobile)
            _buildMobileFooter(context)
          else
            _buildDesktopFooter(context),

          const Divider(height: 48),

          // Copyright
          Text(
            '© 2024 Formation Métiers. All rights reserved.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Column 1: About
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Formation Métiers',
                style: AppTypography.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Quick and effective exam preparation for electricians.',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),

        // Column 2: Links
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quick Links',
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildFooterLink('Home'),
              _buildFooterLink('Courses'),
              _buildFooterLink('About'),
              _buildFooterLink('Contact'),
            ],
          ),
        ),

        // Column 3: Legal
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Legal',
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildFooterLink('Privacy Policy'),
              _buildFooterLink('Terms of Service'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      children: [
        Text(
          'Formation Métiers',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            _buildFooterLink('Home'),
            _buildFooterLink('Courses'),
            _buildFooterLink('Privacy'),
            _buildFooterLink('Terms'),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return TextButton(
      onPressed: () {
        // TODO: Navigate to respective pages
      },
      child: Text(text),
    );
  }
}
```

---

## Step 9: Create Home Page

### File: `packages/web/lib/src/features/home/pages/home_page.dart`

```dart
import 'package:flutter/material.dart';

import '../../../common/widgets/app_navbar.dart';
import '../../../common/widgets/app_footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/features_section.dart';
import '../widgets/course_preview_section.dart';
import '../widgets/testimonials_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavbar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            FeaturesSection(),
            CoursePreviewSection(),
            TestimonialsSection(),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
```

---

## Step 10: Create Hero Section

### File: `packages/web/lib/src/features/home/widgets/hero_section.dart`

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';

import '../../../core/utils/responsive_helper.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.8),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context),
        vertical: isMobile ? 60 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveHelper.getMaxContentWidth(context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Formation Métiers',
                style: (isMobile
                    ? AppTypography.displaySmall
                    : AppTypography.displayLarge
                ).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                'Quick and Effective Exam Preparation for Electricians',
                style: (isMobile
                    ? AppTypography.titleMedium
                    : AppTypography.headlineSmall
                ).copyWith(
                  color: Colors.white.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              if (isMobile)
                Column(
                  children: [
                    _buildPrimaryButton(context, 'Get Started', '/register'),
                    const SizedBox(height: 16),
                    _buildSecondaryButton(context, 'Browse Courses', '/courses'),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPrimaryButton(context, 'Get Started', '/register'),
                    const SizedBox(width: 16),
                    _buildSecondaryButton(context, 'Browse Courses', '/courses'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context, String text, String route) {
    return ElevatedButton(
      onPressed: () => context.go(route),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
        textStyle: AppTypography.titleMedium.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildSecondaryButton(BuildContext context, String text, String route) {
    return OutlinedButton(
      onPressed: () => context.go(route),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
        textStyle: AppTypography.titleMedium.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text),
    );
  }
}
```

---

## Steps 11-15: Additional Widgets

Due to length constraints, here are the key patterns for the remaining widgets:

### Features Section Pattern:
- Use GridView with responsive columns
- Create FeatureCard widget with icon, title, description
- Features: "Expert-Designed Courses", "Interactive Quizzes", "Track Progress", "Flexible Learning"

### Course Preview Section Pattern:
- Use BlocProvider with CourseBloc
- Horizontal scrollable ListView of course cards
- Show 3-4 courses on desktop, 1-2 on mobile
- "View All Courses" button at the end

### Testimonials Section Pattern:
- Static hardcoded testimonials for now
- Use TestimonialCard widget with avatar, name, rating, quote
- Grid or carousel layout

### Auth Pages Pattern:
- Centered card layout (max width 400px)
- Reuse AuthBloc from common package
- Form fields with validation
- Navigate between login/register

---

## Testing Commands

```bash
# Navigate to web package
cd packages/web

# Get dependencies
flutter pub get

# Run web app
flutter run -d chrome

# Run with specific port
flutter run -d chrome --web-port=8080

# Build for production
flutter build web

# Analyze code
flutter analyze
```

---

## Common Issues & Solutions

### Issue 1: "Can't find common package"
**Solution**: Run `flutter pub get` in both common and web packages

### Issue 2: "Supabase not initialized"
**Solution**: Make sure .env.develop exists in root with SUPABASE_URL and SUPABASE_ANON_KEY

### Issue 3: "BLoC not found in GetIt"
**Solution**: Ensure `getIt.init()` is called in injection_container.dart

### Issue 4: "Responsive breakpoints not working"
**Solution**: Wrap MaterialApp.router with ResponsiveBreakpoints.builder

---

## Commit Strategy

Create commits for each major milestone:

1. "Set up web package structure and routing"
2. "Implement home page with hero and features sections"
3. "Add course preview and testimonials sections"
4. "Implement web auth pages (login/register)"
5. "Add responsive navbar and footer"
6. "Final polish and testing for Phase 11"

---

## Next Session Quick Start

```bash
# 1. Navigate to project
cd /path/to/quiz_app_supabase_flutter

# 2. Checkout develop or create new feature branch
git checkout develop
git checkout -b feature/web-landing-page

# 3. Follow this guide step by step
# Start with Step 1 and work through each task

# 4. Test frequently
cd packages/web
flutter run -d chrome

# 5. Commit when complete
git add .
git commit -m "Implement Phase 11: Web landing page and auth UI"
git push origin feature/web-landing-page
```

---

## Summary

**Total Files to Create**: ~25-30
**Estimated Time**: 2-3 hours
**Key Focus**: Public landing page, responsive design, auth pages
**Dependencies**: All BLoCs from common package

**Order of Implementation**:
1. Core setup (router, DI, utils) ✅ Critical
2. Common widgets (navbar, footer) ✅ Important
3. Home page sections ✅ Core feature
4. Auth pages ✅ Required
5. Testing & polish ✅ Final step

Good luck with Phase 11! 🚀
