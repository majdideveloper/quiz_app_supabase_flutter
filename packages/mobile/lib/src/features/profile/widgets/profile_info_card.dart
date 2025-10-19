import 'package:flutter/material.dart';
import 'package:common/common.dart';

/// Profile information card widget
///
/// Displays user's personal information
class ProfileInfoCard extends StatelessWidget {
  final ProfileEntity profile;

  const ProfileInfoCard({
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
            _buildInfoRow(
              icon: Icons.email,
              label: 'Email',
              value: profile.email,
            ),
            if (profile.phone != null) ...[
              const Divider(),
              _buildInfoRow(
                icon: Icons.phone,
                label: 'Phone',
                value: profile.phone!,
              ),
            ],
            if (profile.dateOfBirth != null) ...[
              const Divider(),
              _buildInfoRow(
                icon: Icons.cake,
                label: 'Date of Birth',
                value:
                    '${profile.dateOfBirth!.day}/${profile.dateOfBirth!.month}/${profile.dateOfBirth!.year}' +
                        (profile.age != null ? ' (${profile.age} years old)' : ''),
              ),
            ],
            if (profile.bio != null && profile.bio!.isNotEmpty) ...[
              const Divider(),
              _buildInfoRow(
                icon: Icons.info_outline,
                label: 'Bio',
                value: profile.bio!,
                isMultiline: true,
              ),
            ],
            if (profile.fullAddress != null) ...[
              const Divider(),
              _buildInfoRow(
                icon: Icons.location_on,
                label: 'Address',
                value: profile.fullAddress!,
                isMultiline: true,
              ),
            ],
            if (profile.lastLoginAt != null) ...[
              const Divider(),
              _buildInfoRow(
                icon: Icons.access_time,
                label: 'Last Login',
                value: _formatLastLogin(profile.daysSinceLastLogin),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    bool isMultiline = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment:
            isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: AppColors.primary,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: AppTypography.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatLastLogin(int? days) {
    if (days == null) return 'Never';
    if (days == 0) return 'Today';
    if (days == 1) return 'Yesterday';
    if (days < 7) return '$days days ago';
    if (days < 30) return '${(days / 7).floor()} weeks ago';
    return '${(days / 30).floor()} months ago';
  }
}
