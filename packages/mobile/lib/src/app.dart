import 'package:flutter/material.dart';
import 'package:common/common.dart'; // Import theme from common

import 'core/routes/app_router.dart';

/// Root application widget for Formation Métiers mobile app
///
/// Configures MaterialApp with:
/// - Theme from common package (AppTheme)
/// - GoRouter navigation
/// - Material 3 design
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.createRouter();

    return MaterialApp.router(
      title: 'Formation Métiers',
      debugShowCheckedModeBanner: false,

      // Theme from common package - no duplication!
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // Navigation
      routerConfig: router,
    );
  }
}
