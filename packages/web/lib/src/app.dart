import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:common/common.dart';

import 'core/routes/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    // Get the singleton AuthBloc instance
    _authBloc = getIt<AuthBloc>();
    // Check auth status on app start
    _authBloc.add(const AuthEvent.checkRequested());
  }

  @override
  void dispose() {
    // Don't close the AuthBloc as it's a singleton managed by GetIt
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Provide AuthBloc at the root level so it persists across routes
    return BlocProvider<AuthBloc>.value(
      value: _authBloc,
      child: MaterialApp.router(
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
      ),
    );
  }
}
