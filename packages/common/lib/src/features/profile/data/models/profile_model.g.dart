// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      avatarUrl: json['avatar_url'] as String?,
      phone: json['phone'] as String?,
      bio: json['bio'] as String?,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      emailVerified: json['email_verified'] as bool? ?? false,
      isActive: json['is_active'] as bool? ?? true,
      dateOfBirth:
          json['date_of_birth'] == null
              ? null
              : DateTime.parse(json['date_of_birth'] as String),
      address: json['address'] as String?,
      city: json['city'] as String?,
      province: json['province'] as String?,
      postalCode: json['postal_code'] as String?,
      country: json['country'] as String?,
      preferredLanguage: json['preferred_language'] as String? ?? 'fr',
      notificationsEnabled: json['notifications_enabled'] as bool? ?? false,
      emailNotificationsEnabled:
          json['email_notifications_enabled'] as bool? ?? false,
      totalEnrollments: (json['total_enrollments'] as num?)?.toInt() ?? 0,
      completedCourses: (json['completed_courses'] as num?)?.toInt() ?? 0,
      certificatesEarned: (json['certificates_earned'] as num?)?.toInt() ?? 0,
      totalPoints: (json['total_points'] as num?)?.toInt() ?? 0,
      lastLoginAt:
          json['last_login_at'] == null
              ? null
              : DateTime.parse(json['last_login_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'phone': instance.phone,
      'bio': instance.bio,
      'role': _$UserRoleEnumMap[instance.role]!,
      'email_verified': instance.emailVerified,
      'is_active': instance.isActive,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'address': instance.address,
      'city': instance.city,
      'province': instance.province,
      'postal_code': instance.postalCode,
      'country': instance.country,
      'preferred_language': instance.preferredLanguage,
      'notifications_enabled': instance.notificationsEnabled,
      'email_notifications_enabled': instance.emailNotificationsEnabled,
      'total_enrollments': instance.totalEnrollments,
      'completed_courses': instance.completedCourses,
      'certificates_earned': instance.certificatesEarned,
      'total_points': instance.totalPoints,
      'last_login_at': instance.lastLoginAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.student: 'student',
  UserRole.instructor: 'instructor',
  UserRole.admin: 'admin',
};
