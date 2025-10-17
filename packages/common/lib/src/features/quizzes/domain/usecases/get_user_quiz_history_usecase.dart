import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/quiz_result_entity.dart';
import '../repositories/quiz_repository.dart';

/// Use case for getting a user's complete quiz history
///
/// This use case retrieves all quiz attempts by a user across all courses.
///
/// Usage:
/// ```dart
/// final getUserQuizHistoryUseCase = getIt<GetUserQuizHistoryUseCase>();
/// final result = await getUserQuizHistoryUseCase(
///   GetUserQuizHistoryParams(
///     userId: 'user-456',
///     limit: 20,
///   ),
/// );
///
/// result.fold(
///   (failure) => print('Failed to load history'),
///   (history) => print('Loaded ${history.length} quiz attempts'),
/// );
/// ```
@lazySingleton
class GetUserQuizHistoryUseCase {
  final QuizRepository _repository;

  GetUserQuizHistoryUseCase(this._repository);

  /// Execute the get user quiz history use case
  ///
  /// Returns a list of [QuizResultEntity] on success, or [Failure] on error.
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Invalid user ID
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, List<QuizResultEntity>>> call(
    GetUserQuizHistoryParams params,
  ) async {
    AppLogger.logUseCase(
      'GetUserQuizHistoryUseCase',
      'Fetching quiz history for user: ${params.userId}',
    );

    try {
      // Validate user ID
      if (params.userId.isEmpty) {
        AppLogger.warning('GetUserQuizHistoryUseCase: Empty user ID');
        return const Left(
          ValidationFailure(
            message: 'L\'identifiant de l\'utilisateur est invalide',
            code: 'INVALID_USER_ID',
          ),
        );
      }

      final result = await _repository.getUserQuizHistory(
        userId: params.userId,
        limit: params.limit,
      );

      return result.fold(
        (failure) {
          AppLogger.error(
            'GetUserQuizHistoryUseCase: Failed to fetch history',
            error: failure.message,
          );
          return Left(failure);
        },
        (history) {
          AppLogger.info(
            'GetUserQuizHistoryUseCase: Successfully fetched ${history.length} quiz attempts',
          );
          return Right(history);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'GetUserQuizHistoryUseCase: Unexpected error',
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

/// Parameters for get user quiz history use case
class GetUserQuizHistoryParams extends Equatable {
  final String userId;
  final int? limit;

  const GetUserQuizHistoryParams({
    required this.userId,
    this.limit,
  });

  @override
  List<Object?> get props => [userId, limit];
}
