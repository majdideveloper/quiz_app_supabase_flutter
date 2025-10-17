import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_progress_entity.freezed.dart';

/// Domain entity for user lesson progress
///
/// Represents a user's progress for a specific lesson, tracking completion
/// status, time spent, and access history.
@freezed
class UserProgressEntity with _$UserProgressEntity {
  const factory UserProgressEntity({
    required String id,
    required String userId,
    required String enrollmentId,
    required String lessonId,
    required bool completed,
    DateTime? completedAt,
    @Default(0) int timeSpent,
    DateTime? lastAccessedAt,
    @Default(0) int videoProgress,
    @Default(false) bool videoCompleted,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserProgressEntity;

  const UserProgressEntity._();

  /// Get formatted time spent
  String get formattedTimeSpent {
    if (timeSpent < 60) {
      return '$timeSpent min';
    }

    final hours = timeSpent ~/ 60;
    final minutes = timeSpent % 60;

    if (minutes > 0) {
      return '${hours}h ${minutes}min';
    }

    return '${hours}h';
  }

  /// Get video progress as decimal (0.0 to 1.0)
  double get videoProgressDecimal => videoProgress / 100.0;

  /// Get formatted video progress percentage
  String get formattedVideoProgress => '$videoProgress%';

  /// Check if lesson is in progress (accessed but not completed)
  bool get isInProgress => !completed && lastAccessedAt != null;

  /// Check if lesson is not started
  bool get isNotStarted => lastAccessedAt == null;

  /// Get completion status display name in French
  String get statusDisplayName {
    if (completed) return 'Terminé';
    if (isInProgress) return 'En cours';
    return 'Non commencé';
  }

  /// Get time since last access in days
  int? get daysSinceLastAccess {
    if (lastAccessedAt == null) return null;
    final now = DateTime.now();
    return now.difference(lastAccessedAt!).inDays;
  }

  /// Check if progress is recent (accessed within 24 hours)
  bool get isRecent {
    if (lastAccessedAt == null) return false;
    final now = DateTime.now();
    return now.difference(lastAccessedAt!).inHours < 24;
  }

  /// Get completion duration in days
  int? get completionDurationDays {
    if (completedAt == null || lastAccessedAt == null) return null;
    return completedAt!.difference(createdAt).inDays;
  }

  /// Check if video is mostly completed (>80%)
  bool get isVideoMostlyCompleted => videoProgress >= 80;

  /// Check if video is partially watched (>0% but not completed)
  bool get isVideoPartiallyWatched => videoProgress > 0 && !videoCompleted;
}
