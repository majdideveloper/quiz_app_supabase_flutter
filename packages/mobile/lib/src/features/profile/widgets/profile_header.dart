import 'package:flutter/material.dart';
import 'package:common/common.dart';

/// Profile header widget
///
/// Displays user avatar and basic information
class ProfileHeader extends StatelessWidget {
  final ProfileEntity profile;
  final bool isUploading;
  final VoidCallback? onAvatarTap;

  const ProfileHeader({
    super.key,
    required this.profile,
    this.isUploading = false,
    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.primary.withValues(alpha: 0.8),
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xl,
        horizontal: AppSpacing.md,
      ),
      child: Column(
        children: [
          // Avatar
          Stack(
            children: [
              GestureDetector(
                onTap: onAvatarTap,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: profile.avatarUrl != null
                      ? NetworkImage(profile.avatarUrl!)
                      : null,
                  child: profile.avatarUrl == null
                      ? Text(
                          profile.initials,
                          style: AppTypography.displaySmall.copyWith(
                            color: AppColors.primary,
                          ),
                        )
                      : null,
                ),
              ),
              if (isUploading)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (onAvatarTap != null && !isUploading)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: AppColors.primary,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: AppSpacing.md),

          // Name
          Text(
            profile.fullName,
            style: AppTypography.headlineMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppSpacing.xs),

          // Email
          Text(
            profile.email,
            style: AppTypography.bodyMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppSpacing.xs),

          // Role badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              profile.roleDisplayName,
              style: AppTypography.bodySmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
