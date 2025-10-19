import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart' as common;
import '../../../common/widgets/app_navbar.dart';
import '../../../common/widgets/app_footer.dart';
import '../../../core/utils/responsive_helper.dart';
import '../widgets/lesson_list_tab.dart';
import '../widgets/quiz_list_tab.dart';

/// Page de détails d'un cours avec onglets Leçons/Quizzes
class CourseDetailPage extends StatefulWidget {
  final String courseId;

  const CourseDetailPage({
    super.key,
    required this.courseId,
  });

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Charger les leçons du cours (inclut aussi les détails du cours)
    context.read<common.CourseBloc>().add(
          common.CourseEvent.loadCourseLessons(widget.courseId),
        );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Scaffold(
      appBar: const AppNavbar(),
      body: BlocBuilder<common.CourseBloc, common.CourseState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            coursesLoaded: (courses, selectedCategory, selectedLevel, searchQuery) => const Center(
              child: CircularProgressIndicator(),
            ),
            courseDetailLoaded: (course) => const Center(
              child: CircularProgressIndicator(),
            ),
            courseLessonsLoaded: (course, lessons) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header du cours
                    _buildCourseHeader(context, course, isMobile),

                    // Onglets
                    _buildTabs(context, course),

                    // Footer
                    const AppFooter(),
                  ],
                ),
              );
            },
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: common.AppColors.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Erreur: $message',
                    style: common.AppTypography.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.go('/courses'),
                    child: const Text('Retour aux cours'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCourseHeader(
    BuildContext context,
    common.CourseEntity course,
    bool isMobile,
  ) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            common.AppColors.primary,
            common.AppColors.primary.withValues(alpha: 0.8),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.getHorizontalPadding(context),
          vertical: isMobile ? 32 : 48,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: ResponsiveHelper.getMaxContentWidth(context),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image du cours
                if (!isMobile) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: course.thumbnailUrl != null
                        ? Image.network(
                            course.thumbnailUrl!,
                            width: 300,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                _buildImagePlaceholder(),
                          )
                        : _buildImagePlaceholder(),
                  ),
                  const SizedBox(width: 32),
                ],

                // Informations du cours
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Breadcrumb
                      InkWell(
                        onTap: () => context.go('/courses'),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Retour aux cours',
                              style: common.AppTypography.bodyMedium.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Titre
                      Text(
                        course.title,
                        style: (isMobile
                                ? common.AppTypography.headlineMedium
                                : common.AppTypography.displaySmall)
                            .copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Description
                      Text(
                        course.description,
                        style: common.AppTypography.bodyLarge.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                        maxLines: isMobile ? 3 : 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 24),

                      // Métadonnées
                      Wrap(
                        spacing: 16,
                        runSpacing: 8,
                        children: [
                          _buildMetadata(
                            Icons.signal_cellular_alt,
                            course.levelDisplayName,
                          ),
                          _buildMetadata(
                            Icons.access_time,
                            course.formattedDuration,
                          ),
                          _buildMetadata(
                            Icons.category,
                            course.categoryDisplayName,
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Bouton d'inscription
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Implémenter l'inscription
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Fonctionnalité d\'inscription à venir'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: common.AppColors.primary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                        child: const Text('S\'inscrire au cours'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabs(BuildContext context, common.CourseEntity course) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // TabBar
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: ResponsiveHelper.getMaxContentWidth(context),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: common.AppColors.primary,
                unselectedLabelColor: common.AppColors.textSecondary,
                indicatorColor: common.AppColors.primary,
                tabs: const [
                  Tab(
                    icon: Icon(Icons.play_circle_outline),
                    text: 'Leçons',
                  ),
                  Tab(
                    icon: Icon(Icons.quiz_outlined),
                    text: 'Quizzes',
                  ),
                ],
              ),
            ),
          ),
        ),

        // TabBarView content - dynamically sized
        SizedBox(
          height: 600,
          child: TabBarView(
            controller: _tabController,
            children: [
              LessonListTab(courseId: course.id),
              QuizListTab(courseId: course.id),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Icon(
          Icons.school,
          size: 64,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildMetadata(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.white),
        const SizedBox(width: 6),
        Text(
          text,
          style: common.AppTypography.bodyMedium.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

}
