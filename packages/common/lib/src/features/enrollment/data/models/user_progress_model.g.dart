// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProgressModelImpl _$$UserProgressModelImplFromJson(
  Map<String, dynamic> json,
) => _$UserProgressModelImpl(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  enrollmentId: json['enrollment_id'] as String,
  lessonId: json['lesson_id'] as String,
  completed: json['completed'] as bool,
  completedAt:
      json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
  timeSpent: (json['time_spent'] as num?)?.toInt() ?? 0,
  lastAccessedAt:
      json['last_accessed_at'] == null
          ? null
          : DateTime.parse(json['last_accessed_at'] as String),
  videoProgress: (json['video_progress'] as num?)?.toInt() ?? 0,
  videoCompleted: json['video_completed'] as bool? ?? false,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$$UserProgressModelImplToJson(
  _$UserProgressModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'enrollment_id': instance.enrollmentId,
  'lesson_id': instance.lessonId,
  'completed': instance.completed,
  'completed_at': instance.completedAt?.toIso8601String(),
  'time_spent': instance.timeSpent,
  'last_accessed_at': instance.lastAccessedAt?.toIso8601String(),
  'video_progress': instance.videoProgress,
  'video_completed': instance.videoCompleted,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
