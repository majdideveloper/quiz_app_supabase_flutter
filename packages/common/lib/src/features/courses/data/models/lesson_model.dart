import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/lesson_entity.dart';

part 'lesson_model.freezed.dart';
part 'lesson_model.g.dart';

/// Lesson model for data layer
///
/// This is the data layer representation of a lesson. It extends [LessonEntity]
/// and adds JSON serialization capabilities for API communication.
///
/// The model maps to the `lessons` table in Supabase:
/// - id: UUID primary key
/// - course_id: UUID reference to courses table
/// - title: Lesson title
/// - description: Lesson description
/// - content: Lesson content (text, markdown, etc.)
/// - video_url: URL to video (optional)
/// - video_thumbnail_url: URL to video thumbnail (optional)
/// - video_duration: Video duration in seconds (optional)
/// - order_index: Lesson order within course
/// - duration: Estimated duration in minutes
/// - resources: Array of resource URLs
/// - is_preview: Whether lesson is preview/free
/// - created_at: Creation timestamp
/// - updated_at: Last update timestamp
@freezed
class LessonModel with _$LessonModel {
  const factory LessonModel({
    required String id,
    @JsonKey(name: 'course_id')
    required String courseId,
    required String title,
    required String description,
    required String content,
    @JsonKey(name: 'video_url')
    String? videoUrl,
    @JsonKey(name: 'video_thumbnail_url')
    String? videoThumbnailUrl,
    @JsonKey(name: 'video_duration')
    int? videoDuration,
    @JsonKey(name: 'order_index')
    required int orderIndex,
    required int duration,
    @Default([])
    List<String> resources,
    @JsonKey(name: 'is_preview')
    @Default(false)
    bool isPreview,
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
    @JsonKey(name: 'updated_at')
    required DateTime updatedAt,
  }) = _LessonModel;

  const LessonModel._();

  /// Create LessonModel from JSON
  ///
  /// Example JSON from Supabase:
  /// ```json
  /// {
  ///   "id": "lesson-123",
  ///   "course_id": "course-456",
  ///   "title": "Introduction à l'électricité",
  ///   "description": "Les bases de l'électricité...",
  ///   "content": "Dans cette leçon, nous allons...",
  ///   "video_url": "https://example.com/video.mp4",
  ///   "video_thumbnail_url": "https://example.com/thumb.jpg",
  ///   "video_duration": 1800,
  ///   "order_index": 0,
  ///   "duration": 30,
  ///   "resources": ["https://example.com/doc1.pdf", "https://example.com/doc2.pdf"],
  ///   "is_preview": true,
  ///   "created_at": "2024-01-15T10:30:00.000Z",
  ///   "updated_at": "2024-01-20T15:45:00.000Z"
  /// }
  /// ```
  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);

  /// Convert LessonModel to domain entity
  ///
  /// This allows the data layer to return domain entities to the
  /// domain layer, maintaining clean architecture boundaries.
  LessonEntity toEntity() {
    return LessonEntity(
      id: id,
      courseId: courseId,
      title: title,
      description: description,
      content: content,
      videoUrl: videoUrl,
      videoThumbnailUrl: videoThumbnailUrl,
      videoDuration: videoDuration,
      orderIndex: orderIndex,
      duration: duration,
      resources: resources,
      isPreview: isPreview,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Create LessonModel from domain entity
  ///
  /// Useful when you need to convert a domain entity to a model
  /// for serialization or database operations.
  factory LessonModel.fromEntity(LessonEntity entity) {
    return LessonModel(
      id: entity.id,
      courseId: entity.courseId,
      title: entity.title,
      description: entity.description,
      content: entity.content,
      videoUrl: entity.videoUrl,
      videoThumbnailUrl: entity.videoThumbnailUrl,
      videoDuration: entity.videoDuration,
      orderIndex: entity.orderIndex,
      duration: entity.duration,
      resources: entity.resources,
      isPreview: entity.isPreview,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
