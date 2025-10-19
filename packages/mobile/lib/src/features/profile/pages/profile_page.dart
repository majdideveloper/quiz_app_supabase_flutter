import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';

import '../widgets/profile_header.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/profile_stats_card.dart';
import '../widgets/preference_setting.dart';

/// Profile page
///
/// Displays user profile with:
/// - Profile header (avatar and basic info)
/// - Personal information
/// - Learning statistics
/// - Preferences/settings
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>()
        ..add(const ProfileEvent.loadProfile()),
      child: const ProfileView(),
    );
  }
}

/// Profile view with BLoC consumer
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (profile) => IconButton(
                  onPressed: () {
                    context.push('/profile/edit', extra: profile);
                  },
                  icon: const Icon(Icons.edit),
                  tooltip: 'Edit Profile',
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          // Show error snackbar if needed
          state.whenOrNull(
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.error,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (profile) => _buildProfileContent(context, profile),
            uploading: (profile) => _buildProfileContent(
              context,
              profile,
              isUploading: true,
            ),
            error: (message) => _buildErrorState(context, message),
          );
        },
      ),
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    ProfileEntity profile, {
    bool isUploading = false,
  }) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProfileBloc>().add(const ProfileEvent.refreshProfile());
        await Future.delayed(const Duration(seconds: 1));
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            // Profile Header
            ProfileHeader(
              profile: profile,
              isUploading: isUploading,
              onAvatarTap: () => _showAvatarOptions(context, profile),
            ),

            const SizedBox(height: AppSpacing.lg),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Personal Information
                  Text(
                    'Personal Information',
                    style: AppTypography.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ProfileInfoCard(profile: profile),

                  const SizedBox(height: AppSpacing.lg),

                  // Learning Statistics
                  Text(
                    'Learning Progress',
                    style: AppTypography.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ProfileStatsCard(profile: profile),

                  const SizedBox(height: AppSpacing.lg),

                  // Settings/Preferences
                  Text(
                    'Settings',
                    style: AppTypography.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Card(
                    child: Column(
                      children: [
                        PreferenceSetting(
                          icon: Icons.language,
                          title: 'Language',
                          subtitle: profile.preferredLanguage == 'fr'
                              ? 'Français'
                              : 'English',
                          onTap: () => _showLanguageSelector(context, profile),
                        ),
                        const Divider(height: 1),
                        PreferenceSetting(
                          icon: Icons.notifications,
                          title: 'Push Notifications',
                          trailing: Switch(
                            value: profile.notificationsEnabled,
                            onChanged: (value) {
                              context.read<ProfileBloc>().add(
                                    ProfileEvent.updatePreferences(
                                      userId: profile.id,
                                      notificationsEnabled: value,
                                    ),
                                  );
                            },
                          ),
                        ),
                        const Divider(height: 1),
                        PreferenceSetting(
                          icon: Icons.email,
                          title: 'Email Notifications',
                          trailing: Switch(
                            value: profile.emailNotificationsEnabled,
                            onChanged: (value) {
                              context.read<ProfileBloc>().add(
                                    ProfileEvent.updatePreferences(
                                      userId: profile.id,
                                      emailNotificationsEnabled: value,
                                    ),
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Logout button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        _showLogoutDialog(context);
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text('Logout'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.error,
                        side: BorderSide(color: AppColors.error),
                        padding: const EdgeInsets.all(AppSpacing.md),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
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
              'Failed to load profile',
              style: AppTypography.titleLarge,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: () {
                context.read<ProfileBloc>().add(
                      const ProfileEvent.loadProfile(),
                    );
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAvatarOptions(BuildContext context, ProfileEntity profile) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () {
                Navigator.pop(sheetContext);
                // TODO: Implement image picker
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Image picker not yet implemented'),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a photo'),
              onTap: () {
                Navigator.pop(sheetContext);
                // TODO: Implement camera
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Camera not yet implemented'),
                  ),
                );
              },
            ),
            if (profile.avatarUrl != null)
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text(
                  'Remove avatar',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  context.read<ProfileBloc>().add(
                        ProfileEvent.deleteAvatar(userId: profile.id),
                      );
                },
              ),
          ],
        ),
      ),
    );
  }

  void _showLanguageSelector(BuildContext context, ProfileEntity profile) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: const Text('Français'),
              value: 'fr',
              groupValue: profile.preferredLanguage,
              onChanged: (value) {
                if (value != null) {
                  context.read<ProfileBloc>().add(
                        ProfileEvent.updatePreferences(
                          userId: profile.id,
                          preferredLanguage: value,
                        ),
                      );
                  Navigator.pop(dialogContext);
                }
              },
            ),
            RadioListTile<String>(
              title: const Text('English'),
              value: 'en',
              groupValue: profile.preferredLanguage,
              onChanged: (value) {
                if (value != null) {
                  context.read<ProfileBloc>().add(
                        ProfileEvent.updatePreferences(
                          userId: profile.id,
                          preferredLanguage: value,
                        ),
                      );
                  Navigator.pop(dialogContext);
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              // Dispatch logout event to AuthBloc
              context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
              // Navigate to login page
              context.go('/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
