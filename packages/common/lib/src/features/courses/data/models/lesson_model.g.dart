// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonModelImpl _$$LessonModelImplFromJson(Map<String, dynamic> json) =>
    _$LessonModelImpl(
      id: json['id'] as String,
      courseId: json['course_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      content: json['content'] as String? ?? '',
      videoUrl: json['video_url'] as String?,
      videoThumbnailUrl: json['video_thumbnail_url'] as String?,
      videoDuration: (json['video_duration'] as num?)?.toInt(),
      orderIndex: (json['order_index'] as num).toInt(),
      duration: (json['duration_minutes'] as num?)?.toInt(),
      resources:
          (json['resources'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isPreview: json['is_preview'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$LessonModelImplToJson(_$LessonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'video_url': instance.videoUrl,
      'video_thumbnail_url': instance.videoThumbnailUrl,
      'video_duration': instance.videoDuration,
      'order_index': instance.orderIndex,
      'duration_minutes': instance.duration,
      'resources': instance.resources,
      'is_preview': instance.isPreview,
      'created_at': instance.createdAt.toIso8601String(),
    };
