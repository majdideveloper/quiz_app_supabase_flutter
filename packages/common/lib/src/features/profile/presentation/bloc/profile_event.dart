import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.freezed.dart';

/// Profile events using Freezed
@freezed
class ProfileEvent with _$ProfileEvent {
  /// Event to load current user's profile
  const factory ProfileEvent.loadProfile() = LoadProfileEvent;

  /// Event to update profile information
  const factory ProfileEvent.updateProfile({
    required String userId,
    String? fullName,
    String? phone,
    String? bio,
    DateTime? dateOfBirth,
    String? address,
    String? city,
    String? province,
    String? postalCode,
    String? country,
  }) = UpdateProfileEvent;

  /// Event to upload avatar
  const factory ProfileEvent.uploadAvatar({
    required String userId,
    required String filePath,
  }) = UploadAvatarEvent;

  /// Event to delete avatar
  const factory ProfileEvent.deleteAvatar({
    required String userId,
  }) = DeleteAvatarEvent;

  /// Event to update preferences
  const factory ProfileEvent.updatePreferences({
    required String userId,
    String? preferredLanguage,
    bool? notificationsEnabled,
    bool? emailNotificationsEnabled,
  }) = UpdatePreferencesEvent;

  /// Event to refresh profile
  const factory ProfileEvent.refreshProfile() = RefreshProfileEvent;
}
