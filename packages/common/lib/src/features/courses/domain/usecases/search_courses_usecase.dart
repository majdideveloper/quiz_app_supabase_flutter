import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/course_entity.dart';
import '../repositories/course_repository.dart';

/// Use case for searching courses by title or description
///
/// This use case performs a text search across course titles and descriptions
/// to find matching courses.
///
/// Usage:
/// ```dart
/// final searchCoursesUseCase = getIt<SearchCoursesUseCase>();
/// final result = await searchCoursesUseCase(
///   SearchCoursesParams(query: 'électricien'),
/// );
///
/// result.fold(
///   (failure) => print('Search failed: ${failure.message}'),
///   (courses) => print('Found ${courses.length} courses'),
/// );
/// ```
@lazySingleton
class SearchCoursesUseCase {
  final CourseRepository _repository;

  SearchCoursesUseCase(this._repository);

  /// Execute the search courses use case
  ///
  /// Returns a list of [CourseEntity] matching the query, or [Failure] on error.
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Empty or invalid search query
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, List<CourseEntity>>> call(
    SearchCoursesParams params,
  ) async {
    AppLogger.logUseCase(
      'SearchCoursesUseCase',
      'Searching courses with query: "${params.query}"',
    );

    try {
      // Validate search query
      final trimmedQuery = params.query.trim();

      if (trimmedQuery.isEmpty) {
        AppLogger.warning('SearchCoursesUseCase: Empty search query');
        return const Left(
          ValidationFailure(
            message: 'La recherche ne peut pas être vide',
            code: 'EMPTY_QUERY',
          ),
        );
      }

      if (trimmedQuery.length < 2) {
        AppLogger.warning('SearchCoursesUseCase: Query too short');
        return const Left(
          ValidationFailure(
            message: 'La recherche doit contenir au moins 2 caractères',
            code: 'QUERY_TOO_SHORT',
          ),
        );
      }

      final result = await _repository.searchCourses(trimmedQuery);

      return result.fold(
        (failure) {
          AppLogger.error(
            'SearchCoursesUseCase: Search failed',
            error: failure.message,
          );
          return Left(failure);
        },
        (courses) {
          AppLogger.info(
            'SearchCoursesUseCase: Found ${courses.length} courses matching "${trimmedQuery}"',
          );
          return Right(courses);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'SearchCoursesUseCase: Unexpected error',
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

/// Parameters for search courses use case
class SearchCoursesParams extends Equatable {
  final String query;

  const SearchCoursesParams({
    required this.query,
  });

  @override
  List<Object?> get props => [query];
}
