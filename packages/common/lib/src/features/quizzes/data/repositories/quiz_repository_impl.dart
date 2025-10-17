import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/answer_entity.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/entities/quiz_entity.dart';
import '../../domain/entities/quiz_result_entity.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../datasources/quiz_remote_datasource.dart';

/// Implementation of [QuizRepository]
///
/// This class implements the quiz repository interface by delegating
/// to the remote data source and converting exceptions to failures.
@LazySingleton(as: QuizRepository)
class QuizRepositoryImpl implements QuizRepository {
  final QuizRemoteDataSource _remoteDataSource;

  QuizRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, QuizEntity>> getLessonQuiz(String lessonId) async {
    try {
      AppLogger.logRepository('getLessonQuiz', params: {
        'lessonId': lessonId,
      });

      final quizModel = await _remoteDataSource.getLessonQuiz(lessonId);
      return Right(quizModel.toEntity());
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
      AppLogger.error('QuizRepository: Unexpected error in getLessonQuiz', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<QuizEntity>>> getCourseQuizzes(
    String courseId,
  ) async {
    try {
      AppLogger.logRepository('getCourseQuizzes', params: {
        'courseId': courseId,
      });

      final quizModels = await _remoteDataSource.getCourseQuizzes(courseId);
      final quizzes = quizModels.map((model) => model.toEntity()).toList();

      return Right(quizzes);
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
      AppLogger.error('QuizRepository: Unexpected error in getCourseQuizzes', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, QuizEntity>> getQuizById(String quizId) async {
    try {
      AppLogger.logRepository('getQuizById', params: {
        'quizId': quizId,
      });

      final quizModel = await _remoteDataSource.getQuizById(quizId);
      return Right(quizModel.toEntity());
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
      AppLogger.error('QuizRepository: Unexpected error in getQuizById', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<QuestionEntity>>> getQuizQuestions(
    String quizId,
  ) async {
    try {
      AppLogger.logRepository('getQuizQuestions', params: {
        'quizId': quizId,
      });

      final questionModels = await _remoteDataSource.getQuizQuestions(quizId);
      final questions = questionModels.map((model) => model.toEntity()).toList();

      return Right(questions);
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
      AppLogger.error('QuizRepository: Unexpected error in getQuizQuestions', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<AnswerEntity>>> getQuestionAnswers(
    String questionId,
  ) async {
    try {
      AppLogger.logRepository('getQuestionAnswers', params: {
        'questionId': questionId,
      });

      final answerModels = await _remoteDataSource.getQuestionAnswers(questionId);
      final answers = answerModels.map((model) => model.toEntity()).toList();

      return Right(answers);
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
      AppLogger.error('QuizRepository: Unexpected error in getQuestionAnswers', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, QuizResultEntity>> submitQuiz({
    required String quizId,
    required String userId,
    required Map<String, List<String>> answers,
    required int timeSpent,
    required DateTime startedAt,
  }) async {
    try {
      AppLogger.logRepository('submitQuiz', params: {
        'quizId': quizId,
        'userId': userId,
      });

      final resultModel = await _remoteDataSource.submitQuiz(
        quizId: quizId,
        userId: userId,
        answers: answers,
        timeSpent: timeSpent,
        startedAt: startedAt,
      );

      return Right(resultModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on AuthorizationException catch (e) {
      return Left(
        AuthorizationFailure(
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
      AppLogger.error('QuizRepository: Unexpected error in submitQuiz', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, QuizResultEntity>> getQuizResultById(
    String resultId,
  ) async {
    try {
      AppLogger.logRepository('getQuizResultById', params: {
        'resultId': resultId,
      });

      final resultModel = await _remoteDataSource.getQuizResultById(resultId);
      return Right(resultModel.toEntity());
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
      AppLogger.error('QuizRepository: Unexpected error in getQuizResultById', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<QuizResultEntity>>> getUserQuizResults({
    required String quizId,
    required String userId,
  }) async {
    try {
      AppLogger.logRepository('getUserQuizResults', params: {
        'quizId': quizId,
        'userId': userId,
      });

      final resultModels = await _remoteDataSource.getUserQuizResults(
        quizId: quizId,
        userId: userId,
      );
      final results = resultModels.map((model) => model.toEntity()).toList();

      return Right(results);
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
      AppLogger.error('QuizRepository: Unexpected error in getUserQuizResults', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<QuizResultEntity>>> getUserQuizHistory({
    required String userId,
    int? limit,
  }) async {
    try {
      AppLogger.logRepository('getUserQuizHistory', params: {
        'userId': userId,
        'limit': limit,
      });

      final resultModels = await _remoteDataSource.getUserQuizHistory(
        userId: userId,
        limit: limit,
      );
      final results = resultModels.map((model) => model.toEntity()).toList();

      return Right(results);
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
      AppLogger.error('QuizRepository: Unexpected error in getUserQuizHistory', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, QuizResultEntity>> getBestScore({
    required String quizId,
    required String userId,
  }) async {
    try {
      AppLogger.logRepository('getBestScore', params: {
        'quizId': quizId,
        'userId': userId,
      });

      final resultModel = await _remoteDataSource.getBestScore(
        quizId: quizId,
        userId: userId,
      );

      return Right(resultModel.toEntity());
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
      AppLogger.error('QuizRepository: Unexpected error in getBestScore', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, int>> getUserAttemptCount({
    required String quizId,
    required String userId,
  }) async {
    try {
      AppLogger.logRepository('getUserAttemptCount', params: {
        'quizId': quizId,
        'userId': userId,
      });

      final count = await _remoteDataSource.getUserAttemptCount(
        quizId: quizId,
        userId: userId,
      );

      return Right(count);
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
      AppLogger.error('QuizRepository: Unexpected error in getUserAttemptCount', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }
}
