import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_entity.freezed.dart';

/// Lesson entity representing a single lesson within a course
///
/// This is the domain layer representation of a lesson in the Formation Métiers app.
/// Each lesson belongs to a course and contains educational content (video, text, etc.).
///
/// Properties:
/// - [id]: Unique identifier (UUID)
/// - [courseId]: ID of the parent course
/// - [title]: Lesson title
/// - [description]: Lesson description/summary
/// - [content]: Lesson content (rich text, markdown, etc.)
/// - [videoUrl]: URL to lesson video (optional)
/// - [videoThumbnailUrl]: URL to video thumbnail (optional)
/// - [videoDuration]: Video duration in seconds (optional)
/// - [orderIndex]: Order of the lesson within the course (0-based)
/// - [duration]: Estimated lesson duration in minutes
/// - [resources]: List of resource URLs (PDFs, documents, etc.)
/// - [isPreview]: Whether this lesson is available as a preview
/// - [createdAt]: Lesson creation timestamp
/// - [updatedAt]: Last update timestamp
@freezed
class LessonEntity with _$LessonEntity {
  const factory LessonEntity({
    required String id,
    required String courseId,
    required String title,
    required String description,
    @Default('') String content,
    String? videoUrl,
    String? videoThumbnailUrl,
    int? videoDuration,
    required int orderIndex,
    int? duration,
    @Default([]) List<String> resources,
    @Default(false) bool isPreview,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _LessonEntity;

  const LessonEntity._();

  /// Check if the lesson has video content
  bool get hasVideo => videoUrl != null && videoUrl!.isNotEmpty;

  /// Check if the lesson has resources
  bool get hasResources => resources.isNotEmpty;

  /// Get formatted duration (e.g., "15 min" or "1h 30min")
  String get formattedDuration {
    if (duration == null) return '-';
    if (duration! < 60) {
      return '$duration min';
    }
    final hours = duration! ~/ 60;
    final minutes = duration! % 60;
    if (minutes == 0) {
      return '$hours h';
    }
    return '$hours h $minutes min';
  }

  /// Get formatted video duration (e.g., "15:30" or "1:25:45")
  String get formattedVideoDuration {
    if (videoDuration == null) return '';

    final hours = videoDuration! ~/ 3600;
    final minutes = (videoDuration! % 3600) ~/ 60;
    final seconds = videoDuration! % 60;

    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Get lesson number (1-based)
  int get lessonNumber => orderIndex + 1;

  /// Get display title with lesson number (e.g., "Leçon 1: Introduction")
  String get displayTitle => 'Leçon $lessonNumber: $title';

  /// Check if the lesson has a video thumbnail
  bool get hasVideoThumbnail => videoThumbnailUrl != null && videoThumbnailUrl!.isNotEmpty;

  /// Get content preview (first 150 characters)
  String get contentPreview {
    if (content.length <= 150) return content;
    return '${content.substring(0, 150)}...';
  }

  /// Get resource count
  int get resourceCount => resources.length;
}

/// Lesson content type enumeration
///
/// Represents the type of content in a lesson:
/// - [video]: Video-based lesson
/// - [text]: Text/article-based lesson
/// - [mixed]: Combination of video and text
/// - [interactive]: Interactive content (quizzes, exercises)
enum LessonContentType {
  video,
  text,
  mixed,
  interactive,
}
