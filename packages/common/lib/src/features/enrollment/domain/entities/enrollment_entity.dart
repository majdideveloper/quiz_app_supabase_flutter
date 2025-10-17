import 'package:freezed_annotation/freezed_annotation.dart';

part 'enrollment_entity.freezed.dart';

/// Enrollment status enum
enum EnrollmentStatus {
  @JsonValue('enrolled')
  enrolled,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('dropped')
  dropped,
}

/// Domain entity for course enrollment
///
/// Represents a user's enrollment in a course, tracking their progress
/// and completion status.
@freezed
class EnrollmentEntity with _$EnrollmentEntity {
  const factory EnrollmentEntity({
    required String id,
    required String userId,
    required String courseId,
    required EnrollmentStatus status,
    required DateTime enrolledAt,
    DateTime? completedAt,
    DateTime? droppedAt,
    @Default(0) int progress,
    @Default(0) int completedLessons,
    required int totalLessons,
    @Default(0) int timeSpent,
    DateTime? lastAccessedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _EnrollmentEntity;

  const EnrollmentEntity._();

  /// Check if enrollment is active
  bool get isActive => status == EnrollmentStatus.enrolled || status == EnrollmentStatus.inProgress;

  /// Check if enrollment is completed
  bool get isCompleted => status == EnrollmentStatus.completed;

  /// Check if enrollment is dropped
  bool get isDropped => status == EnrollmentStatus.dropped;

  /// Get formatted progress percentage
  String get formattedProgress => '$progress%';

  /// Get progress as decimal (0.0 to 1.0)
  double get progressDecimal => progress / 100.0;

  /// Get formatted completion ratio
  String get completionRatio => '$completedLessons/$totalLessons leçons';

  /// Get formatted time spent
  String get formattedTimeSpent {
    if (timeSpent < 60) {
      return '$timeSpent min';
    }

    final hours = timeSpent ~/ 60;
    final minutes = timeSpent % 60;

    if (hours < 24) {
      return minutes > 0 ? '${hours}h ${minutes}min' : '${hours}h';
    }

    final days = hours ~/ 24;
    final remainingHours = hours % 24;

    if (remainingHours > 0) {
      return '${days}j ${remainingHours}h';
    }

    return '${days}j';
  }

  /// Get status display name in French
  String get statusDisplayName {
    switch (status) {
      case EnrollmentStatus.enrolled:
        return 'Inscrit';
      case EnrollmentStatus.inProgress:
        return 'En cours';
      case EnrollmentStatus.completed:
        return 'Terminé';
      case EnrollmentStatus.dropped:
        return 'Abandonné';
    }
  }

  /// Get enrollment duration in days
  int get enrollmentDurationDays {
    final endDate = completedAt ?? droppedAt ?? DateTime.now();
    return endDate.difference(enrolledAt).inDays;
  }

  /// Check if enrollment is recent (within 7 days)
  bool get isRecent {
    final now = DateTime.now();
    return now.difference(enrolledAt).inDays <= 7;
  }

  /// Check if enrollment is stale (no activity in 30 days)
  bool get isStale {
    if (lastAccessedAt == null) return false;
    final now = DateTime.now();
    return now.difference(lastAccessedAt!).inDays > 30;
  }
}
