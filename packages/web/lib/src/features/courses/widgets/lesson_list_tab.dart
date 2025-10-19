import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart' as common;
import '../../../core/utils/responsive_helper.dart';

/// Onglet affichant la liste des leçons d'un cours
class LessonListTab extends StatelessWidget {
  final String courseId;

  const LessonListTab({
    super.key,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<common.CourseBloc, common.CourseState>(
      builder: (context, state) {
        return state.maybeWhen(
          courseLessonsLoaded: (course, lessons) {
            if (lessons.isEmpty) {
              return _buildEmptyState();
            }

            return _buildLessonList(context, lessons);
          },
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget _buildLessonList(BuildContext context, List<common.LessonEntity> lessons) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxContentWidth(context),
        ),
        child: ListView.separated(
          padding: EdgeInsets.all(
            ResponsiveHelper.getHorizontalPadding(context),
          ),
          itemCount: lessons.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final lesson = lessons[index];
            return _buildLessonCard(context, lesson, index + 1);
          },
        ),
      ),
    );
  }

  Widget _buildLessonCard(BuildContext context, common.LessonEntity lesson, int number) {
    return Card(
      elevation: 1,
      child: InkWell(
        onTap: () => context.go('/courses/$courseId/lessons/${lesson.id}'),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Numéro de la leçon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: common.AppColors.primaryContainer,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    '$number',
                    style: common.AppTypography.titleMedium.copyWith(
                      color: common.AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),

              // Contenu
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: common.AppTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      lesson.description,
                      style: common.AppTypography.bodyMedium.copyWith(
                        color: common.AppColors.textSecondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),

                    // Type et durée
                    Row(
                      children: [
                        _buildChip(
                          lesson.hasVideo ? Icons.play_circle_outline : Icons.article_outlined,
                          lesson.hasVideo ? 'Vidéo' : 'Texte',
                          common.AppColors.secondary,
                        ),
                        const SizedBox(width: 12),
                        _buildChip(
                          Icons.access_time,
                          lesson.formattedDuration,
                          common.AppColors.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Icône de progression
              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: common.AppTypography.bodySmall.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.video_library_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Aucune leçon disponible',
            style: common.AppTypography.titleMedium.copyWith(
              color: common.AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Les leçons seront bientôt disponibles',
            style: common.AppTypography.bodyMedium.copyWith(
              color: common.AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
