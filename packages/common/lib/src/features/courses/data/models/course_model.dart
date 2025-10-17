import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/course_entity.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

/// Course model for data layer
///
/// This is the data layer representation of a course. It extends [CourseEntity]
/// and adds JSON serialization capabilities for API communication.
///
/// The model maps to the `courses` table in Supabase:
/// - id: UUID primary key
/// - title: Course title
/// - description: Course description
/// - category: Course category (ccq/non_construction/red_seal)
/// - thumbnail_url: URL to course image
/// - instructor_id: UUID reference to profiles table
/// - instructor_name: Instructor's display name (from join)
/// - price: Course price in CAD
/// - duration: Duration in minutes
/// - level: Difficulty level
/// - is_published: Published status
/// - enrollment_count: Number of enrollments
/// - rating: Average rating (0-5)
/// - rating_count: Number of ratings
/// - created_at: Creation timestamp
/// - updated_at: Last update timestamp
@freezed
class CourseModel with _$CourseModel {
  const factory CourseModel({
    required String id,
    required String title,
    required String description,
    required CourseCategory category,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    @JsonKey(name: 'instructor_id') required String instructorId,
    @JsonKey(name: 'instructor_name') required String instructorName,
    required double price,
    required int duration,
    required CourseLevel level,
    @JsonKey(name: 'is_published') required bool isPublished,
    @JsonKey(name: 'enrollment_count') @Default(0) int enrollmentCount,
    @Default(0.0) double rating,
    @JsonKey(name: 'rating_count') @Default(0) int ratingCount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _CourseModel;

  const CourseModel._();

  /// Create CourseModel from JSON
  ///
  /// Example JSON from Supabase:
  /// ```json
  /// {
  ///   "id": "123e4567-e89b-12d3-a456-426614174000",
  ///   "title": "Électricien CCQ",
  ///   "description": "Formation complète pour devenir électricien...",
  ///   "category": "ccq",
  ///   "thumbnail_url": "https://example.com/course.jpg",
  ///   "instructor_id": "instructor-123",
  ///   "instructor_name": "Jean Tremblay",
  ///   "price": 299.99,
  ///   "duration": 900,
  ///   "level": "beginner",
  ///   "is_published": true,
  ///   "enrollment_count": 150,
  ///   "rating": 4.5,
  ///   "rating_count": 45,
  ///   "created_at": "2024-01-15T10:30:00.000Z",
  ///   "updated_at": "2024-01-20T15:45:00.000Z"
  /// }
  /// ```
  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);

  /// Convert CourseModel to domain entity
  ///
  /// This allows the data layer to return domain entities to the
  /// domain layer, maintaining clean architecture boundaries.
  CourseEntity toEntity() {
    return CourseEntity(
      id: id,
      title: title,
      description: description,
      category: category,
      thumbnailUrl: thumbnailUrl,
      instructorId: instructorId,
      instructorName: instructorName,
      price: price,
      duration: duration,
      level: level,
      isPublished: isPublished,
      enrollmentCount: enrollmentCount,
      rating: rating,
      ratingCount: ratingCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Create CourseModel from domain entity
  ///
  /// Useful when you need to convert a domain entity to a model
  /// for serialization or database operations.
  factory CourseModel.fromEntity(CourseEntity entity) {
    return CourseModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      category: entity.category,
      thumbnailUrl: entity.thumbnailUrl,
      instructorId: entity.instructorId,
      instructorName: entity.instructorName,
      price: entity.price,
      duration: entity.duration,
      level: entity.level,
      isPublished: entity.isPublished,
      enrollmentCount: entity.enrollmentCount,
      rating: entity.rating,
      ratingCount: entity.ratingCount,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Create CourseModel from Supabase query result with instructor join
  ///
  /// This is used when fetching courses with instructor information
  /// from a joined query.
  factory CourseModel.fromSupabaseWithInstructor(Map<String, dynamic> json) {
    // Extract instructor name from nested profile object if present
    String instructorName = 'Unknown';
    if (json.containsKey('profiles') && json['profiles'] != null) {
      final profile = json['profiles'] as Map<String, dynamic>;
      instructorName = profile['full_name'] ?? profile['email'] ?? 'Unknown';
    } else if (json.containsKey('instructor_name')) {
      instructorName = json['instructor_name'] as String;
    }

    return CourseModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: _parseCourseCategory(json['category'] as String),
      thumbnailUrl: json['thumbnail_url'] as String?,
      instructorId: json['instructor_id'] as String,
      instructorName: instructorName,
      price: (json['price'] as num).toDouble(),
      duration: json['duration'] as int,
      level: _parseCourseLevel(json['level'] as String),
      isPublished: json['is_published'] as bool,
      enrollmentCount: json['enrollment_count'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      ratingCount: json['rating_count'] as int? ?? 0,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  /// Parse course category from string
  static CourseCategory _parseCourseCategory(String category) {
    switch (category) {
      case 'ccq':
        return CourseCategory.ccq;
      case 'non_construction':
        return CourseCategory.nonConstruction;
      case 'red_seal':
        return CourseCategory.redSeal;
      default:
        throw ArgumentError('Invalid course category: $category');
    }
  }

  /// Parse course level from string
  static CourseLevel _parseCourseLevel(String level) {
    switch (level) {
      case 'beginner':
        return CourseLevel.beginner;
      case 'intermediate':
        return CourseLevel.intermediate;
      case 'advanced':
        return CourseLevel.advanced;
      case 'expert':
        return CourseLevel.expert;
      default:
        throw ArgumentError('Invalid course level: $level');
    }
  }
}
