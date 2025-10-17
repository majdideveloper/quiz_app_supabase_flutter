import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';

/// Application routes configuration using GoRouter
///
/// Defines all navigation routes for the mobile app with
/// authentication state-based redirects.
class AppRouter {
  /// Private constructor to prevent instantiation
  AppRouter._();

  // ============================================================================
  // ROUTE PATHS
  // ============================================================================

  static const String loginPath = '/login';
  static const String registerPath = '/register';
  static const String dashboardPath = '/dashboard';
  static const String coursesPath = '/courses';
  static const String courseDetailPath = '/courses/:id';
  static const String lessonPath = '/courses/:courseId/lessons/:lessonId';
  static const String quizPath = '/courses/:courseId/quizzes/:quizId';
  static const String profilePath = '/profile';

  // ============================================================================
  // ROUTER CONFIGURATION
  // ============================================================================

  /// Creates and configures the GoRouter instance
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: loginPath,
      debugLogDiagnostics: true,
      routes: [
        // ========================================================================
        // AUTH ROUTES
        // ========================================================================

        GoRoute(
          path: loginPath,
          name: 'login',
          builder: (context, state) => const LoginPage(),
        ),

        GoRoute(
          path: registerPath,
          name: 'register',
          builder: (context, state) => const RegisterPage(),
        ),

        // ========================================================================
        // DASHBOARD ROUTE
        // ========================================================================

        GoRoute(
          path: dashboardPath,
          name: 'dashboard',
          builder: (context, state) => const Placeholder(), // TODO: Create DashboardPage
        ),

        // ========================================================================
        // COURSE ROUTES
        // ========================================================================

        GoRoute(
          path: coursesPath,
          name: 'courses',
          builder: (context, state) => const Placeholder(), // TODO: Create CourseListPage
        ),

        GoRoute(
          path: courseDetailPath,
          name: 'courseDetail',
          builder: (context, state) {
            final courseId = state.pathParameters['id']!;
            return Placeholder(); // TODO: Create CourseDetailPage(courseId: courseId)
          },
        ),

        GoRoute(
          path: lessonPath,
          name: 'lesson',
          builder: (context, state) {
            final courseId = state.pathParameters['courseId']!;
            final lessonId = state.pathParameters['lessonId']!;
            return Placeholder(); // TODO: Create LessonPage(courseId: courseId, lessonId: lessonId)
          },
        ),

        GoRoute(
          path: quizPath,
          name: 'quiz',
          builder: (context, state) {
            final courseId = state.pathParameters['courseId']!;
            final quizId = state.pathParameters['quizId']!;
            return Placeholder(); // TODO: Create QuizPage(courseId: courseId, quizId: quizId)
          },
        ),

        // ========================================================================
        // PROFILE ROUTE
        // ========================================================================

        GoRoute(
          path: profilePath,
          name: 'profile',
          builder: (context, state) => const Placeholder(), // TODO: Create ProfilePage
        ),
      ],

      // Error page
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text('Error: ${state.error}'),
        ),
      ),

      // TODO: Add redirect logic based on auth state
      // redirect: (context, state) {
      //   final isLoggedIn = // Check auth state
      //   final isGoingToLogin = state.matchedLocation == loginPath || state.matchedLocation == registerPath;
      //
      //   if (!isLoggedIn && !isGoingToLogin) {
      //     return loginPath;
      //   }
      //
      //   if (isLoggedIn && isGoingToLogin) {
      //     return dashboardPath;
      //   }
      //
      //   return null;
      // },
    );
  }
}
