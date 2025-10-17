import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/course_entity.dart';
import '../repositories/course_repository.dart';

/// Use case for getting a single course by ID
///
/// This use case retrieves detailed information about a specific course
/// using its unique identifier.
///
/// Usage:
/// ```dart
/// final getCourseByIdUseCase = getIt<GetCourseByIdUseCase>();
/// final result = await getCourseByIdUseCase(
///   GetCourseByIdParams(courseId: 'course-123'),
/// );
///
/// result.fold(
///   (failure) => print('Course not found: ${failure.message}'),
///   (course) => print('Course: ${course.title}'),
/// );
/// ```
@lazySingleton
class GetCourseByIdUseCase {
  final CourseRepository _repository;

  GetCourseByIdUseCase(this._repository);

  /// Execute the get course by ID use case
  ///
  /// Returns [CourseEntity] on success, or [Failure] on error.
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Invalid course ID
  /// - [NotFoundFailure]: Course not found
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, CourseEntity>> call(GetCourseByIdParams params) async {
    AppLogger.logUseCase(
      'GetCourseByIdUseCase',
      'Fetching course with ID: ${params.courseId}',
    );

    try {
      // Validate course ID
      if (params.courseId.isEmpty) {
        AppLogger.warning('GetCourseByIdUseCase: Empty course ID');
        return const Left(
          ValidationFailure(
            message: 'L\'identifiant du cours est invalide',
            code: 'INVALID_COURSE_ID',
          ),
        );
      }

      final result = await _repository.getCourseById(params.courseId);

      return result.fold(
        (failure) {
          AppLogger.error(
            'GetCourseByIdUseCase: Failed to fetch course',
            error: failure.message,
          );
          return Left(failure);
        },
        (course) {
          AppLogger.info(
            'GetCourseByIdUseCase: Successfully fetched course "${course.title}"',
          );
          return Right(course);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'GetCourseByIdUseCase: Unexpected error',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }
}

/// Parameters for get course by ID use case
class GetCourseByIdParams extends Equatable {
  final String courseId;

  const GetCourseByIdParams({
    required this.courseId,
  });

  @override
  List<Object?> get props => [courseId];
}
