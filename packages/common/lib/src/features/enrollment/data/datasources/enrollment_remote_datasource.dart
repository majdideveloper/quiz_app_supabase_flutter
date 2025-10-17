import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/logger.dart';
import '../models/enrollment_model.dart';
import '../models/user_progress_model.dart';

/// Remote data source for enrollment operations
///
/// This class handles all remote data operations for enrollments and user progress
/// using Supabase.
abstract class EnrollmentRemoteDataSource {
  Future<EnrollmentModel> enrollInCourse({
    required String userId,
    required String courseId,
  });
  Future<List<EnrollmentModel>> getUserEnrollments(String userId);
  Future<EnrollmentModel> getEnrollmentById(String enrollmentId);
  Future<EnrollmentModel> getCourseEnrollment({
    required String userId,
    required String courseId,
  });
  Future<EnrollmentModel> updateEnrollmentProgress({
    required String enrollmentId,
    required int progress,
    required int completedLessons,
  });
  Future<EnrollmentModel> dropEnrollment(String enrollmentId);
  Future<UserProgressModel> getLessonProgress({
    required String enrollmentId,
    required String lessonId,
  });
  Future<List<UserProgressModel>> getEnrollmentProgress(String enrollmentId);
  Future<UserProgressModel> updateLessonProgress({
    required String enrollmentId,
    required String lessonId,
    required int timeSpent,
    required int videoProgress,
    required bool completed,
  });
  Future<UserProgressModel> completeLessonProgress({
    required String enrollmentId,
    required String lessonId,
  });
  Future<List<EnrollmentModel>> getActiveEnrollments(String userId);
  Future<List<EnrollmentModel>> getCompletedEnrollments(String userId);
  Future<bool> isUserEnrolled({
    required String userId,
    required String courseId,
  });
}

/// Implementation of [EnrollmentRemoteDataSource] using Supabase
@LazySingleton(as: EnrollmentRemoteDataSource)
class EnrollmentRemoteDataSourceImpl implements EnrollmentRemoteDataSource {
  final SupabaseClient _supabase;

  EnrollmentRemoteDataSourceImpl(this._supabase);

  @override
  Future<EnrollmentModel> enrollInCourse({
    required String userId,
    required String courseId,
  }) async {
    try {
      AppLogger.logRequest('POST', '/rest/v1/rpc/enroll_in_course', params: {
        'user_id': userId,
        'course_id': courseId,
      });

      // Call Supabase RPC function to handle enrollment
      final response = await _supabase.rpc('enroll_in_course', params: {
        'p_user_id': userId,
        'p_course_id': courseId,
      });

      final enrollment = EnrollmentModel.fromJson(response);

      AppLogger.logResponse('POST', '/rest/v1/rpc/enroll_in_course', 200);
      return enrollment;
    } on PostgrestException catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Enroll in course failed', error: e.message);

      if (e.message.contains('already enrolled')) {
        throw ValidationException(
          message: 'Vous êtes déjà inscrit à ce cours',
          code: 'ALREADY_ENROLLED',
        );
      }

      if (e.message.contains('course not found')) {
        throw NotFoundException(
          message: 'Cours non trouvé',
          code: 'COURSE_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de l\'inscription au cours',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Enroll in course error', error: e);
      if (e is ValidationException || e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<EnrollmentModel>> getUserEnrollments(String userId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/enrollments', params: {
        'user_id': userId,
      });

      final response = await _supabase
          .from('enrollments')
          .select()
          .eq('user_id', userId)
          .order('enrolled_at', ascending: false);

      final enrollments = (response as List)
          .map((json) => EnrollmentModel.fromJson(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/enrollments', 200);
      return enrollments;
    } on PostgrestException catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get user enrollments failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des inscriptions',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get user enrollments error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<EnrollmentModel> getEnrollmentById(String enrollmentId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/enrollments/$enrollmentId');

      final response = await _supabase
          .from('enrollments')
          .select()
          .eq('id', enrollmentId)
          .single();

      final enrollment = EnrollmentModel.fromJson(response);

      AppLogger.logResponse('GET', '/rest/v1/enrollments/$enrollmentId', 200);
      return enrollment;
    } on PostgrestException catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get enrollment by ID failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Inscription non trouvée',
          code: 'ENROLLMENT_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la récupération de l\'inscription',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get enrollment by ID error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<EnrollmentModel> getCourseEnrollment({
    required String userId,
    required String courseId,
  }) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/enrollments', params: {
        'user_id': userId,
        'course_id': courseId,
      });

