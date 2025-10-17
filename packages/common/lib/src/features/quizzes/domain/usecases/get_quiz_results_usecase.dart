import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/quiz_result_entity.dart';
import '../repositories/quiz_repository.dart';

/// Use case for getting a user's quiz results for a specific quiz
///
/// This use case retrieves all attempts by a user for a specific quiz.
///
/// Usage:
/// ```dart
/// final getQuizResultsUseCase = getIt<GetQuizResultsUseCase>();
/// final result = await getQuizResultsUseCase(
///   GetQuizResultsParams(
///     quizId: 'quiz-123',
///     userId: 'user-456',
///   ),
/// );
///
/// result.fold(
///   (failure) => print('Failed to load results'),
///   (results) => print('Loaded ${results.length} attempts'),
/// );
/// ```
@lazySingleton
class GetQuizResultsUseCase {
  final QuizRepository _repository;

  GetQuizResultsUseCase(this._repository);

  /// Execute the get quiz results use case
  ///
  /// Returns a list of [QuizResultEntity] on success, or [Failure] on error.
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Invalid quiz or user ID
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, List<QuizResultEntity>>> call(
    GetQuizResultsParams params,
  ) async {
    AppLogger.logUseCase(
      'GetQuizResultsUseCase',
      'Fetching results for quiz: ${params.quizId}, user: ${params.userId}',
    );

    try {
      // Validate quiz ID
      if (params.quizId.isEmpty) {
        AppLogger.warning('GetQuizResultsUseCase: Empty quiz ID');
        return const Left(
          ValidationFailure(
            message: 'L\'identifiant du quiz est invalide',
            code: 'INVALID_QUIZ_ID',
          ),
        );
      }

      // Validate user ID
      if (params.userId.isEmpty) {
        AppLogger.warning('GetQuizResultsUseCase: Empty user ID');
        return const Left(
          ValidationFailure(
            message: 'L\'identifiant de l\'utilisateur est invalide',
            code: 'INVALID_USER_ID',
          ),
        );
      }

      final result = await _repository.getUserQuizResults(
        quizId: params.quizId,
        userId: params.userId,
      );

      return result.fold(
        (failure) {
          AppLogger.error(
            'GetQuizResultsUseCase: Failed to fetch results',
            error: failure.message,
          );
          return Left(failure);
        },
        (results) {
          AppLogger.info(
            'GetQuizResultsUseCase: Successfully fetched ${results.length} results',
          );
          return Right(results);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'GetQuizResultsUseCase: Unexpected error',
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

/// Parameters for get quiz results use case
class GetQuizResultsParams extends Equatable {
  final String quizId;
  final String userId;

  const GetQuizResultsParams({
    required this.quizId,
    required this.userId,
  });

  @override
  List<Object?> get props => [quizId, userId];
}
