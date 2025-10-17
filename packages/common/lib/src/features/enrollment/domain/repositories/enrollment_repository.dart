import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/enrollment_entity.dart';
import '../entities/user_progress_entity.dart';

/// Repository interface for enrollment operations
///
/// This interface defines the contract for enrollment data operations.
/// Implementations should handle enrollment management, progress tracking,
/// and course completion.
abstract class EnrollmentRepository {
  /// Enroll a user in a course
  ///
  /// Creates a new enrollment for the user in the specified course.
  /// Returns the created enrollment or a failure.
  ///
  /// Throws:
  /// - [ValidationFailure] if the user or course is invalid
  /// - [AuthorizationFailure] if the user is not authorized
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, EnrollmentEntity>> enrollInCourse({
    required String userId,
    required String courseId,
  });

  /// Get all enrollments for a user
  ///
  /// Returns a list of all enrollments for the specified user.
  ///
  /// Throws:
  /// - [ValidationFailure] if the user ID is invalid
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, List<EnrollmentEntity>>> getUserEnrollments(
    String userId,
  );

  /// Get a specific enrollment by ID
  ///
  /// Returns the enrollment with the specified ID.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the enrollment is not found
  /// - [ValidationFailure] if the enrollment ID is invalid
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, EnrollmentEntity>> getEnrollmentById(
    String enrollmentId,
  );

  /// Get enrollment for a specific course and user
  ///
  /// Returns the enrollment for the specified course and user.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the enrollment is not found
  /// - [ValidationFailure] if the IDs are invalid
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, EnrollmentEntity>> getCourseEnrollment({
    required String userId,
    required String courseId,
  });

  /// Update enrollment progress
  ///
  /// Updates the progress and status of an enrollment.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the enrollment is not found
  /// - [ValidationFailure] if the data is invalid
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, EnrollmentEntity>> updateEnrollmentProgress({
    required String enrollmentId,
    required int progress,
    required int completedLessons,
  });

  /// Drop an enrollment
  ///
  /// Marks an enrollment as dropped.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the enrollment is not found
  /// - [ValidationFailure] if the enrollment ID is invalid
  /// - [AuthorizationFailure] if the user is not authorized
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, EnrollmentEntity>> dropEnrollment(
    String enrollmentId,
  );

  /// Get lesson progress for a user
  ///
  /// Returns the progress record for a specific lesson and enrollment.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the progress is not found
  /// - [ValidationFailure] if the IDs are invalid
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, UserProgressEntity>> getLessonProgress({
    required String enrollmentId,
    required String lessonId,
  });

  /// Get all lesson progress for an enrollment
  ///
  /// Returns all progress records for the specified enrollment.
  ///
  /// Throws:
  /// - [ValidationFailure] if the enrollment ID is invalid
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, List<UserProgressEntity>>> getEnrollmentProgress(
    String enrollmentId,
  );

  /// Update lesson progress
  ///
  /// Updates or creates a progress record for a lesson.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the enrollment or lesson is not found
  /// - [ValidationFailure] if the data is invalid
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, UserProgressEntity>> updateLessonProgress({
    required String enrollmentId,
    required String lessonId,
    required int timeSpent,
    required int videoProgress,
    required bool completed,
  });

  /// Mark lesson as completed
  ///
  /// Marks a lesson as completed and updates the enrollment progress.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the enrollment or lesson is not found
  /// - [ValidationFailure] if the IDs are invalid
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, UserProgressEntity>> completeLessonProgress({
    required String enrollmentId,
    required String lessonId,
  });

  /// Get active enrollments for a user
  ///
  /// Returns all active (enrolled or in-progress) enrollments for a user.
  ///
  /// Throws:
  /// - [ValidationFailure] if the user ID is invalid
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, List<EnrollmentEntity>>> getActiveEnrollments(
    String userId,
  );

  /// Get completed enrollments for a user
  ///
  /// Returns all completed enrollments for a user.
  ///
  /// Throws:
  /// - [ValidationFailure] if the user ID is invalid
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, List<EnrollmentEntity>>> getCompletedEnrollments(
    String userId,
  );

  /// Check if user is enrolled in a course
  ///
  /// Returns true if the user has an active enrollment in the course.
  ///
  /// Throws:
  /// - [ValidationFailure] if the IDs are invalid
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, bool>> isUserEnrolled({
    required String userId,
    required String courseId,
  });
}
