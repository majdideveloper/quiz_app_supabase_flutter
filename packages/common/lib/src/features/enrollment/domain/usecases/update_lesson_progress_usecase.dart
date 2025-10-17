import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/user_progress_entity.dart';
import '../repositories/enrollment_repository.dart';

/// Parameters for updating lesson progress
class UpdateLessonProgressParams {
  final String enrollmentId;
  final String lessonId;
  final int timeSpent;
  final int videoProgress;
  final bool completed;

  const UpdateLessonProgressParams({
    required this.enrollmentId,
    required this.lessonId,
    required this.timeSpent,
    required this.videoProgress,
    required this.completed,
  });
}

/// Use case for updating lesson progress
///
/// This use case handles the business logic for updating a user's progress
/// on a specific lesson, including validation and error handling.
@lazySingleton
class UpdateLessonProgressUseCase {
  final EnrollmentRepository _repository;

  UpdateLessonProgressUseCase(this._repository);

  /// Execute the use case
  ///
  /// Parameters:
  /// - [params]: The parameters for updating progress
  ///
  /// Returns either a [Failure] or the updated [UserProgressEntity]
  Future<Either<Failure, UserProgressEntity>> call(
    UpdateLessonProgressParams params,
  ) async {
    // Validate enrollment ID
    if (params.enrollmentId.isEmpty) {
      AppLogger.error('UpdateLessonProgressUseCase: Invalid enrollment ID');
      return const Left(
        ValidationFailure(
          message: 'L\'identifiant d\'inscription est invalide',
          code: 'INVALID_ENROLLMENT_ID',
        ),
      );
    }

    // Validate lesson ID
    if (params.lessonId.isEmpty) {
      AppLogger.error('UpdateLessonProgressUseCase: Invalid lesson ID');
      return const Left(
        ValidationFailure(
          message: 'L\'identifiant de la leçon est invalide',
          code: 'INVALID_LESSON_ID',
        ),
      );
    }

    // Validate time spent (must be non-negative)
    if (params.timeSpent < 0) {
      AppLogger.error('UpdateLessonProgressUseCase: Invalid time spent');
      return const Left(
        ValidationFailure(
          message: 'Le temps passé doit être positif',
          code: 'INVALID_TIME_SPENT',
        ),
      );
    }

    // Validate video progress (must be between 0 and 100)
    if (params.videoProgress < 0 || params.videoProgress > 100) {
      AppLogger.error('UpdateLessonProgressUseCase: Invalid video progress');
      return const Left(
        ValidationFailure(
          message: 'Le progrès vidéo doit être entre 0 et 100',
          code: 'INVALID_VIDEO_PROGRESS',
        ),
      );
    }

    AppLogger.logUseCase('UpdateLessonProgressUseCase', {
      'enrollmentId': params.enrollmentId,
      'lessonId': params.lessonId,
      'timeSpent': params.timeSpent,
      'videoProgress': params.videoProgress,
      'completed': params.completed,
    });

    final result = await _repository.updateLessonProgress(
      enrollmentId: params.enrollmentId,
      lessonId: params.lessonId,
      timeSpent: params.timeSpent,
      videoProgress: params.videoProgress,
      completed: params.completed,
    );

    return result.fold(
      (failure) {
        AppLogger.error(
          'UpdateLessonProgressUseCase: Failed to update progress',
          error: failure,
        );
        return Left(failure);
      },
      (progress) {
        AppLogger.info(
          'UpdateLessonProgressUseCase: Progress updated successfully',
          error: {
            'progressId': progress.id,
            'lessonId': progress.lessonId,
            'completed': progress.completed,
          },
        );
        return Right(progress);
      },
    );
  }
}
