import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/quiz_result_entity.dart';
import '../repositories/quiz_repository.dart';

/// Use case for submitting a quiz attempt
///
/// This use case submits a user's quiz answers and calculates the result.
///
/// Usage:
/// ```dart
/// final submitQuizUseCase = getIt<SubmitQuizUseCase>();
/// final result = await submitQuizUseCase(
///   SubmitQuizParams(
///     quizId: 'quiz-123',
///     userId: 'user-456',
///     answers: {'question-1': ['answer-a'], 'question-2': ['answer-b']},
///     timeSpent: 1800,
///     startedAt: DateTime.now().subtract(Duration(minutes: 30)),
///   ),
/// );
///
/// result.fold(
///   (failure) => print('Submission failed: ${failure.message}'),
///   (quizResult) => print('Score: ${quizResult.formattedScore}'),
/// );
/// ```
@lazySingleton
class SubmitQuizUseCase {
  final QuizRepository _repository;

  SubmitQuizUseCase(this._repository);

  /// Execute the submit quiz use case
  ///
  /// Returns [QuizResultEntity] on success, or [Failure] on error.
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Invalid quiz data or answers
  /// - [NotFoundFailure]: Quiz not found
  /// - [AuthorizationFailure]: Max attempts exceeded
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database error
  Future<Either<Failure, QuizResultEntity>> call(
    SubmitQuizParams params,
  ) async {
    AppLogger.logUseCase(
      'SubmitQuizUseCase',
      'Submitting quiz: ${params.quizId} for user: ${params.userId}',
    );

    try {
      // Validate quiz ID
      if (params.quizId.isEmpty) {
        AppLogger.warning('SubmitQuizUseCase: Empty quiz ID');
        return const Left(
          ValidationFailure(
            message: 'L\'identifiant du quiz est invalide',
            code: 'INVALID_QUIZ_ID',
          ),
        );
      }

      // Validate user ID
      if (params.userId.isEmpty) {
        AppLogger.warning('SubmitQuizUseCase: Empty user ID');
        return const Left(
          ValidationFailure(
            message: 'L\'identifiant de l\'utilisateur est invalide',
            code: 'INVALID_USER_ID',
          ),
        );
      }

      // Validate answers
      if (params.answers.isEmpty) {
        AppLogger.warning('SubmitQuizUseCase: No answers provided');
        return const Left(
          ValidationFailure(
            message: 'Aucune réponse n\'a été fournie',
            code: 'NO_ANSWERS',
          ),
        );
      }

      // Validate time spent
      if (params.timeSpent < 0) {
        AppLogger.warning('SubmitQuizUseCase: Invalid time spent');
        return const Left(
          ValidationFailure(
            message: 'Le temps passé est invalide',
            code: 'INVALID_TIME_SPENT',
          ),
        );
      }

      // Validate started at
      if (params.startedAt.isAfter(DateTime.now())) {
        AppLogger.warning('SubmitQuizUseCase: Started at is in the future');
        return const Left(
          ValidationFailure(
            message: 'L\'heure de début est invalide',
            code: 'INVALID_STARTED_AT',
          ),
        );
      }

      final result = await _repository.submitQuiz(
        quizId: params.quizId,
        userId: params.userId,
        answers: params.answers,
        timeSpent: params.timeSpent,
        startedAt: params.startedAt,
      );

      return result.fold(
        (failure) {
          AppLogger.error(
            'SubmitQuizUseCase: Submission failed',
            error: failure.message,
          );
          return Left(failure);
        },
        (quizResult) {
          AppLogger.info(
            'SubmitQuizUseCase: Quiz submitted successfully. Score: ${quizResult.formattedScore}',
          );
          return Right(quizResult);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'SubmitQuizUseCase: Unexpected error',
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

/// Parameters for submit quiz use case
class SubmitQuizParams extends Equatable {
  final String quizId;
  final String userId;
  final Map<String, List<String>> answers;
  final int timeSpent;
  final DateTime startedAt;

  const SubmitQuizParams({
    required this.quizId,
    required this.userId,
    required this.answers,
    required this.timeSpent,
    required this.startedAt,
  });

  @override
  List<Object?> get props => [quizId, userId, answers, timeSpent, startedAt];
}