      final response = await _supabase
          .from('enrollments')
          .select()
          .eq('user_id', userId)
          .eq('course_id', courseId)
          .single();

      final enrollment = EnrollmentModel.fromJson(response);

      AppLogger.logResponse('GET', '/rest/v1/enrollments', 200);
      return enrollment;
    } on PostgrestException catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get course enrollment failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Inscription non trouvée pour ce cours',
          code: 'ENROLLMENT_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la récupération de l\'inscription',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get course enrollment error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<EnrollmentModel> updateEnrollmentProgress({
    required String enrollmentId,
    required int progress,
    required int completedLessons,
  }) async {
    try {
      AppLogger.logRequest('PATCH', '/rest/v1/enrollments/$enrollmentId', params: {
        'progress': progress,
        'completed_lessons': completedLessons,
      });

      final response = await _supabase
          .from('enrollments')
          .update({
            'progress': progress,
            'completed_lessons': completedLessons,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', enrollmentId)
          .select()
          .single();

      final enrollment = EnrollmentModel.fromJson(response);

      AppLogger.logResponse('PATCH', '/rest/v1/enrollments/$enrollmentId', 200);
      return enrollment;
    } on PostgrestException catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Update enrollment progress failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Inscription non trouvée',
          code: 'ENROLLMENT_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la mise à jour du progrès',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Update enrollment progress error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<EnrollmentModel> dropEnrollment(String enrollmentId) async {
    try {
      AppLogger.logRequest('PATCH', '/rest/v1/enrollments/$enrollmentId/drop');

      final now = DateTime.now().toIso8601String();
      final response = await _supabase
          .from('enrollments')
          .update({
            'status': 'dropped',
            'dropped_at': now,
            'updated_at': now,
          })
          .eq('id', enrollmentId)
          .select()
          .single();

      final enrollment = EnrollmentModel.fromJson(response);

      AppLogger.logResponse('PATCH', '/rest/v1/enrollments/$enrollmentId/drop', 200);
      return enrollment;
    } on PostgrestException catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Drop enrollment failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Inscription non trouvée',
          code: 'ENROLLMENT_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de l\'abandon du cours',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Drop enrollment error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<UserProgressModel> getLessonProgress({
    required String enrollmentId,
    required String lessonId,
  }) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/user_progress', params: {
        'enrollment_id': enrollmentId,
        'lesson_id': lessonId,
      });

      final response = await _supabase
          .from('user_progress')
          .select()
          .eq('enrollment_id', enrollmentId)
          .eq('lesson_id', lessonId)
          .single();

      final progress = UserProgressModel.fromJson(response);

      AppLogger.logResponse('GET', '/rest/v1/user_progress', 200);
      return progress;
    } on PostgrestException catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get lesson progress failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Progrès de la leçon non trouvé',
          code: 'PROGRESS_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la récupération du progrès',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get lesson progress error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<UserProgressModel>> getEnrollmentProgress(String enrollmentId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/user_progress', params: {
        'enrollment_id': enrollmentId,
      });

      final response = await _supabase
          .from('user_progress')
          .select()
          .eq('enrollment_id', enrollmentId)
          .order('created_at', ascending: true);

      final progressList = (response as List)
          .map((json) => UserProgressModel.fromJson(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/user_progress', 200);
      return progressList;
    } on PostgrestException catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get enrollment progress failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération du progrès',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get enrollment progress error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<UserProgressModel> updateLessonProgress({
    required String enrollmentId,
    required String lessonId,
    required int timeSpent,
    required int videoProgress,
    required bool completed,
  }) async {
    try {
      AppLogger.logRequest('POST', '/rest/v1/rpc/update_lesson_progress', params: {
        'enrollment_id': enrollmentId,
        'lesson_id': lessonId,
        'time_spent': timeSpent,
        'video_progress': videoProgress,
        'completed': completed,
      });

      // Call Supabase RPC function to update progress
      final response = await _supabase.rpc('update_lesson_progress', params: {
        'p_enrollment_id': enrollmentId,
        'p_lesson_id': lessonId,
        'p_time_spent': timeSpent,
        'p_video_progress': videoProgress,
        'p_completed': completed,
      });

      final progress = UserProgressModel.fromJson(response);

      AppLogger.logResponse('POST', '/rest/v1/rpc/update_lesson_progress', 200);
      return progress;
    } on PostgrestException catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Update lesson progress failed', error: e.message);

      if (e.message.contains('not found')) {
        throw NotFoundException(
          message: 'Inscription ou leçon non trouvée',
          code: 'NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la mise à jour du progrès',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Update lesson progress error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<UserProgressModel> completeLessonProgress({
    required String enrollmentId,
    required String lessonId,
  }) async {
    try {
      AppLogger.logRequest('POST', '/rest/v1/rpc/complete_lesson', params: {
        'enrollment_id': enrollmentId,
        'lesson_id': lessonId,
      });

      // Call Supabase RPC function to mark lesson as completed
      final response = await _supabase.rpc('complete_lesson', params: {
        'p_enrollment_id': enrollmentId,
        'p_lesson_id': lessonId,
      });

      final progress = UserProgressModel.fromJson(response);

      AppLogger.logResponse('POST', '/rest/v1/rpc/complete_lesson', 200);
      return progress;
    } on PostgrestException catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Complete lesson progress failed', error: e.message);

      if (e.message.contains('not found')) {
        throw NotFoundException(
          message: 'Inscription ou leçon non trouvée',
          code: 'NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la validation de la leçon',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Complete lesson progress error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<EnrollmentModel>> getActiveEnrollments(String userId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/enrollments/active', params: {
        'user_id': userId,
      });

      final response = await _supabase
          .from('enrollments')
          .select()
          .eq('user_id', userId)
          .inFilter('status', ['enrolled', 'in_progress'])
          .order('last_accessed_at', ascending: false);

      final enrollments = (response as List)
          .map((json) => EnrollmentModel.fromJson(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/enrollments/active', 200);
      return enrollments;
    } on PostgrestException catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get active enrollments failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des inscriptions actives',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get active enrollments error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<EnrollmentModel>> getCompletedEnrollments(String userId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/enrollments/completed', params: {
        'user_id': userId,
      });

      final response = await _supabase
          .from('enrollments')
          .select()
          .eq('user_id', userId)
          .eq('status', 'completed')
          .order('completed_at', ascending: false);

      final enrollments = (response as List)
          .map((json) => EnrollmentModel.fromJson(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/enrollments/completed', 200);
      return enrollments;
    } on PostgrestException catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get completed enrollments failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des cours terminés',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Get completed enrollments error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<bool> isUserEnrolled({
    required String userId,
    required String courseId,
  }) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/enrollments/check', params: {
        'user_id': userId,
        'course_id': courseId,
      });

      final response = await _supabase
          .from('enrollments')
          .select('id')
          .eq('user_id', userId)
          .eq('course_id', courseId)
          .inFilter('status', ['enrolled', 'in_progress']);

      final isEnrolled = response.isNotEmpty;

      AppLogger.logResponse('GET', '/rest/v1/enrollments/check', 200);
      return isEnrolled;
    } on PostgrestException catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Check enrollment failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la vérification de l\'inscription',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('EnrollmentRemoteDataSource: Check enrollment error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }
}
