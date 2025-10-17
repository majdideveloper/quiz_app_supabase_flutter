import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/lesson_entity.dart';
import '../repositories/course_repository.dart';

/// Use case for getting all lessons for a specific course
///
/// This use case retrieves all lessons belonging to a course,
/// ordered by their orderIndex (lesson sequence).
///
/// Usage:
/// ```dart
/// final getCourseLessonsUseCase = getIt<GetCourseLessonsUseCase>();
/// final result = await getCourseLessonsUseCase(
///   GetCourseLessonsParams(courseId: 'course-123'),
/// );
///
/// result.fold(
///   (failure) => print('Failed to load lessons: ${failure.message}'),
///   (lessons) => print('Loaded ${lessons.length} lessons'),
/// );
/// ```
@lazySingleton
class GetCourseLessonsUseCase {
  final CourseRepository _repository;

  GetCourseLessonsUseCase(this._repository);

  /// Execute the get course lessons use case
  ///
  /// Returns a list of [LessonEntity] on success, or [Failure] on error.
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Invalid course ID
  /// - [NotFoundFailure]: Course not found
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, List<LessonEntity>>> call(
    GetCourseLessonsParams params,
  ) async {
    AppLogger.logUseCase(
      'GetCourseLessonsUseCase',
      'Fetching lessons for course: ${params.courseId}',
    );

    try {
      // Validate course ID
      if (params.courseId.isEmpty) {
        AppLogger.warning('GetCourseLessonsUseCase: Empty course ID');
        return const Left(
          ValidationFailure(
            message: 'L\'identifiant du cours est invalide',
            code: 'INVALID_COURSE_ID',
          ),
        );
      }

      final result = await _repository.getCourseLessons(params.courseId);

      return result.fold(
        (failure) {
          AppLogger.error(
            'GetCourseLessonsUseCase: Failed to fetch lessons',
            error: failure.message,
          );
          return Left(failure);
        },
        (lessons) {
          AppLogger.info(
            'GetCourseLessonsUseCase: Successfully fetched ${lessons.length} lessons',
          );
          return Right(lessons);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'GetCourseLessonsUseCase: Unexpected error',
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

/// Parameters for get course lessons use case
class GetCourseLessonsParams extends Equatable {
  final String courseId;

  const GetCourseLessonsParams({
    required this.courseId,
  });

  @override
  List<Object?> get props => [courseId];
}
