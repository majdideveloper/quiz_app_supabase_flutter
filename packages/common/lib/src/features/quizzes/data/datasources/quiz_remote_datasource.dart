import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/logger.dart';
import '../models/answer_model.dart';
import '../models/question_model.dart';
import '../models/quiz_model.dart';
import '../models/quiz_result_model.dart';

/// Remote data source for quiz operations
///
/// This class handles all remote data operations for quizzes, questions, answers,
/// and quiz results using Supabase.
abstract class QuizRemoteDataSource {
  Future<QuizModel> getLessonQuiz(String lessonId);
  Future<List<QuizModel>> getCourseQuizzes(String courseId);
  Future<QuizModel> getQuizById(String quizId);
  Future<List<QuestionModel>> getQuizQuestions(String quizId);
  Future<List<AnswerModel>> getQuestionAnswers(String questionId);
  Future<QuizResultModel> submitQuiz({
    required String quizId,
    required String userId,
    required Map<String, List<String>> answers,
    required int timeSpent,
    required DateTime startedAt,
  });
  Future<QuizResultModel> getQuizResultById(String resultId);
  Future<List<QuizResultModel>> getUserQuizResults({
    required String quizId,
    required String userId,
  });
  Future<List<QuizResultModel>> getUserQuizHistory({
    required String userId,
    int? limit,
  });
  Future<QuizResultModel> getBestScore({
    required String quizId,
    required String userId,
  });
  Future<int> getUserAttemptCount({
    required String quizId,
    required String userId,
  });
}

/// Implementation of [QuizRemoteDataSource] using Supabase
@LazySingleton(as: QuizRemoteDataSource)
class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {
  final SupabaseClient _supabase;

  QuizRemoteDataSourceImpl(this._supabase);

