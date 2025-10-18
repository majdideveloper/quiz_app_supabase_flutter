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
