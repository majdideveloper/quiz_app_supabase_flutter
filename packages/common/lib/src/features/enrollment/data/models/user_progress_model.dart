import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_progress_entity.dart';

part 'user_progress_model.freezed.dart';
part 'user_progress_model.g.dart';

/// User progress model for data layer
///
/// This is the data layer representation of user progress. It extends [UserProgressEntity]
/// and adds JSON serialization capabilities for API communication.
///
/// The model maps to the `user_progress` table in Supabase.
@freezed
class UserProgressModel with _$UserProgressModel {
  const factory UserProgressModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'enrollment_id') required String enrollmentId,
    @JsonKey(name: 'lesson_id') required String lessonId,
    required bool completed,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'time_spent') @Default(0) int timeSpent,
    @JsonKey(name: 'last_accessed_at') DateTime? lastAccessedAt,
    @JsonKey(name: 'video_progress') @Default(0) int videoProgress,
    @JsonKey(name: 'video_completed') @Default(false) bool videoCompleted,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _UserProgressModel;

  const UserProgressModel._();

  /// Create UserProgressModel from JSON
  factory UserProgressModel.fromJson(Map<String, dynamic> json) =>
      _$UserProgressModelFromJson(json);

  /// Convert UserProgressModel to domain entity
  UserProgressEntity toEntity() {
    return UserProgressEntity(
      id: id,
      userId: userId,
      enrollmentId: enrollmentId,
      lessonId: lessonId,
      completed: completed,
      completedAt: completedAt,
      timeSpent: timeSpent,
      lastAccessedAt: lastAccessedAt,
      videoProgress: videoProgress,
      videoCompleted: videoCompleted,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Create UserProgressModel from domain entity
  factory UserProgressModel.fromEntity(UserProgressEntity entity) {
    return UserProgressModel(
      id: entity.id,
      userId: entity.userId,
      enrollmentId: entity.enrollmentId,
      lessonId: entity.lessonId,
      completed: entity.completed,
      completedAt: entity.completedAt,
      timeSpent: entity.timeSpent,
      lastAccessedAt: entity.lastAccessedAt,
      videoProgress: entity.videoProgress,
      videoCompleted: entity.videoCompleted,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
