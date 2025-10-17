import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/course_entity.dart';
import '../entities/lesson_entity.dart';

/// Course repository interface
///
/// This interface defines the contract for course-related data operations in the domain layer.
/// Implementations should handle all course and lesson data operations and return Either
/// for proper error handling.
///
/// All methods return Either<Failure, T> where:
/// - Left: Contains a Failure object describing what went wrong
/// - Right: Contains the successful result
abstract class CourseRepository {
  /// Get all published courses
  ///
  /// Returns a list of all published courses ordered by creation date (newest first).
  ///
  /// Possible failures:
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  ///
  /// Example:
  /// ```dart
  /// final result = await courseRepository.getCourses();
  ///
  /// result.fold(
  ///   (failure) => print('Failed to load courses'),
  ///   (courses) => print('Loaded ${courses.length} courses'),
  /// );
  /// ```
  Future<Either<Failure, List<CourseEntity>>> getCourses();

  /// Get courses by category
  ///
  /// Returns a list of published courses filtered by category.
  ///
  /// Parameters:
  /// - [category]: The category to filter by
  ///
  /// Possible failures:
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  ///
  /// Example:
  /// ```dart
  /// final result = await courseRepository.getCoursesByCategory(CourseCategory.ccq);
  ///
  /// result.fold(
  ///   (failure) => print('Failed to load CCQ courses'),
  ///   (courses) => print('Loaded ${courses.length} CCQ courses'),
  /// );
  /// ```
  Future<Either<Failure, List<CourseEntity>>> getCoursesByCategory(
    CourseCategory category,
  );

  /// Get a course by ID
  ///
  /// Returns a single course by its unique identifier.
  ///
  /// Parameters:
  /// - [courseId]: The unique course ID
  ///
  /// Possible failures:
  /// - [NotFoundFailure]: Course not found
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  ///
  /// Example:
  /// ```dart
  /// final result = await courseRepository.getCourseById('course-123');
  ///
  /// result.fold(
  ///   (failure) => print('Course not found'),
  ///   (course) => print('Course: ${course.title}'),
  /// );
  /// ```
  Future<Either<Failure, CourseEntity>> getCourseById(String courseId);

  /// Get lessons for a course
  ///
  /// Returns all lessons for a course, ordered by orderIndex.
  ///
  /// Parameters:
  /// - [courseId]: The unique course ID
  ///
  /// Possible failures:
  /// - [NotFoundFailure]: Course not found
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  ///
  /// Example:
  /// ```dart
  /// final result = await courseRepository.getCourseLessons('course-123');
  ///
  /// result.fold(
  ///   (failure) => print('Failed to load lessons'),
  ///   (lessons) => print('Loaded ${lessons.length} lessons'),
  /// );
  /// ```
  Future<Either<Failure, List<LessonEntity>>> getCourseLessons(String courseId);

  /// Get a single lesson by ID
  ///
  /// Returns a single lesson by its unique identifier.
  ///
  /// Parameters:
  /// - [lessonId]: The unique lesson ID
  ///
  /// Possible failures:
  /// - [NotFoundFailure]: Lesson not found
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  ///
  /// Example:
  /// ```dart
  /// final result = await courseRepository.getLessonById('lesson-123');
  ///
  /// result.fold(
  ///   (failure) => print('Lesson not found'),
  ///   (lesson) => print('Lesson: ${lesson.title}'),
  /// );
  /// ```
  Future<Either<Failure, LessonEntity>> getLessonById(String lessonId);

  /// Search courses by title or description
  ///
  /// Returns courses that match the search query in their title or description.
  ///
  /// Parameters:
  /// - [query]: The search query string
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Empty or invalid query
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  ///
  /// Example:
  /// ```dart
  /// final result = await courseRepository.searchCourses('électricien');
  ///
  /// result.fold(
  ///   (failure) => print('Search failed'),
  ///   (courses) => print('Found ${courses.length} courses'),
  /// );
  /// ```
  Future<Either<Failure, List<CourseEntity>>> searchCourses(String query);

  /// Filter courses by multiple criteria
  ///
  /// Returns courses that match the specified filters.
  ///
  /// Parameters:
  /// - [category]: Optional category filter
  /// - [level]: Optional level filter
  /// - [minPrice]: Optional minimum price filter
  /// - [maxPrice]: Optional maximum price filter
  /// - [minRating]: Optional minimum rating filter
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Invalid filter values
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  ///
  /// Example:
  /// ```dart
  /// final result = await courseRepository.filterCourses(
  ///   category: CourseCategory.ccq,
  ///   level: CourseLevel.beginner,
  ///   maxPrice: 100.0,
  ///   minRating: 4.0,
  /// );
  ///
  /// result.fold(
  ///   (failure) => print('Filter failed'),
  ///   (courses) => print('Found ${courses.length} courses'),
  /// );
  /// ```
  Future<Either<Failure, List<CourseEntity>>> filterCourses({
    CourseCategory? category,
    CourseLevel? level,
    double? minPrice,
    double? maxPrice,
    double? minRating,
  });

  /// Get courses by instructor
  ///
  /// Returns all published courses created by a specific instructor.
  ///
  /// Parameters:
  /// - [instructorId]: The instructor's user ID
  ///
  /// Possible failures:
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  ///
  /// Example:
  /// ```dart
  /// final result = await courseRepository.getCoursesByInstructor('instructor-123');
  ///
  /// result.fold(
  ///   (failure) => print('Failed to load instructor courses'),
  ///   (courses) => print('Instructor has ${courses.length} courses'),
  /// );
  /// ```
  Future<Either<Failure, List<CourseEntity>>> getCoursesByInstructor(
    String instructorId,
  );

  /// Get popular courses
  ///
  /// Returns the most popular courses based on enrollment count.
  ///
  /// Parameters:
  /// - [limit]: Maximum number of courses to return (default: 10)
  ///
  /// Possible failures:
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  ///
  /// Example:
  /// ```dart
  /// final result = await courseRepository.getPopularCourses(limit: 5);
  ///
  /// result.fold(
  ///   (failure) => print('Failed to load popular courses'),
  ///   (courses) => print('Top ${courses.length} popular courses'),
  /// );
  /// ```
  Future<Either<Failure, List<CourseEntity>>> getPopularCourses({
    int limit = 10,
  });

  /// Get featured courses
  ///
  /// Returns featured/recommended courses (highly rated + popular).
  ///
  /// Parameters:
  /// - [limit]: Maximum number of courses to return (default: 5)
  ///
  /// Possible failures:
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  ///
  /// Example:
  /// ```dart
  /// final result = await courseRepository.getFeaturedCourses(limit: 3);
  ///
  /// result.fold(
  ///   (failure) => print('Failed to load featured courses'),
  ///   (courses) => print('Featured: ${courses.length} courses'),
  /// );
  /// ```
  Future<Either<Failure, List<CourseEntity>>> getFeaturedCourses({
    int limit = 5,
  });
}
