import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/course_entity.dart';
import '../../domain/entities/lesson_entity.dart';
import '../../domain/repositories/course_repository.dart';
import '../datasources/course_remote_datasource.dart';

/// Implementation of [CourseRepository]
///
/// This class implements the course repository interface by delegating
/// to the remote data source and converting exceptions to failures.
@LazySingleton(as: CourseRepository)
class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDataSource _remoteDataSource;

  CourseRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<CourseEntity>>> getCourses() async {
    try {
      AppLogger.logRepository('getCourses');

      final courseModels = await _remoteDataSource.getCourses();
      final courses = courseModels.map((model) => model.toEntity()).toList();

      return Right(courses);
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
      AppLogger.error('CourseRepository: Unexpected error in getCourses', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getCoursesByCategory(
    CourseCategory category,
  ) async {
    try {
      AppLogger.logRepository('getCoursesByCategory', params: {
        'category': category.toString(),
      });

      final courseModels = await _remoteDataSource.getCoursesByCategory(category);
      final courses = courseModels.map((model) => model.toEntity()).toList();

      return Right(courses);
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
      AppLogger.error('CourseRepository: Unexpected error in getCoursesByCategory', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, CourseEntity>> getCourseById(String courseId) async {
    try {
      AppLogger.logRepository('getCourseById', params: {
        'courseId': courseId,
      });

      final courseModel = await _remoteDataSource.getCourseById(courseId);
      return Right(courseModel.toEntity());
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
      AppLogger.error('CourseRepository: Unexpected error in getCourseById', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<LessonEntity>>> getCourseLessons(
    String courseId,
  ) async {
    try {
      AppLogger.logRepository('getCourseLessons', params: {
        'courseId': courseId,
      });

      final lessonModels = await _remoteDataSource.getCourseLessons(courseId);
      final lessons = lessonModels.map((model) => model.toEntity()).toList();

      return Right(lessons);
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
      AppLogger.error('CourseRepository: Unexpected error in getCourseLessons', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, LessonEntity>> getLessonById(String lessonId) async {
    try {
      AppLogger.logRepository('getLessonById', params: {
        'lessonId': lessonId,
      });

      final lessonModel = await _remoteDataSource.getLessonById(lessonId);
      return Right(lessonModel.toEntity());
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
      AppLogger.error('CourseRepository: Unexpected error in getLessonById', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> searchCourses(String query) async {
    try {
      AppLogger.logRepository('searchCourses', params: {
        'query': query,
      });

      final courseModels = await _remoteDataSource.searchCourses(query);
      final courses = courseModels.map((model) => model.toEntity()).toList();

      return Right(courses);
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
      AppLogger.error('CourseRepository: Unexpected error in searchCourses', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> filterCourses({
    CourseCategory? category,
    CourseLevel? level,
    double? minPrice,
    double? maxPrice,
    double? minRating,
  }) async {
    try {
      AppLogger.logRepository('filterCourses', params: {
        'category': category?.toString(),
        'level': level?.toString(),
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'minRating': minRating,
      });

      final courseModels = await _remoteDataSource.filterCourses(
        category: category,
        level: level,
        minPrice: minPrice,
        maxPrice: maxPrice,
        minRating: minRating,
      );
      final courses = courseModels.map((model) => model.toEntity()).toList();

      return Right(courses);
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
      AppLogger.error('CourseRepository: Unexpected error in filterCourses', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getCoursesByInstructor(
    String instructorId,
  ) async {
    try {
      AppLogger.logRepository('getCoursesByInstructor', params: {
        'instructorId': instructorId,
      });

      final courseModels = await _remoteDataSource.getCoursesByInstructor(instructorId);
      final courses = courseModels.map((model) => model.toEntity()).toList();

      return Right(courses);
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
      AppLogger.error('CourseRepository: Unexpected error in getCoursesByInstructor', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getPopularCourses({
    int limit = 10,
  }) async {
    try {
      AppLogger.logRepository('getPopularCourses', params: {
        'limit': limit,
      });

      final courseModels = await _remoteDataSource.getPopularCourses(limit: limit);
      final courses = courseModels.map((model) => model.toEntity()).toList();

      return Right(courses);
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
      AppLogger.error('CourseRepository: Unexpected error in getPopularCourses', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getFeaturedCourses({
    int limit = 5,
  }) async {
    try {
      AppLogger.logRepository('getFeaturedCourses', params: {
        'limit': limit,
      });

      final courseModels = await _remoteDataSource.getFeaturedCourses(limit: limit);
      final courses = courseModels.map((model) => model.toEntity()).toList();

      return Right(courses);
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
      AppLogger.error('CourseRepository: Unexpected error in getFeaturedCourses', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }
}
