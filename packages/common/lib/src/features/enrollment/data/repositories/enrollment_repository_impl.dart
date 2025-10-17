import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/enrollment_entity.dart';
import '../../domain/entities/user_progress_entity.dart';
import '../../domain/repositories/enrollment_repository.dart';
import '../datasources/enrollment_remote_datasource.dart';

/// Implementation of [EnrollmentRepository]
///
/// This class implements the enrollment repository interface by delegating
/// to the remote data source and converting exceptions to failures.
@LazySingleton(as: EnrollmentRepository)
class EnrollmentRepositoryImpl implements EnrollmentRepository {
  final EnrollmentRemoteDataSource _remoteDataSource;

  EnrollmentRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, EnrollmentEntity>> enrollInCourse({
    required String userId,
    required String courseId,
  }) async {
    try {
      AppLogger.logRepository('enrollInCourse', params: {
        'userId': userId,
        'courseId': courseId,
      });

      final enrollmentModel = await _remoteDataSource.enrollInCourse(
        userId: userId,
        courseId: courseId,
      );
      return Right(enrollmentModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ValidationException catch (e) {
      return Left(
        ValidationFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('EnrollmentRepository: Unexpected error in enrollInCourse', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<EnrollmentEntity>>> getUserEnrollments(
    String userId,
  ) async {
    try {
      AppLogger.logRepository('getUserEnrollments', params: {
        'userId': userId,
      });

      final enrollmentModels = await _remoteDataSource.getUserEnrollments(userId);
      final enrollments = enrollmentModels.map((model) => model.toEntity()).toList();

      return Right(enrollments);
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('EnrollmentRepository: Unexpected error in getUserEnrollments', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, EnrollmentEntity>> getEnrollmentById(
    String enrollmentId,
  ) async {
    try {
      AppLogger.logRepository('getEnrollmentById', params: {
        'enrollmentId': enrollmentId,
      });

      final enrollmentModel = await _remoteDataSource.getEnrollmentById(enrollmentId);
      return Right(enrollmentModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('EnrollmentRepository: Unexpected error in getEnrollmentById', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, EnrollmentEntity>> getCourseEnrollment({
    required String userId,
    required String courseId,
  }) async {
    try {
      AppLogger.logRepository('getCourseEnrollment', params: {
        'userId': userId,
        'courseId': courseId,
      });

      final enrollmentModel = await _remoteDataSource.getCourseEnrollment(
        userId: userId,
        courseId: courseId,
      );
      return Right(enrollmentModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('EnrollmentRepository: Unexpected error in getCourseEnrollment', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, EnrollmentEntity>> updateEnrollmentProgress({
    required String enrollmentId,
    required int progress,
    required int completedLessons,
  }) async {
    try {
      AppLogger.logRepository('updateEnrollmentProgress', params: {
        'enrollmentId': enrollmentId,
        'progress': progress,
        'completedLessons': completedLessons,
      });

      final enrollmentModel = await _remoteDataSource.updateEnrollmentProgress(
        enrollmentId: enrollmentId,
        progress: progress,
        completedLessons: completedLessons,
      );
      return Right(enrollmentModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('EnrollmentRepository: Unexpected error in updateEnrollmentProgress', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, EnrollmentEntity>> dropEnrollment(
    String enrollmentId,
  ) async {
    try {
      AppLogger.logRepository('dropEnrollment', params: {
        'enrollmentId': enrollmentId,
      });

      final enrollmentModel = await _remoteDataSource.dropEnrollment(enrollmentId);
      return Right(enrollmentModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('EnrollmentRepository: Unexpected error in dropEnrollment', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserProgressEntity>> getLessonProgress({
    required String enrollmentId,
    required String lessonId,
  }) async {
    try {
      AppLogger.logRepository('getLessonProgress', params: {
        'enrollmentId': enrollmentId,
        'lessonId': lessonId,
      });

      final progressModel = await _remoteDataSource.getLessonProgress(
        enrollmentId: enrollmentId,
        lessonId: lessonId,
      );
      return Right(progressModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('EnrollmentRepository: Unexpected error in getLessonProgress', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<UserProgressEntity>>> getEnrollmentProgress(
    String enrollmentId,
  ) async {
    try {
      AppLogger.logRepository('getEnrollmentProgress', params: {
        'enrollmentId': enrollmentId,
      });

      final progressModels = await _remoteDataSource.getEnrollmentProgress(enrollmentId);
      final progressList = progressModels.map((model) => model.toEntity()).toList();

      return Right(progressList);
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('EnrollmentRepository: Unexpected error in getEnrollmentProgress', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserProgressEntity>> updateLessonProgress({
    required String enrollmentId,
    required String lessonId,
    required int timeSpent,
    required int videoProgress,
    required bool completed,
  }) async {
    try {
      AppLogger.logRepository('updateLessonProgress', params: {
        'enrollmentId': enrollmentId,
        'lessonId': lessonId,
        'timeSpent': timeSpent,
        'videoProgress': videoProgress,
        'completed': completed,
      });

      final progressModel = await _remoteDataSource.updateLessonProgress(
        enrollmentId: enrollmentId,
        lessonId: lessonId,
        timeSpent: timeSpent,
        videoProgress: videoProgress,
        completed: completed,
      );
      return Right(progressModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('EnrollmentRepository: Unexpected error in updateLessonProgress', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserProgressEntity>> completeLessonProgress({
    required String enrollmentId,
    required String lessonId,
  }) async {
    try {
      AppLogger.logRepository('completeLessonProgress', params: {
        'enrollmentId': enrollmentId,
        'lessonId': lessonId,
      });

      final progressModel = await _remoteDataSource.completeLessonProgress(
        enrollmentId: enrollmentId,
        lessonId: lessonId,
      );
      return Right(progressModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('EnrollmentRepository: Unexpected error in completeLessonProgress', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<EnrollmentEntity>>> getActiveEnrollments(
    String userId,
  ) async {
    try {
      AppLogger.logRepository('getActiveEnrollments', params: {
        'userId': userId,
      });

      final enrollmentModels = await _remoteDataSource.getActiveEnrollments(userId);
      final enrollments = enrollmentModels.map((model) => model.toEntity()).toList();

      return Right(enrollments);
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('EnrollmentRepository: Unexpected error in getActiveEnrollments', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<EnrollmentEntity>>> getCompletedEnrollments(
    String userId,
  ) async {
    try {
      AppLogger.logRepository('getCompletedEnrollments', params: {
        'userId': userId,
      });

      final enrollmentModels = await _remoteDataSource.getCompletedEnrollments(userId);
      final enrollments = enrollmentModels.map((model) => model.toEntity()).toList();

      return Right(enrollments);
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('EnrollmentRepository: Unexpected error in getCompletedEnrollments', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isUserEnrolled({
    required String userId,
    required String courseId,
  }) async {
    try {
      AppLogger.logRepository('isUserEnrolled', params: {
        'userId': userId,
        'courseId': courseId,
      });

      final isEnrolled = await _remoteDataSource.isUserEnrolled(
        userId: userId,
        courseId: courseId,
      );

      return Right(isEnrolled);
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('EnrollmentRepository: Unexpected error in isUserEnrolled', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }
}
