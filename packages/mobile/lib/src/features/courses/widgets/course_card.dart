import 'package:flutter/material.dart';
import 'package:common/common.dart';

/// Course card widget
///
/// Displays course information in a card format with thumbnail,
/// title, instructor, rating, and pricing.
class CourseCard extends StatelessWidget {
  final CourseEntity course;
  final VoidCallback? onTap;

  const CourseCard({
    super.key,
    required this.course,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            _buildThumbnail(context),

            // Content
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category chip
                  _buildCategoryChip(context),
                  const SizedBox(height: AppSpacing.xs),

                  // Title
                  Text(
                    course.title,
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.onSurface,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xs),

                  // Instructor
                  Text(
                    course.instructorName,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),

                  // Rating and enrollment
                  Row(
                    children: [
                      // Rating
                      const Icon(
                        Icons.star,
                        size: AppSpacing.iconSm,
                        color: AppColors.warning,
                      ),
                      const SizedBox(width: AppSpacing.xxs),
                      Text(
                        course.rating.toStringAsFixed(1),
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.xxs),
                      Text(
                        '(${course.ratingCount})',
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                      const Spacer(),

                      // Enrollment count
                      const Icon(
                        Icons.people_outline,
                        size: AppSpacing.iconSm,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: AppSpacing.xxs),
                      Text(
                        '${course.enrollmentCount}',
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),

                  // Price and level
                  Row(
                    children: [
                      // Price
                      Text(
                        '\$${course.price.toStringAsFixed(2)}',
                        style: AppTypography.titleMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),

                      // Level
                      _buildLevelChip(context),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: course.thumbnailUrl != null
          ? Image.network(
              course.thumbnailUrl!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _buildPlaceholder(context);
              },
            )
          : _buildPlaceholder(context),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      color: AppColors.surfaceVariant,
      child: const Center(
        child: Icon(
          Icons.image_outlined,
          size: AppSpacing.iconXl,
          color: AppColors.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: _getCategoryColor(course.category).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
      ),
      child: Text(
        _getCategoryLabel(course.category),
        style: AppTypography.labelSmall.copyWith(
          color: _getCategoryColor(course.category),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildLevelChip(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
      ),
      child: Text(
        _getLevelLabel(course.level),
        style: AppTypography.labelSmall.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
      ),
    );
  }

  Color _getCategoryColor(CourseCategory category) {
    switch (category) {
      case CourseCategory.ccq:
        return AppColors.primary;
      case CourseCategory.nonConstruction:
        return AppColors.secondary;
      case CourseCategory.redSeal:
        return AppColors.error;
    }
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
