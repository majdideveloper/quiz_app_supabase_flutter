import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_entity.freezed.dart';

/// Course entity representing a training course
///
/// This is the domain layer representation of a course in the Formation Métiers app.
/// Each course belongs to a category (CCQ, Non-construction, Red Seal) and contains
/// lessons and quizzes.
///
/// Properties:
/// - [id]: Unique identifier (UUID)
/// - [title]: Course title (e.g., "Électricien CCQ")
/// - [description]: Detailed course description
/// - [category]: Course category (ccq, non_construction, red_seal)
/// - [thumbnailUrl]: URL to course thumbnail/cover image
/// - [instructorId]: ID of the instructor who created the course
/// - [instructorName]: Display name of the instructor
/// - [price]: Course price in CAD (0 for free courses)
/// - [duration]: Estimated course duration in hours
/// - [level]: Course difficulty level
/// - [isPublished]: Whether the course is published and visible
/// - [enrollmentCount]: Number of students enrolled
/// - [rating]: Average course rating (0-5)
/// - [ratingCount]: Number of ratings
/// - [createdAt]: Course creation timestamp
/// - [updatedAt]: Last update timestamp
@freezed
class CourseEntity with _$CourseEntity {
  const factory CourseEntity({
    required String id,
    required String title,
    required String description,
    required CourseCategory category,
    String? thumbnailUrl,
    required String instructorId,
    required String instructorName,
    required double price,
    required int duration,
    required CourseLevel level,
    required bool isPublished,
    @Default(0) int enrollmentCount,
    @Default(0.0) double rating,
    @Default(0) int ratingCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CourseEntity;

  const CourseEntity._();

  /// Check if the course is free
  bool get isFree => price == 0.0;

  /// Check if the course is paid
  bool get isPaid => price > 0.0;

  /// Get formatted price (e.g., "99,99 $" or "Gratuit")
  String get formattedPrice {
    if (isFree) return 'Gratuit';
    return '${price.toStringAsFixed(2).replaceAll('.', ',')} \$';
  }

  /// Get formatted duration (e.g., "15h" or "2h30")
  String get formattedDuration {
    final hours = duration ~/ 60;
    final minutes = duration % 60;
    if (minutes == 0) {
      return '${hours}h';
    }
    return '${hours}h${minutes.toString().padLeft(2, '0')}';
  }

  /// Get formatted rating (e.g., "4.5" or "Pas de notes")
  String get formattedRating {
    if (ratingCount == 0) return 'Pas de notes';
    return rating.toStringAsFixed(1);
  }

  /// Check if the course has a thumbnail
  bool get hasThumbnail => thumbnailUrl != null && thumbnailUrl!.isNotEmpty;

  /// Check if the course is popular (> 50 enrollments)
  bool get isPopular => enrollmentCount > 50;

  /// Check if the course is highly rated (>= 4.0)
  bool get isHighlyRated => rating >= 4.0 && ratingCount >= 5;

  /// Get category display name in French
  String get categoryDisplayName {
    switch (category) {
      case CourseCategory.ccq:
        return 'CCQ';
      case CourseCategory.nonConstruction:
        return 'Non-Construction';
      case CourseCategory.redSeal:
        return 'Sceau Rouge';
    }
  }

  /// Get level display name in French
  String get levelDisplayName {
    switch (level) {
      case CourseLevel.beginner:
        return 'Débutant';
      case CourseLevel.intermediate:
        return 'Intermédiaire';
      case CourseLevel.advanced:
        return 'Avancé';
      case CourseLevel.expert:
        return 'Expert';
    }
  }
}

/// Course category enumeration
///
/// Represents the three main course categories in Formation Métiers:
/// - [ccq]: CCQ (Commission de la construction du Québec) certification courses
/// - [nonConstruction]: Non-construction related courses
/// - [redSeal]: Red Seal (Sceau Rouge) certification courses
enum CourseCategory {
  @JsonValue('ccq')
  ccq,
  @JsonValue('non_construction')
  nonConstruction,
  @JsonValue('red_seal')
  redSeal,
}

/// Course difficulty level enumeration
///
/// Represents the difficulty level of a course:
/// - [beginner]: Beginner level - no prerequisites
/// - [intermediate]: Intermediate level - some experience required
/// - [advanced]: Advanced level - significant experience required
/// - [expert]: Expert level - professional level
enum CourseLevel {
  @JsonValue('beginner')
  beginner,
  @JsonValue('intermediate')
  intermediate,
  @JsonValue('advanced')
  advanced,
  @JsonValue('expert')
  expert,
}
