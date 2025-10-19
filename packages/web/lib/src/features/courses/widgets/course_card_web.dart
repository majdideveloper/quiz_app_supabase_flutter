import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart' as common;

/// Card de cours pour l'interface web
class CourseCardWeb extends StatelessWidget {
  final common.CourseEntity course;

  const CourseCardWeb({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go('/courses/${course.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image de couverture
            AspectRatio(
              aspectRatio: 16 / 9,
              child: course.thumbnailUrl != null
                  ? Image.network(
                      course.thumbnailUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildPlaceholder(),
                    )
                  : _buildPlaceholder(),
            ),

            // Contenu
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre
                    Text(
                      course.title,
                      style: common.AppTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Description
                    Expanded(
                      child: Text(
                        course.description,
                        style: common.AppTypography.bodySmall.copyWith(
                          color: common.AppColors.textSecondary,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Métadonnées
                    Row(
                      children: [
                        // Niveau
                        _buildChip(
                          Icons.signal_cellular_alt,
                          _getLevelLabel(course.level),
                          common.AppColors.primary,
                        ),
                        const SizedBox(width: 8),

                        // Durée
                        _buildChip(
                          Icons.access_time,
                          course.formattedDuration,
                          common.AppColors.secondary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[300],
      child: const Center(
        child: Icon(
          Icons.school,
          size: 48,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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

  String _getLevelLabel(common.CourseLevel level) {
    switch (level) {
      case common.CourseLevel.beginner:
        return 'Débutant';
      case common.CourseLevel.intermediate:
        return 'Intermédiaire';
      case common.CourseLevel.advanced:
        return 'Avancé';
      case common.CourseLevel.expert:
        return 'Expert';
    }
  }
}
