import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/course_entity.dart';
import '../repositories/course_repository.dart';

/// Use case for getting all published courses
///
/// This use case retrieves all published courses from the repository.
/// Courses are returned ordered by creation date (newest first).
///
/// Usage:
/// ```dart
/// final getCoursesUseCase = getIt<GetCoursesUseCase>();
/// final result = await getCoursesUseCase();
///
/// result.fold(
///   (failure) => print('Failed to load courses: ${failure.message}'),
///   (courses) => print('Loaded ${courses.length} courses'),
/// );
/// ```
@lazySingleton
class GetCoursesUseCase {
  final CourseRepository _repository;

  GetCoursesUseCase(this._repository);

  /// Execute the get courses use case
  ///
  /// Returns a list of [CourseEntity] on success, or [Failure] on error.
  ///
  /// Possible failures:
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, List<CourseEntity>>> call() async {
    AppLogger.logUseCase('GetCoursesUseCase', 'Fetching all published courses');

    try {
      final result = await _repository.getCourses();

      return result.fold(
        (failure) {
          AppLogger.error(
            'GetCoursesUseCase: Failed to fetch courses',
            error: failure.message,
          );
          return Left(failure);
        },
        (courses) {
          AppLogger.info(
            'GetCoursesUseCase: Successfully fetched ${courses.length} courses',
          );
          return Right(courses);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'GetCoursesUseCase: Unexpected error',
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
