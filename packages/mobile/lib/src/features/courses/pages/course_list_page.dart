import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';

import '../bloc/course_bloc.dart';
import '../bloc/course_event.dart';
import '../bloc/course_state.dart';
import '../widgets/course_card.dart';

/// Course list page
///
/// Displays all available courses with search and filter capabilities.
/// Uses BlocBuilder to reactively update UI based on CourseState.
class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load courses on page init
    context.read<CourseBloc>().add(const CourseEvent.loadCourses());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search courses...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          context
                              .read<CourseBloc>()
                              .add(const CourseEvent.clearFilters());
                        },
                      )
                    : null,
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  context
                      .read<CourseBloc>()
                      .add(const CourseEvent.clearFilters());
                }
              },
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  context
                      .read<CourseBloc>()
                      .add(CourseEvent.searchCourses(value));
                }
              },
            ),
          ),

          // Course list
          Expanded(
            child: BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(
                    child: Text('Loading courses...'),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  coursesLoaded: (courses, category, level, query) {
                    if (courses.isEmpty) {
                      return _buildEmptyState(context);
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        context
                            .read<CourseBloc>()
                            .add(const CourseEvent.refreshCourses());
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.sm,
                        ),
                        itemCount: courses.length,
                        itemBuilder: (context, index) {
                          final course = courses[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppSpacing.md,
                            ),
                            child: CourseCard(
                              course: course,
                              onTap: () {
                                context.push('/courses/${course.id}');
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                  courseDetailLoaded: (_) => const SizedBox.shrink(),
                  courseLessonsLoaded: (_, __) => const SizedBox.shrink(),
                  error: (message) => _buildErrorState(context, message),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.school_outlined,
            size: 64,
            color: AppColors.textTertiary,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'No courses found',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Try adjusting your filters',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton(
            onPressed: () {
              _searchController.clear();
              context.read<CourseBloc>().add(const CourseEvent.clearFilters());
            },
            child: const Text('Clear Filters'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.error,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Error',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.error,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            child: Text(
              message,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton(
            onPressed: () {
              context.read<CourseBloc>().add(const CourseEvent.loadCourses());
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (bottomSheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filter Courses',
                  style: AppTypography.titleLarge,
                ),
                const SizedBox(height: AppSpacing.lg),

                // Category filter
                Text(
                  'Category',
                  style: AppTypography.titleSmall,
                ),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.sm,
                  children: CourseCategory.values.map((category) {
                    return ActionChip(
                      label: Text(_getCategoryLabel(category)),
                      onPressed: () {
                        context
                            .read<CourseBloc>()
                            .add(CourseEvent.filterByCategory(category));
                        Navigator.pop(bottomSheetContext);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: AppSpacing.lg),

                // Level filter
                Text(
                  'Level',
                  style: AppTypography.titleSmall,
                ),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.sm,
                  children: CourseLevel.values.map((level) {
                    return ActionChip(
                      label: Text(_getLevelLabel(level)),
                      onPressed: () {
                        context
                            .read<CourseBloc>()
                            .add(CourseEvent.filterByLevel(level));
                        Navigator.pop(bottomSheetContext);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: AppSpacing.lg),

                // Clear filters button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      context
                          .read<CourseBloc>()
                          .add(const CourseEvent.clearFilters());
                      Navigator.pop(bottomSheetContext);
                    },
                    child: const Text('Clear Filters'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getCategoryLabel(CourseCategory category) {
    switch (category) {
      case CourseCategory.ccq:
        return 'CCQ';
      case CourseCategory.nonConstruction:
        return 'Non-Construction';
      case CourseCategory.redSeal:
        return 'Red Seal';
    }
  }

  String _getLevelLabel(CourseLevel level) {
    switch (level) {
      case CourseLevel.beginner:
        return 'Beginner';
      case CourseLevel.intermediate:
        return 'Intermediate';
      case CourseLevel.advanced:
        return 'Advanced';
      case CourseLevel.expert:
        return 'Expert';
    }
  }
}
