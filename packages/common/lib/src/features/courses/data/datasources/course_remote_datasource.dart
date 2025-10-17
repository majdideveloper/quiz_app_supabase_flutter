import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/course_entity.dart';
import '../models/course_model.dart';
import '../models/lesson_model.dart';

/// Remote data source for course operations
///
/// This class handles all remote data operations for courses and lessons using Supabase.
/// It communicates with the courses and lessons tables.
///
/// All methods throw specific exceptions on error:
/// - [NotFoundException]: Course or lesson not found
/// - [DatabaseException]: Database query errors
/// - [ServerException]: Server errors
/// - [NetworkException]: Network connectivity issues
abstract class CourseRemoteDataSource {
  /// Get all published courses
  Future<List<CourseModel>> getCourses();

  /// Get courses by category
  Future<List<CourseModel>> getCoursesByCategory(CourseCategory category);

  /// Get a course by ID
  Future<CourseModel> getCourseById(String courseId);

  /// Get lessons for a course
  Future<List<LessonModel>> getCourseLessons(String courseId);

  /// Get a lesson by ID
  Future<LessonModel> getLessonById(String lessonId);

  /// Search courses by title or description
  Future<List<CourseModel>> searchCourses(String query);

  /// Filter courses by multiple criteria
  Future<List<CourseModel>> filterCourses({
    CourseCategory? category,
    CourseLevel? level,
    double? minPrice,
    double? maxPrice,
    double? minRating,
  });

  /// Get courses by instructor
  Future<List<CourseModel>> getCoursesByInstructor(String instructorId);

  /// Get popular courses
  Future<List<CourseModel>> getPopularCourses({int limit = 10});

  /// Get featured courses (highly rated + popular)
  Future<List<CourseModel>> getFeaturedCourses({int limit = 5});
}

