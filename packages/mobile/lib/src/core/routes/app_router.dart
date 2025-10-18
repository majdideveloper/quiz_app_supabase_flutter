import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/dashboard/pages/dashboard_page.dart';
import '../../features/courses/pages/course_list_page.dart';
import '../../features/courses/pages/course_detail_page.dart';
import '../../features/courses/pages/lesson_page.dart';
import '../../features/quiz/pages/quiz_page.dart';
import '../../features/profile/pages/profile_page.dart';
import '../../features/profile/pages/edit_profile_page.dart';

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
  static const String editProfilePath = '/profile/edit';

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

        // ========================================================================
        // DASHBOARD ROUTE
        // ========================================================================

        GoRoute(
          path: dashboardPath,
          name: 'dashboard',
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<DashboardBloc>(),
            child: const DashboardPage(),
          ),
        ),

        // ========================================================================
        // COURSE ROUTES
        // ========================================================================

        GoRoute(
          path: coursesPath,
          name: 'courses',
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<CourseBloc>(),
            child: const CourseListPage(),
          ),
        ),

        GoRoute(
          path: courseDetailPath,
          name: 'courseDetail',
          builder: (context, state) {
            final courseId = state.pathParameters['id']!;
            return BlocProvider(
              create: (_) => getIt<CourseBloc>(),
              child: CourseDetailPage(courseId: courseId),
            );
          },
        ),

        GoRoute(
          path: lessonPath,
          name: 'lesson',
          builder: (context, state) {
            final courseId = state.pathParameters['courseId']!;
            final lessonId = state.pathParameters['lessonId']!;
            return BlocProvider(
              create: (_) => getIt<CourseBloc>(),
              child: LessonPage(
                courseId: courseId,
                lessonId: lessonId,
              ),
            );
          },
        ),

        GoRoute(
          path: quizPath,
          name: 'quiz',
          builder: (context, state) {
            final quizId = state.pathParameters['quizId']!;
            return BlocProvider(
              create: (_) => getIt<QuizBloc>(),
              child: QuizPage(quizId: quizId),
            );
          },
        ),

        // ========================================================================
        // PROFILE ROUTES
        // ========================================================================

        GoRoute(
          path: profilePath,
          name: 'profile',
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<ProfileBloc>(),
            child: const ProfilePage(),
          ),
        ),

        GoRoute(
          path: editProfilePath,
          name: 'editProfile',
          builder: (context, state) {
            final profile = state.extra as ProfileEntity;
            return BlocProvider.value(
              value: getIt<ProfileBloc>(),
              child: EditProfilePage(profile: profile),
            );
          },
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
