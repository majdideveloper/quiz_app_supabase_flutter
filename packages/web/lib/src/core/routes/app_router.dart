import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart' as common;

import '../../features/home/pages/home_page.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/auth/pages/register_page.dart';
import '../../features/courses/pages/course_list_page.dart';
import '../../features/courses/pages/course_detail_page.dart';
import '../../features/courses/pages/lesson_page.dart';
import '../../features/dashboard/pages/student_dashboard_page.dart';
import '../../features/admin/pages/admin_dashboard_page.dart';
import '../../features/admin/pages/user_management_page.dart';
import '../../features/admin/pages/course_management_page.dart';
import '../../features/admin/pages/quiz_management_page.dart';

/// Helper class to refresh GoRouter when auth state changes
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

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
    final authBloc = common.getIt<common.AuthBloc>();

    return GoRouter(
      initialLocation: homePath,
      debugLogDiagnostics: true,
      refreshListenable: GoRouterRefreshStream(authBloc.stream),

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

        // Check auth state from BLoC
        final authState = authBloc.state;

        final isLoggedIn = authState.maybeWhen(
          authenticated: (_) => true,
          orElse: () => false,
        );

        // Redirect logged-in users from home to dashboard
        if (isLoggedIn && state.matchedLocation == homePath) {
          return dashboardPath;
        }

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
          builder: (context, state) => const LoginPage(),
        ),

        GoRoute(
          path: registerPath,
          name: 'register',
          builder: (context, state) => const RegisterPage(),
        ),

        // Courses routes
        GoRoute(
          path: coursesPath,
          name: 'courses',
          builder: (context, state) => BlocProvider(
            create: (_) => common.getIt<common.CourseBloc>(),
            child: const CourseListPage(),
          ),
        ),

        GoRoute(
          path: courseDetailPath,
          name: 'course-detail',
          builder: (context, state) {
            final courseId = state.pathParameters['id']!;
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => common.getIt<common.CourseBloc>()),
                BlocProvider(create: (_) => common.getIt<common.QuizBloc>()),
              ],
              child: CourseDetailPage(courseId: courseId),
            );
          },
        ),

        GoRoute(
          path: '/courses/:courseId/lessons/:lessonId',
          name: 'lesson',
          builder: (context, state) {
            final courseId = state.pathParameters['courseId']!;
            final lessonId = state.pathParameters['lessonId']!;
            return LessonPage(
              courseId: courseId,
              lessonId: lessonId,
            );
          },
        ),

        // ========================================================================
        // PROTECTED ROUTES (Student Dashboard)
        // ========================================================================

        GoRoute(
          path: dashboardPath,
          name: 'dashboard',
          builder: (context, state) => BlocProvider(
            create: (_) => common.getIt<common.CourseBloc>(),
            child: const StudentDashboardPage(),
          ),
        ),

        // ========================================================================
        // ADMIN ROUTES
        // ========================================================================

        GoRoute(
          path: '/admin',
          name: 'admin',
          builder: (context, state) => BlocProvider(
            create: (_) => common.getIt<common.AdminBloc>(),
            child: const AdminDashboardPage(),
          ),
        ),

        GoRoute(
          path: '/admin/users',
          name: 'admin-users',
          builder: (context, state) => const UserManagementPage(),
        ),

        GoRoute(
          path: '/admin/courses',
          name: 'admin-courses',
          builder: (context, state) => const CourseManagementPage(),
        ),

        GoRoute(
          path: '/admin/quizzes',
          name: 'admin-quizzes',
          builder: (context, state) => const QuizManagementPage(),
        ),

        // ========================================================================
        // PROTECTED ROUTES (TODO: Dashboard, Profile, etc.)
        // ========================================================================
      ],

      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text('Error: ${state.error}'),
        ),
      ),
    );
  }
}
