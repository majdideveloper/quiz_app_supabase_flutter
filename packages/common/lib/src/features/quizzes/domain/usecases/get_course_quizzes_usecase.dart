import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/quiz_entity.dart';
import '../repositories/quiz_repository.dart';

/// Use case for getting all quizzes for a course
///
/// This use case retrieves all quizzes (lesson, midterm, final) for a course.
///
/// Usage:
/// ```dart
/// final getCourseQuizzesUseCase = getIt<GetCourseQuizzesUseCase>();
/// final result = await getCourseQuizzesUseCase(
///   GetCourseQuizzesParams(courseId: 'course-123'),
/// );
///
/// result.fold(
///   (failure) => print('Failed to load quizzes'),
///   (quizzes) => print('Loaded ${quizzes.length} quizzes'),
/// );
/// ```
@lazySingleton
class GetCourseQuizzesUseCase {
  final QuizRepository _repository;

  GetCourseQuizzesUseCase(this._repository);

  /// Execute the get course quizzes use case
  ///
  /// Returns a list of [QuizEntity] on success, or [Failure] on error.
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Invalid course ID
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, List<QuizEntity>>> call(
    GetCourseQuizzesParams params,
  ) async {
    AppLogger.logUseCase(
      'GetCourseQuizzesUseCase',
      'Fetching quizzes for course: ${params.courseId}',
    );

    try {
      // Validate course ID
      if (params.courseId.isEmpty) {
        AppLogger.warning('GetCourseQuizzesUseCase: Empty course ID');
        return const Left(
          ValidationFailure(
            message: 'L\'identifiant du cours est invalide',
            code: 'INVALID_COURSE_ID',
          ),
        );
      }

      final result = await _repository.getCourseQuizzes(params.courseId);

      return result.fold(
        (failure) {
          AppLogger.error(
            'GetCourseQuizzesUseCase: Failed to fetch quizzes',
            error: failure.message,
          );
          return Left(failure);
        },
        (quizzes) {
          AppLogger.info(
            'GetCourseQuizzesUseCase: Successfully fetched ${quizzes.length} quizzes',
          );
          return Right(quizzes);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'GetCourseQuizzesUseCase: Unexpected error',
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

/// Parameters for get course quizzes use case
class GetCourseQuizzesParams extends Equatable {
  final String courseId;

  const GetCourseQuizzesParams({
    required this.courseId,
  });

  @override
  List<Object?> get props => [courseId];
}
