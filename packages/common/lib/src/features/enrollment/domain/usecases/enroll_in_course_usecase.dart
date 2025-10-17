import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/enrollment_entity.dart';
import '../repositories/enrollment_repository.dart';

/// Use case for enrolling a user in a course
///
/// This use case handles the business logic for enrolling a user in a course,
/// including validation and error handling.
@lazySingleton
class EnrollInCourseUseCase {
  final EnrollmentRepository _repository;

  EnrollInCourseUseCase(this._repository);

  /// Execute the use case
  ///
  /// Parameters:
  /// - [userId]: The ID of the user to enroll
  /// - [courseId]: The ID of the course to enroll in
  ///
  /// Returns either a [Failure] or the created [EnrollmentEntity]
  Future<Either<Failure, EnrollmentEntity>> call({
    required String userId,
    required String courseId,
  }) async {
    // Validate user ID
    if (userId.isEmpty) {
      AppLogger.error('EnrollInCourseUseCase: Invalid user ID');
      return const Left(
        ValidationFailure(
          message: 'L\'identifiant utilisateur est invalide',
          code: 'INVALID_USER_ID',
        ),
      );
    }

    // Validate course ID
    if (courseId.isEmpty) {
      AppLogger.error('EnrollInCourseUseCase: Invalid course ID');
      return const Left(
        ValidationFailure(
          message: 'L\'identifiant du cours est invalide',
          code: 'INVALID_COURSE_ID',
        ),
      );
    }

    AppLogger.logUseCase('EnrollInCourseUseCase', {
      'userId': userId,
      'courseId': courseId,
    });

    final result = await _repository.enrollInCourse(
      userId: userId,
      courseId: courseId,
    );

    return result.fold(
      (failure) {
        AppLogger.error(
          'EnrollInCourseUseCase: Failed to enroll user',
          error: failure,
        );
        return Left(failure);
      },
      (enrollment) {
        AppLogger.info(
          'EnrollInCourseUseCase: User enrolled successfully',
          error: {
            'enrollmentId': enrollment.id,
            'userId': enrollment.userId,
            'courseId': enrollment.courseId,
          },
        );
        return Right(enrollment);
      },
    );
  }
}
