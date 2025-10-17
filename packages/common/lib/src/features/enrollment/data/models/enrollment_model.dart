import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/enrollment_entity.dart';

part 'enrollment_model.freezed.dart';
part 'enrollment_model.g.dart';

/// Enrollment model for data layer
///
/// This is the data layer representation of an enrollment. It extends [EnrollmentEntity]
/// and adds JSON serialization capabilities for API communication.
///
/// The model maps to the `enrollments` table in Supabase.
@freezed
class EnrollmentModel with _$EnrollmentModel {
  const factory EnrollmentModel({
    required String id,
    @JsonKey(name: 'user_id')
    required String userId,
    @JsonKey(name: 'course_id')
    required String courseId,
    required EnrollmentStatus status,
    @JsonKey(name: 'enrolled_at')
    required DateTime enrolledAt,
    @JsonKey(name: 'completed_at')
    DateTime? completedAt,
    @JsonKey(name: 'dropped_at')
    DateTime? droppedAt,
    @Default(0)
    int progress,
    @JsonKey(name: 'completed_lessons')
    @Default(0)
    int completedLessons,
    @JsonKey(name: 'total_lessons')
    required int totalLessons,
    @JsonKey(name: 'time_spent')
    @Default(0)
    int timeSpent,
    @JsonKey(name: 'last_accessed_at')
    DateTime? lastAccessedAt,
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
    @JsonKey(name: 'updated_at')
    required DateTime updatedAt,
  }) = _EnrollmentModel;

  const EnrollmentModel._();

  /// Create EnrollmentModel from JSON
  factory EnrollmentModel.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentModelFromJson(json);

  /// Convert EnrollmentModel to domain entity
  EnrollmentEntity toEntity() {
    return EnrollmentEntity(
      id: id,
      userId: userId,
      courseId: courseId,
      status: status,
      enrolledAt: enrolledAt,
      completedAt: completedAt,
      droppedAt: droppedAt,
      progress: progress,
      completedLessons: completedLessons,
      totalLessons: totalLessons,
      timeSpent: timeSpent,
      lastAccessedAt: lastAccessedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Create EnrollmentModel from domain entity
  factory EnrollmentModel.fromEntity(EnrollmentEntity entity) {
    return EnrollmentModel(
      id: entity.id,
      userId: entity.userId,
      courseId: entity.courseId,
      status: entity.status,
      enrolledAt: entity.enrolledAt,
      completedAt: entity.completedAt,
      droppedAt: entity.droppedAt,
      progress: entity.progress,
      completedLessons: entity.completedLessons,
      totalLessons: entity.totalLessons,
      timeSpent: entity.timeSpent,
      lastAccessedAt: entity.lastAccessedAt,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
