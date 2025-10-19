import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';


/// Course detail page with tabs for lessons and quizzes
///
/// Displays comprehensive course information with two main tabs:
/// - Lessons Tab: List of all lessons in the course
/// - Quizzes Tab: List of all quizzes for the course
class CourseDetailPage extends StatelessWidget {
  final String courseId;

  const CourseDetailPage({
    super.key,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CourseBloc>()
            ..add(CourseEvent.loadCourseLessons(courseId)),
        ),
        BlocProvider(
          create: (context) => getIt<QuizBloc>()
            ..add(QuizEvent.loadCourseQuizzes(courseId)),
        ),
      ],
      child: CourseDetailView(courseId: courseId),
    );
  }
}

/// Course detail view with BLoC consumer
class CourseDetailView extends StatelessWidget {
  final String courseId;

  const CourseDetailView({
    super.key,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            coursesLoaded: (courses, category, level, query) =>
                const Center(child: Text('Invalid state for course detail')),
            courseDetailLoaded: (course) =>
                const Center(child: Text('Loading lessons...')),
            courseLessonsLoaded: (course, lessons) =>
                _buildCourseDetail(context, course, lessons),
            error: (message) => _buildErrorState(context, message),
          );
        },
      ),
    );
  }

  Widget _buildCourseDetail(
    BuildContext context,
    CourseEntity course,
    List<LessonEntity> lessons,
  ) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // App bar with course image
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  course.title,
                  style: const TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),
                background: course.thumbnailUrl != null
                    ? Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            course.thumbnailUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: AppColors.primary,
                                child: const Icon(
                                  Icons.school,
                                  size: 64,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.7),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        color: AppColors.primary,
                        child: const Icon(
                          Icons.school,
                          size: 64,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            // Course info
            SliverToBoxAdapter(
              child: _buildCourseInfo(course),
            ),
            // Tab bar
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.textSecondary,
                  indicatorColor: AppColors.primary,
                  tabs: const [
                    Tab(text: 'Lessons'),
                    Tab(text: 'Quizzes'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            _buildLessonsTab(context, course, lessons),
            _buildQuizzesTab(context, course),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseInfo(CourseEntity course) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course metadata
          Row(
            children: [
              _buildInfoChip(
                Icons.person,
                course.instructorName,
              ),
              const SizedBox(width: AppSpacing.sm),
              _buildInfoChip(
                Icons.schedule,
                '${course.duration} hours',
              ),
              const SizedBox(width: AppSpacing.sm),
              _buildInfoChip(
                Icons.people,
                '${course.enrollmentCount} students',
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          // Description
          Text(
            'About this course',
            style: AppTypography.titleMedium,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            course.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          // Category and Level
          Row(
            children: [
              Chip(
                label: Text(course.category.name),
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
              ),
              const SizedBox(width: AppSpacing.sm),
              Chip(
                label: Text(course.level.name),
                backgroundColor: _getLevelColor(course.level).withValues(alpha: 0.1),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          // Enroll button (if not enrolled)
          // TODO: Check enrollment status and show appropriate button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement enrollment
              },
              child: course.price > 0
                  ? Text('Enroll Now - \$${course.price.toStringAsFixed(2)}')
                  : const Text('Enroll for Free'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildLessonsTab(
    BuildContext context,
    CourseEntity course,
    List<LessonEntity> lessons,
  ) {
    if (lessons.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.video_library_outlined,
              size: 64,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'No lessons available yet',
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return _buildLessonCard(context, course, lesson, index);
      },
    );
  }

  Widget _buildLessonCard(
    BuildContext context,
    CourseEntity course,
    LessonEntity lesson,
    int index,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: InkWell(
        onTap: () {
          context.push('/courses/${course.id}/lessons/${lesson.id}');
        },
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              // Lesson number
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              // Lesson info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: AppTypography.titleSmall,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        Icon(
                          lesson.hasVideo ? Icons.play_circle_outline : Icons.article_outlined,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          lesson.hasVideo ? 'Video' : 'Content',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Icon(
                          Icons.schedule,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${lesson.duration} min',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Completion status
              // TODO: Show completion status based on user progress
              Icon(
                Icons.play_circle_outline,
                color: AppColors.primary,
                size: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuizzesTab(BuildContext context, CourseEntity course) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          quizzesLoaded: (quizzes) {
            if (quizzes.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.quiz_outlined,
                      size: 64,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'No quizzes available yet',
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: quizzes.length,
              itemBuilder: (context, index) {
                final quiz = quizzes[index];
                return _buildQuizCard(context, course, quiz);
              },
            );
          },
          quizLoaded: (_, __) => const Center(child: CircularProgressIndicator()),
          quizInProgress: (_, __, ___, ____, _____, ______) =>
              const Center(child: CircularProgressIndicator()),
          quizSubmitted: (_, __, ___, ____) =>
              const Center(child: CircularProgressIndicator()),
          error: (message) => Center(
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
                  message,
                  style: AppTypography.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.md),
                ElevatedButton(
                  onPressed: () {
                    context.read<QuizBloc>().add(
                          QuizEvent.loadCourseQuizzes(course.id),
                        );
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuizCard(
    BuildContext context,
    CourseEntity course,
    QuizEntity quiz,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: InkWell(
        onTap: () {
          context.push('/quizzes/${quiz.id}');
        },
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Quiz type icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _getQuizTypeColor(quiz.quizType).withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _getQuizTypeIcon(quiz.quizType),
                      color: _getQuizTypeColor(quiz.quizType),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  // Quiz info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quiz.title,
                          style: AppTypography.titleSmall,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          quiz.quizTypeDisplayName,
                          style: AppTypography.bodySmall.copyWith(
                            color: _getQuizTypeColor(quiz.quizType),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Required badge
                  if (quiz.isRequired)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.error.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Required',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              if (quiz.description.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(
                  quiz.description,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: AppSpacing.sm),
              // Quiz metadata
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.xs,
                children: [
                  _buildQuizMetaChip(
                    Icons.quiz,
                    '${quiz.questionsCount} questions',
                  ),
                  _buildQuizMetaChip(
                    Icons.percent,
                    'Pass: ${quiz.passingScore}%',
                  ),
                  if (quiz.hasTimeLimit)
                    _buildQuizMetaChip(
                      Icons.timer,
                      quiz.formattedTimeLimit,
                    ),
                  if (quiz.hasMaxAttempts)
                    _buildQuizMetaChip(
                      Icons.refresh,
                      quiz.formattedMaxAttempts,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuizMetaChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.textSecondary),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Color _getQuizTypeColor(QuizType type) {
    switch (type) {
      case QuizType.lesson:
        return AppColors.primary;
      case QuizType.midterm:
        return Colors.orange;
      case QuizType.finalExam:
        return AppColors.error;
    }
  }

  IconData _getQuizTypeIcon(QuizType type) {
    switch (type) {
      case QuizType.lesson:
        return Icons.quiz;
      case QuizType.midterm:
        return Icons.assignment;
      case QuizType.finalExam:
        return Icons.workspace_premium;
    }
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
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
            message,
            style: AppTypography.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          ElevatedButton(
            onPressed: () {
              context.read<CourseBloc>().add(
                    CourseEvent.loadCourseLessons(courseId),
                  );
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Color _getLevelColor(CourseLevel level) {
    switch (level) {
      case CourseLevel.beginner:
        return Colors.green;
      case CourseLevel.intermediate:
        return Colors.orange;
      case CourseLevel.advanced:
      case CourseLevel.expert:
        return Colors.red;

    }
  }
}

/// Delegate for the persistent tab bar
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverTabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
