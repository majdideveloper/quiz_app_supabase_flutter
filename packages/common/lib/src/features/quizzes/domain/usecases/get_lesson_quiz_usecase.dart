import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/quiz_entity.dart';
import '../repositories/quiz_repository.dart';

/// Use case for getting a quiz for a specific lesson
///
/// This use case retrieves the quiz associated with a lesson.
///
/// Usage:
/// ```dart
/// final getLessonQuizUseCase = getIt<GetLessonQuizUseCase>();
/// final result = await getLessonQuizUseCase(
///   GetLessonQuizParams(lessonId: 'lesson-123'),
/// );
///
/// result.fold(
///   (failure) => print('Quiz not found: ${failure.message}'),
///   (quiz) => print('Quiz: ${quiz.title}'),
/// );
/// ```
@lazySingleton
class GetLessonQuizUseCase {
  final QuizRepository _repository;

  GetLessonQuizUseCase(this._repository);

  /// Execute the get lesson quiz use case
  ///
  /// Returns [QuizEntity] on success, or [Failure] on error.
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Invalid lesson ID
  /// - [NotFoundFailure]: Quiz not found for this lesson
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, QuizEntity>> call(GetLessonQuizParams params) async {
    AppLogger.logUseCase(
      'GetLessonQuizUseCase',
      'Fetching quiz for lesson: ${params.lessonId}',
    );

    try {
      // Validate lesson ID
      if (params.lessonId.isEmpty) {
        AppLogger.warning('GetLessonQuizUseCase: Empty lesson ID');
        return const Left(
          ValidationFailure(
            message: 'L\'identifiant de la leçon est invalide',
            code: 'INVALID_LESSON_ID',
          ),
        );
      }

      final result = await _repository.getLessonQuiz(params.lessonId);

      return result.fold(
        (failure) {
          AppLogger.error(
            'GetLessonQuizUseCase: Failed to fetch quiz',
            error: failure.message,
          );
          return Left(failure);
        },
        (quiz) {
          AppLogger.info(
            'GetLessonQuizUseCase: Successfully fetched quiz "${quiz.title}"',
          );
          return Right(quiz);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'GetLessonQuizUseCase: Unexpected error',
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

/// Parameters for get lesson quiz use case
class GetLessonQuizParams extends Equatable {
  final String lessonId;

  const GetLessonQuizParams({
    required this.lessonId,
  });

  @override
  List<Object?> get props => [lessonId];
}
