import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

/// User role enum
enum UserRole {
  @JsonValue('student')
  student,
  @JsonValue('instructor')
  instructor,
  @JsonValue('admin')
  admin,
}

/// Domain entity for user profile
///
/// Represents a user's profile information including personal details,
/// preferences, and learning statistics.
@freezed
class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required String id,
    required String email,
    required String fullName,
    String? avatarUrl,
    String? phone,
    String? bio,
    required UserRole role,
    @Default(false) bool emailVerified,
    @Default(true) bool isActive,
    DateTime? dateOfBirth,
    String? address,
    String? city,
    String? province,
    String? postalCode,
    String? country,
    @Default('fr') String preferredLanguage,
    @Default(false) bool notificationsEnabled,
    @Default(false) bool emailNotificationsEnabled,
    @Default(0) int totalEnrollments,
    @Default(0) int completedCourses,
    @Default(0) int certificatesEarned,
    @Default(0) int totalPoints,
    DateTime? lastLoginAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProfileEntity;

  const ProfileEntity._();

  /// Get user's display name (full name or email)
  String get displayName => fullName.isNotEmpty ? fullName : email;

  /// Get user's initials (for avatar placeholder)
  String get initials {
    final parts = fullName.trim().split(' ');
    if (parts.isEmpty) return email[0].toUpperCase();
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }

  /// Get role display name in French
  String get roleDisplayName {
    switch (role) {
      case UserRole.student:
        return 'Étudiant';
      case UserRole.instructor:
        return 'Instructeur';
      case UserRole.admin:
        return 'Administrateur';
    }
  }

  /// Check if user is a student
  bool get isStudent => role == UserRole.student;

  /// Check if user is an instructor
  bool get isInstructor => role == UserRole.instructor;

  /// Check if user is an admin
  bool get isAdmin => role == UserRole.admin;

  /// Get full address as a single string
  String? get fullAddress {
    final parts = <String>[];
    if (address != null && address!.isNotEmpty) parts.add(address!);
    if (city != null && city!.isNotEmpty) parts.add(city!);
    if (province != null && province!.isNotEmpty) parts.add(province!);
    if (postalCode != null && postalCode!.isNotEmpty) parts.add(postalCode!);
    if (country != null && country!.isNotEmpty) parts.add(country!);
    return parts.isEmpty ? null : parts.join(', ');
  }

  /// Check if profile has complete address
  bool get hasCompleteAddress {
    return address != null &&
        city != null &&
        province != null &&
        postalCode != null;
  }

  /// Check if profile is complete (has all required info)
  bool get isProfileComplete {
    return fullName.isNotEmpty &&
        phone != null &&
        dateOfBirth != null &&
        hasCompleteAddress;
  }

  /// Get profile completion percentage
  int get profileCompletionPercentage {
    int completed = 0;
    const int total = 7;

    if (fullName.isNotEmpty) completed++;
    if (phone != null) completed++;
    if (bio != null && bio!.isNotEmpty) completed++;
    if (avatarUrl != null) completed++;
    if (dateOfBirth != null) completed++;
    if (address != null) completed++;
    if (city != null && province != null && postalCode != null) completed++;

    return ((completed / total) * 100).round();
  }

  /// Get age from date of birth
  int? get age {
    if (dateOfBirth == null) return null;
    final now = DateTime.now();
    int age = now.year - dateOfBirth!.year;
    if (now.month < dateOfBirth!.month ||
        (now.month == dateOfBirth!.month && now.day < dateOfBirth!.day)) {
      age--;
    }
    return age;
  }

  /// Check if user has been active recently (within 30 days)
  bool get isRecentlyActive {
    if (lastLoginAt == null) return false;
    final now = DateTime.now();
    return now.difference(lastLoginAt!).inDays <= 30;
  }

  /// Get days since last login
  int? get daysSinceLastLogin {
    if (lastLoginAt == null) return null;
    final now = DateTime.now();
    return now.difference(lastLoginAt!).inDays;
  }

  /// Get learning level based on completed courses
  String get learningLevel {
    if (completedCourses == 0) return 'Débutant';
    if (completedCourses < 5) return 'Intermédiaire';
    if (completedCourses < 10) return 'Avancé';
    return 'Expert';
  }

  /// Get completion rate percentage
  double get completionRate {
    if (totalEnrollments == 0) return 0.0;
    return (completedCourses / totalEnrollments) * 100;
  }

  /// Get formatted completion rate
  String get formattedCompletionRate {
    return '${completionRate.toStringAsFixed(1)}%';
  }

  /// Check if user has any enrollments
  bool get hasEnrollments => totalEnrollments > 0;

  /// Check if user has completed any courses
  bool get hasCompletedCourses => completedCourses > 0;

  /// Check if user has earned any certificates
  bool get hasCertificates => certificatesEarned > 0;
}
