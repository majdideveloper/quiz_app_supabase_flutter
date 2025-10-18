import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';

import '../widgets/progress_card.dart';
import '../widgets/enrolled_courses_list.dart';

/// Dashboard page
///
/// Main landing page after login showing:
/// - User statistics and progress
/// - Enrolled courses
/// - Recent activity
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DashboardBloc>()
        ..add(const DashboardEvent.loadDashboard()),
      child: const DashboardView(),
    );
  }
}

/// Dashboard view with BLoC consumer
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/profile');
            },
            icon: const Icon(Icons.account_circle),
            tooltip: 'Profile',
          ),
        ],
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (profile, enrollments, totalCourses, completedCourses, totalPoints) {
              return _buildDashboard(
                context,
                profile,
                enrollments,
                totalCourses,
                completedCourses,
                totalPoints,
              );
            },
            error: (message) => _buildErrorState(context, message),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/courses');
        },
        icon: const Icon(Icons.search),
        label: const Text('Browse Courses'),
      ),
    );
  }

  Widget _buildDashboard(
    BuildContext context,
    ProfileEntity profile,
    List<EnrollmentEntity> enrollments,
    int totalCourses,
    int completedCourses,
    int totalPoints,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<DashboardBloc>().add(
              const DashboardEvent.refreshDashboard(),
            );
        // Wait a bit for the refresh to complete
        await Future.delayed(const Duration(seconds: 1));
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome message
            Text(
              'Welcome back,',
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              profile.fullName,
              style: AppTypography.headlineLarge,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Progress card
            ProgressCard(
              totalCourses: totalCourses,
              completedCourses: completedCourses,
              totalPoints: totalPoints,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Enrolled courses list
            EnrolledCoursesList(
              enrollments: enrollments,
              onViewAll: () {
                context.push('/courses');
              },
            ),

            // Quick actions
            if (totalCourses == 0) ...[
              const SizedBox(height: AppSpacing.lg),
              _buildQuickActions(context),
            ],

            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get Started',
          style: AppTypography.titleLarge,
        ),
        const SizedBox(height: AppSpacing.md),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                _buildQuickActionTile(
                  icon: Icons.explore,
                  title: 'Explore Courses',
                  subtitle: 'Discover new learning opportunities',
                  onTap: () {
                    context.push('/courses');
                  },
                ),
                const Divider(),
                _buildQuickActionTile(
                  icon: Icons.person,
                  title: 'Complete Profile',
                  subtitle: 'Add more information to your profile',
                  onTap: () {
                    context.push('/profile');
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColors.primary,
        ),
      ),
      title: Text(
        title,
        style: AppTypography.titleMedium,
      ),
      subtitle: Text(
        subtitle,
        style: AppTypography.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Failed to load dashboard',
              style: AppTypography.titleLarge,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: () {
                context.read<DashboardBloc>().add(
                      const DashboardEvent.loadDashboard(),
                    );
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
