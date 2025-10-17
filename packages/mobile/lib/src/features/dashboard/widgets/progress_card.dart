import 'package:flutter/material.dart';
import 'package:common/common.dart';

/// Progress card widget
///
/// Displays user's learning progress with circular indicators
class ProgressCard extends StatelessWidget {
  final int totalCourses;
  final int completedCourses;
  final int totalPoints;

  const ProgressCard({
    super.key,
    required this.totalCourses,
    required this.completedCourses,
    required this.totalPoints,
  });

  @override
  Widget build(BuildContext context) {
    final completionRate = totalCourses > 0
        ? (completedCourses / totalCourses)
        : 0.0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Progress',
              style: AppTypography.titleLarge,
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildProgressIndicator(
                  context: context,
                  label: 'Completion',
                  value: completionRate,
                  color: AppColors.primary,
                  displayText: '${(completionRate * 100).toInt()}%',
                ),
                _buildStatColumn(
                  icon: Icons.school,
                  value: totalCourses.toString(),
                  label: 'Enrolled',
                  color: Colors.blue,
                ),
                _buildStatColumn(
                  icon: Icons.check_circle,
                  value: completedCourses.toString(),
                  label: 'Completed',
                  color: Colors.green,
                ),
                _buildStatColumn(
                  icon: Icons.stars,
                  value: totalPoints.toString(),
                  label: 'Points',
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator({
    required BuildContext context,
    required String label,
    required double value,
    required Color color,
    required String displayText,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: value,
                  strokeWidth: 8,
                  backgroundColor: AppColors.surfaceVariant,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Text(
                displayText,
                style: AppTypography.titleMedium.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildStatColumn({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 28,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          value,
          style: AppTypography.titleLarge.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
