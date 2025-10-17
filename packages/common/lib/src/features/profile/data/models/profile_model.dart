import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/entities/profile_entity.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

/// Profile model for data layer
///
/// This is the data layer representation of a user profile. It extends [ProfileEntity]
/// and adds JSON serialization capabilities for API communication.
///
/// The model maps to the `profiles` table in Supabase.
@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String id,
    required String email,
    @JsonKey(name: 'full_name')
    required String fullName,
    @JsonKey(name: 'avatar_url')
    String? avatarUrl,
    String? phone,
    String? bio,
    required UserRole role,
    @JsonKey(name: 'email_verified')
    @Default(false)
    bool emailVerified,
    @JsonKey(name: 'is_active')
    @Default(true)
    bool isActive,
    @JsonKey(name: 'date_of_birth')
    DateTime? dateOfBirth,
    String? address,
    String? city,
    String? province,
    @JsonKey(name: 'postal_code')
    String? postalCode,
    String? country,
    @JsonKey(name: 'preferred_language')
    @Default('fr')
    String preferredLanguage,
    @JsonKey(name: 'notifications_enabled')
    @Default(false)
    bool notificationsEnabled,
    @JsonKey(name: 'email_notifications_enabled')
    @Default(false)
    bool emailNotificationsEnabled,
    @JsonKey(name: 'total_enrollments')
    @Default(0)
    int totalEnrollments,
    @JsonKey(name: 'completed_courses')
    @Default(0)
    int completedCourses,
    @JsonKey(name: 'certificates_earned')
    @Default(0)
    int certificatesEarned,
    @JsonKey(name: 'total_points')
    @Default(0)
    int totalPoints,
    @JsonKey(name: 'last_login_at')
    DateTime? lastLoginAt,
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
    @JsonKey(name: 'updated_at')
    required DateTime updatedAt,
  }) = _ProfileModel;

  const ProfileModel._();

  /// Create ProfileModel from JSON
  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  /// Convert ProfileModel to domain entity
  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id,
      email: email,
      fullName: fullName,
      avatarUrl: avatarUrl,
      phone: phone,
      bio: bio,
      role: role,
      emailVerified: emailVerified,
      isActive: isActive,
      dateOfBirth: dateOfBirth,
      address: address,
      city: city,
      province: province,
      postalCode: postalCode,
      country: country,
      preferredLanguage: preferredLanguage,
      notificationsEnabled: notificationsEnabled,
      emailNotificationsEnabled: emailNotificationsEnabled,
      totalEnrollments: totalEnrollments,
      completedCourses: completedCourses,
      certificatesEarned: certificatesEarned,
      totalPoints: totalPoints,
      lastLoginAt: lastLoginAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Create ProfileModel from domain entity
  factory ProfileModel.fromEntity(ProfileEntity entity) {
    return ProfileModel(
      id: entity.id,
      email: entity.email,
      fullName: entity.fullName,
      avatarUrl: entity.avatarUrl,
      phone: entity.phone,
      bio: entity.bio,
      role: entity.role,
      emailVerified: entity.emailVerified,
      isActive: entity.isActive,
      dateOfBirth: entity.dateOfBirth,
      address: entity.address,
      city: entity.city,
      province: entity.province,
      postalCode: entity.postalCode,
      country: entity.country,
      preferredLanguage: entity.preferredLanguage,
      notificationsEnabled: entity.notificationsEnabled,
      emailNotificationsEnabled: entity.emailNotificationsEnabled,
      totalEnrollments: entity.totalEnrollments,
      completedCourses: entity.completedCourses,
      certificatesEarned: entity.certificatesEarned,
      totalPoints: entity.totalPoints,
      lastLoginAt: entity.lastLoginAt,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