/// Implementation of [CourseRemoteDataSource] using Supabase
@LazySingleton(as: CourseRemoteDataSource)
class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  final SupabaseClient _supabase;

  CourseRemoteDataSourceImpl(this._supabase);

  @override
  Future<List<CourseModel>> getCourses() async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/courses');

      final response = await _supabase
          .from('courses')
          .select('*, profiles!instructor_id(full_name, email)')
          .eq('is_published', true)
          .order('created_at', ascending: false);

      final courses = (response as List)
          .map((json) => CourseModel.fromSupabaseWithInstructor(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/courses', 200);
      return courses;
    } on PostgrestException catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get courses failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des cours',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get courses error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<CourseModel>> getCoursesByCategory(
    CourseCategory category,
  ) async {
    try {
      final categoryStr = _courseCategoryToString(category);
      AppLogger.logRequest('GET', '/rest/v1/courses', params: {
        'category': categoryStr,
      });

      final response = await _supabase
          .from('courses')
          .select('*, profiles!instructor_id(full_name, email)')
          .eq('is_published', true)
          .eq('category', categoryStr)
          .order('created_at', ascending: false);

      final courses = (response as List)
          .map((json) => CourseModel.fromSupabaseWithInstructor(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/courses', 200);
      return courses;
    } on PostgrestException catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get courses by category failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des cours',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get courses by category error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<CourseModel> getCourseById(String courseId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/courses/$courseId');

      final response = await _supabase
          .from('courses')
          .select('*, profiles!instructor_id(full_name, email)')
          .eq('id', courseId)
          .single();

      final course = CourseModel.fromSupabaseWithInstructor(response);

      AppLogger.logResponse('GET', '/rest/v1/courses/$courseId', 200);
      return course;
    } on PostgrestException catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get course by ID failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Cours non trouvé',
          code: 'COURSE_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la récupération du cours',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get course by ID error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<LessonModel>> getCourseLessons(String courseId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/lessons', params: {
        'course_id': courseId,
      });

      final response = await _supabase
          .from('lessons')
          .select()
          .eq('course_id', courseId)
          .order('order_index', ascending: true);

      final lessons = (response as List)
          .map((json) => LessonModel.fromJson(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/lessons', 200);
      return lessons;
    } on PostgrestException catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get course lessons failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des leçons',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get course lessons error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<LessonModel> getLessonById(String lessonId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/lessons/$lessonId');

      final response = await _supabase
          .from('lessons')
          .select()
          .eq('id', lessonId)
          .single();

      final lesson = LessonModel.fromJson(response);

      AppLogger.logResponse('GET', '/rest/v1/lessons/$lessonId', 200);
      return lesson;
    } on PostgrestException catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get lesson by ID failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Leçon non trouvée',
          code: 'LESSON_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la récupération de la leçon',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get lesson by ID error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<CourseModel>> searchCourses(String query) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/courses', params: {
        'search': query,
      });

      // Use ilike for case-insensitive search in both title and description
      final response = await _supabase
          .from('courses')
          .select('*, profiles!instructor_id(full_name, email)')
          .eq('is_published', true)
          .or('title.ilike.%$query%,description.ilike.%$query%')
          .order('created_at', ascending: false);

      final courses = (response as List)
          .map((json) => CourseModel.fromSupabaseWithInstructor(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/courses', 200);
      return courses;
    } on PostgrestException catch (e) {
      AppLogger.error('CourseRemoteDataSource: Search courses failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la recherche de cours',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('CourseRemoteDataSource: Search courses error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<CourseModel>> filterCourses({
    CourseCategory? category,
    CourseLevel? level,
    double? minPrice,
    double? maxPrice,
    double? minRating,
  }) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/courses', params: {
        'category': category?.toString(),
        'level': level?.toString(),
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'minRating': minRating,
      });

      var query = _supabase
          .from('courses')
          .select('*, profiles!instructor_id(full_name, email)')
          .eq('is_published', true);

      // Apply filters
      if (category != null) {
        query = query.eq('category', _courseCategoryToString(category));
      }

      if (level != null) {
        query = query.eq('level', _courseLevelToString(level));
      }

      if (minPrice != null) {
        query = query.gte('price', minPrice);
      }

      if (maxPrice != null) {
        query = query.lte('price', maxPrice);
      }

      if (minRating != null) {
        query = query.gte('rating', minRating);
      }

      final response = await query.order('created_at', ascending: false);

      final courses = (response as List)
          .map((json) => CourseModel.fromSupabaseWithInstructor(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/courses', 200);
      return courses;
    } on PostgrestException catch (e) {
      AppLogger.error('CourseRemoteDataSource: Filter courses failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors du filtrage des cours',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('CourseRemoteDataSource: Filter courses error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<CourseModel>> getCoursesByInstructor(String instructorId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/courses', params: {
        'instructor_id': instructorId,
      });

      final response = await _supabase
          .from('courses')
          .select('*, profiles!instructor_id(full_name, email)')
          .eq('is_published', true)
          .eq('instructor_id', instructorId)
          .order('created_at', ascending: false);

      final courses = (response as List)
          .map((json) => CourseModel.fromSupabaseWithInstructor(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/courses', 200);
      return courses;
    } on PostgrestException catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get courses by instructor failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des cours de l\'instructeur',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get courses by instructor error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<CourseModel>> getPopularCourses({int limit = 10}) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/courses', params: {
        'limit': limit,
        'orderBy': 'enrollment_count',
      });

      final response = await _supabase
          .from('courses')
          .select('*, profiles!instructor_id(full_name, email)')
          .eq('is_published', true)
          .order('enrollment_count', ascending: false)
          .limit(limit);

      final courses = (response as List)
          .map((json) => CourseModel.fromSupabaseWithInstructor(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/courses', 200);
      return courses;
    } on PostgrestException catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get popular courses failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des cours populaires',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get popular courses error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<CourseModel>> getFeaturedCourses({int limit = 5}) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/courses', params: {
        'limit': limit,
        'featured': true,
      });

      // Featured courses: high rating (>= 4.0) + popular (> 20 enrollments)
      final response = await _supabase
          .from('courses')
          .select('*, profiles!instructor_id(full_name, email)')
          .eq('is_published', true)
          .gte('rating', 4.0)
          .gte('enrollment_count', 20)
          .order('rating', ascending: false)
          .limit(limit);

      final courses = (response as List)
          .map((json) => CourseModel.fromSupabaseWithInstructor(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/courses', 200);
      return courses;
    } on PostgrestException catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get featured courses failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des cours vedettes',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('CourseRemoteDataSource: Get featured courses error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  /// Convert CourseCategory enum to string for database
  String _courseCategoryToString(CourseCategory category) {
    switch (category) {
      case CourseCategory.ccq:
        return 'ccq';
      case CourseCategory.nonConstruction:
        return 'non_construction';
      case CourseCategory.redSeal:
        return 'red_seal';
    }
  }

  /// Convert CourseLevel enum to string for database
  String _courseLevelToString(CourseLevel level) {
    switch (level) {
      case CourseLevel.beginner:
        return 'beginner';
      case CourseLevel.intermediate:
        return 'intermediate';
      case CourseLevel.advanced:
        return 'advanced';
      case CourseLevel.expert:
        return 'expert';
    }
  }
}
