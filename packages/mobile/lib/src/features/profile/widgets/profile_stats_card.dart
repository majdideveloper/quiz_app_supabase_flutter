import 'package:flutter/material.dart';
import 'package:common/common.dart';

/// Profile statistics card widget
///
/// Displays user's learning progress and statistics
class ProfileStatsCard extends StatelessWidget {
  final ProfileEntity profile;

  const ProfileStatsCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    icon: Icons.school,
                    label: 'Enrolled',
                    value: profile.totalEnrollments.toString(),
                    color: AppColors.primary,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    icon: Icons.check_circle,
                    label: 'Completed',
                    value: profile.completedCourses.toString(),
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    icon: Icons.workspace_premium,
                    label: 'Certificates',
                    value: profile.certificatesEarned.toString(),
                    color: Colors.amber,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    icon: Icons.star,
                    label: 'Points',
                    value: profile.totalPoints.toString(),
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            const Divider(height: AppSpacing.lg),
            _buildProgressRow(
              label: 'Completion Rate',
              value: profile.formattedCompletionRate,
              progress: profile.completionRate / 100,
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildProgressRow(
              label: 'Profile Completion',
              value: '${profile.profileCompletionPercentage}%',
              progress: profile.profileCompletionPercentage / 100,
            ),
            const Divider(height: AppSpacing.lg),
            _buildLearningLevel(profile.learningLevel),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 32,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            value,
            style: AppTypography.titleLarge.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressRow({
    required String label,
    required String value,
    required double progress,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              value,
              style: AppTypography.titleSmall.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: AppColors.surfaceVariant,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildLearningLevel(String level) {
    Color getLevelColor() {
      switch (level) {
        case 'Débutant':
          return Colors.blue;
        case 'Intermédiaire':
          return Colors.green;
        case 'Avancé':
          return Colors.orange;
        case 'Expert':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
        horizontal: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: getLevelColor().withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: getLevelColor(),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.emoji_events,
            color: getLevelColor(),
            size: 20,
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            'Learning Level: $level',
            style: AppTypography.titleSmall.copyWith(
              color: getLevelColor(),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
