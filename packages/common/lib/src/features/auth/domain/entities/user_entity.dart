import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

/// User entity representing the domain model for a user
///
/// This is the domain layer representation of a user in the Formation Métiers app.
/// It contains business logic properties and is independent of any data source.
///
/// Properties:
/// - [id]: Unique identifier (UUID from Supabase Auth)
/// - [email]: User's email address (required)
/// - [fullName]: User's full name (optional)
/// - [avatarUrl]: URL to user's avatar image (optional)
/// - [role]: User's role in the system (student, instructor, admin)
/// - [createdAt]: Account creation timestamp
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    String? fullName,
    String? avatarUrl,
    required UserRole role,
    required DateTime createdAt,
  }) = _UserEntity;

  const UserEntity._();

  /// Check if user is a student
  bool get isStudent => role == UserRole.student;

  /// Check if user is an instructor
  bool get isInstructor => role == UserRole.instructor;

  /// Check if user is an admin
  bool get isAdmin => role == UserRole.admin;

  /// Get user's display name (fallback to email if no full name)
  String get displayName => fullName ?? email;

  /// Get user's initials for avatar placeholder
  String get initials {
    if (fullName != null && fullName!.isNotEmpty) {
      final parts = fullName!.trim().split(' ');
      if (parts.length >= 2) {
        return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
      }
      return fullName![0].toUpperCase();
    }
    return email[0].toUpperCase();
  }

  /// Check if user has an avatar
  bool get hasAvatar => avatarUrl != null && avatarUrl!.isNotEmpty;
}

/// User role enumeration
///
/// Defines the three types of users in the Formation Métiers system:
/// - [student]: Regular users who enroll in and take courses
/// - [instructor]: Users who create and manage courses
/// - [admin]: System administrators with full access
enum UserRole {
  @JsonValue('student')
  student,
  @JsonValue('instructor')
  instructor,
  @JsonValue('admin')
  admin,
}
