import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart' as common;

import '../../features/home/pages/home_page.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/auth/pages/register_page.dart';

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
                     state.matchedLocation.startsWith('/courses/'),
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
            create: (_) => common.getIt<common.AuthBloc>(),
            child: const LoginPage(),
          ),
        ),

        GoRoute(
          path: registerPath,
          name: 'register',
          builder: (context, state) => BlocProvider(
            create: (_) => common.getIt<common.AuthBloc>(),
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