  @override
  Future<QuizModel> getLessonQuiz(String lessonId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/quizzes', params: {
        'lesson_id': lessonId,
      });

      final response = await _supabase
          .from('quizzes')
          .select()
          .eq('lesson_id', lessonId)
          .single();

      final quiz = QuizModel.fromJson(response);

      AppLogger.logResponse('GET', '/rest/v1/quizzes', 200);
      return quiz;
    } on PostgrestException catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get lesson quiz failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Aucun quiz trouvé pour cette leçon',
          code: 'QUIZ_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la récupération du quiz',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get lesson quiz error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<QuizModel>> getCourseQuizzes(String courseId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/quizzes', params: {
        'course_id': courseId,
      });

      final response = await _supabase
          .from('quizzes')
          .select()
          .eq('course_id', courseId)
          .order('order_index');

      final quizzes = (response as List)
          .map((json) => QuizModel.fromJson(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/quizzes', 200);
      return quizzes;
    } on PostgrestException catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get course quizzes failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des quiz',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get course quizzes error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<QuizModel> getQuizById(String quizId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/quizzes/$quizId');

      final response = await _supabase
          .from('quizzes')
          .select()
          .eq('id', quizId)
          .single();

      final quiz = QuizModel.fromJson(response);

      AppLogger.logResponse('GET', '/rest/v1/quizzes/$quizId', 200);
      return quiz;
    } on PostgrestException catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get quiz by ID failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Quiz non trouvé',
          code: 'QUIZ_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la récupération du quiz',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get quiz by ID error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<QuestionModel>> getQuizQuestions(String quizId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/quiz_questions', params: {
        'quiz_id': quizId,
      });

      final response = await _supabase
          .from('quiz_questions')
          .select()
          .eq('quiz_id', quizId)
          .order('order_index');

      final questions = (response as List)
          .map((json) => QuestionModel.fromJson(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/quiz_questions', 200);
      return questions;
    } on PostgrestException catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get quiz questions failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des questions',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get quiz questions error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<AnswerModel>> getQuestionAnswers(String questionId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/quiz_answers', params: {
        'question_id': questionId,
      });

      final response = await _supabase
          .from('quiz_answers')
          .select()
          .eq('question_id', questionId)
          .order('order_index');

      final answers = (response as List)
          .map((json) => AnswerModel.fromJson(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/quiz_answers', 200);
      return answers;
    } on PostgrestException catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get question answers failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des réponses',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get question answers error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<QuizResultModel> submitQuiz({
    required String quizId,
    required String userId,
    required Map<String, List<String>> answers,
    required int timeSpent,
    required DateTime startedAt,
  }) async {
    try {
      AppLogger.logRequest('POST', '/rest/v1/rpc/submit_quiz', params: {
        'quiz_id': quizId,
        'user_id': userId,
      });

      // Call Supabase RPC function to submit quiz and calculate score
      final response = await _supabase.rpc('submit_quiz', params: {
        'p_quiz_id': quizId,
        'p_user_id': userId,
        'p_answers': answers,
        'p_time_spent': timeSpent,
        'p_started_at': startedAt.toIso8601String(),
      });

      final result = QuizResultModel.fromJson(response);

      AppLogger.logResponse('POST', '/rest/v1/rpc/submit_quiz', 200);
      return result;
    } on PostgrestException catch (e) {
      AppLogger.error('QuizRemoteDataSource: Submit quiz failed', error: e.message);

      if (e.message.contains('max_attempts')) {
        throw AuthorizationException(
          message: 'Nombre maximum de tentatives atteint',
          code: 'MAX_ATTEMPTS_EXCEEDED',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la soumission du quiz',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('QuizRemoteDataSource: Submit quiz error', error: e);
      if (e is AuthorizationException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<QuizResultModel> getQuizResultById(String resultId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/quiz_attempts/$resultId');

      final response = await _supabase
          .from('quiz_attempts')
          .select()
          .eq('id', resultId)
          .single();

      final result = QuizResultModel.fromJson(response);

      AppLogger.logResponse('GET', '/rest/v1/quiz_attempts/$resultId', 200);
      return result;
    } on PostgrestException catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get quiz result failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Résultat non trouvé',
          code: 'RESULT_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la récupération du résultat',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get quiz result error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<QuizResultModel>> getUserQuizResults({
    required String quizId,
    required String userId,
  }) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/quiz_attempts', params: {
        'quiz_id': quizId,
        'user_id': userId,
      });

      final response = await _supabase
          .from('quiz_attempts')
          .select()
          .eq('quiz_id', quizId)
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      final results = (response as List)
          .map((json) => QuizResultModel.fromJson(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/quiz_attempts', 200);
      return results;
    } on PostgrestException catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get user quiz results failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des résultats',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get user quiz results error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<QuizResultModel>> getUserQuizHistory({
    required String userId,
    int? limit,
  }) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/quiz_attempts', params: {
        'user_id': userId,
        'limit': limit,
      });

      var query = _supabase
          .from('quiz_attempts')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      if (limit != null) {
        query = query.limit(limit);
      }

      final response = await query;

      final results = (response as List)
          .map((json) => QuizResultModel.fromJson(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/quiz_attempts', 200);
      return results;
    } on PostgrestException catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get user quiz history failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération de l\'historique',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get user quiz history error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<QuizResultModel> getBestScore({
    required String quizId,
    required String userId,
  }) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/quiz_attempts/best', params: {
        'quiz_id': quizId,
        'user_id': userId,
      });

      final response = await _supabase
          .from('quiz_attempts')
          .select()
          .eq('quiz_id', quizId)
          .eq('user_id', userId)
          .order('score', ascending: false)
          .limit(1)
          .single();

      final result = QuizResultModel.fromJson(response);

      AppLogger.logResponse('GET', '/rest/v1/quiz_attempts/best', 200);
      return result;
    } on PostgrestException catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get best score failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Aucune tentative trouvée',
          code: 'NO_ATTEMPTS',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la récupération du meilleur score',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get best score error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<int> getUserAttemptCount({
    required String quizId,
    required String userId,
  }) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/quiz_attempts/count', params: {
        'quiz_id': quizId,
        'user_id': userId,
      });

      final response = await _supabase
          .from('quiz_attempts')
          .select('id')
          .eq('quiz_id', quizId)
          .eq('user_id', userId);

      final count = response.length;

      AppLogger.logResponse('GET', '/rest/v1/quiz_attempts/count', 200);
      return count;
    } on PostgrestException catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get attempt count failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors du comptage des tentatives',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('QuizRemoteDataSource: Get attempt count error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }
}
