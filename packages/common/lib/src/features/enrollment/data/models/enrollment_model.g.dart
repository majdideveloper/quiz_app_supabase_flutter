// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnrollmentModelImpl _$$EnrollmentModelImplFromJson(
  Map<String, dynamic> json,
) => _$EnrollmentModelImpl(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  courseId: json['course_id'] as String,
  status: $enumDecode(_$EnrollmentStatusEnumMap, json['status']),
  enrolledAt: DateTime.parse(json['enrolled_at'] as String),
  completedAt:
      json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
  droppedAt:
      json['dropped_at'] == null
          ? null
          : DateTime.parse(json['dropped_at'] as String),
  progress: (json['progress'] as num?)?.toInt() ?? 0,
  completedLessons: (json['completed_lessons'] as num?)?.toInt() ?? 0,
  totalLessons: (json['total_lessons'] as num).toInt(),
  timeSpent: (json['time_spent'] as num?)?.toInt() ?? 0,
  lastAccessedAt:
      json['last_accessed_at'] == null
          ? null
          : DateTime.parse(json['last_accessed_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$$EnrollmentModelImplToJson(
  _$EnrollmentModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'course_id': instance.courseId,
  'status': _$EnrollmentStatusEnumMap[instance.status]!,
  'enrolled_at': instance.enrolledAt.toIso8601String(),
  'completed_at': instance.completedAt?.toIso8601String(),
  'dropped_at': instance.droppedAt?.toIso8601String(),
  'progress': instance.progress,
  'completed_lessons': instance.completedLessons,
  'total_lessons': instance.totalLessons,
  'time_spent': instance.timeSpent,
  'last_accessed_at': instance.lastAccessedAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

const _$EnrollmentStatusEnumMap = {
  EnrollmentStatus.enrolled: 'enrolled',
  EnrollmentStatus.inProgress: 'in_progress',
  EnrollmentStatus.completed: 'completed',
  EnrollmentStatus.dropped: 'dropped',
};
