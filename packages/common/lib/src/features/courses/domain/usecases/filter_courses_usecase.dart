import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/course_entity.dart';
import '../repositories/course_repository.dart';

/// Use case for filtering courses by multiple criteria
///
/// This use case allows filtering courses by category, level, price range,
/// and minimum rating.
///
/// Usage:
/// ```dart
/// final filterCoursesUseCase = getIt<FilterCoursesUseCase>();
/// final result = await filterCoursesUseCase(
///   FilterCoursesParams(
///     category: CourseCategory.ccq,
///     level: CourseLevel.beginner,
///     maxPrice: 100.0,
///     minRating: 4.0,
///   ),
/// );
///
/// result.fold(
///   (failure) => print('Filter failed: ${failure.message}'),
///   (courses) => print('Found ${courses.length} matching courses'),
/// );
/// ```
@lazySingleton
class FilterCoursesUseCase {
  final CourseRepository _repository;

  FilterCoursesUseCase(this._repository);

  /// Execute the filter courses use case
  ///
  /// Returns a list of [CourseEntity] matching the filters, or [Failure] on error.
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Invalid filter values
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, List<CourseEntity>>> call(
    FilterCoursesParams params,
  ) async {
    AppLogger.logUseCase(
      'FilterCoursesUseCase',
      'Filtering courses with params: ${params.toString()}',
    );

    try {
      // Validate filter parameters
      if (params.minPrice != null && params.minPrice! < 0) {
        AppLogger.warning('FilterCoursesUseCase: Invalid min price');
        return const Left(
          ValidationFailure(
            message: 'Le prix minimum ne peut pas être négatif',
            code: 'INVALID_MIN_PRICE',
          ),
        );
      }

      if (params.maxPrice != null && params.maxPrice! < 0) {
        AppLogger.warning('FilterCoursesUseCase: Invalid max price');
        return const Left(
          ValidationFailure(
            message: 'Le prix maximum ne peut pas être négatif',
            code: 'INVALID_MAX_PRICE',
          ),
        );
      }

      if (params.minPrice != null &&
          params.maxPrice != null &&
          params.minPrice! > params.maxPrice!) {
        AppLogger.warning('FilterCoursesUseCase: Min price > max price');
        return const Left(
          ValidationFailure(
            message: 'Le prix minimum ne peut pas être supérieur au prix maximum',
            code: 'INVALID_PRICE_RANGE',
          ),
        );
      }

      if (params.minRating != null &&
          (params.minRating! < 0 || params.minRating! > 5)) {
        AppLogger.warning('FilterCoursesUseCase: Invalid min rating');
        return const Left(
          ValidationFailure(
            message: 'La note minimum doit être entre 0 et 5',
            code: 'INVALID_MIN_RATING',
          ),
        );
      }

      final result = await _repository.filterCourses(
        category: params.category,
        level: params.level,
        minPrice: params.minPrice,
        maxPrice: params.maxPrice,
        minRating: params.minRating,
      );

      return result.fold(
        (failure) {
          AppLogger.error(
            'FilterCoursesUseCase: Filter failed',
            error: failure.message,
          );
          return Left(failure);
        },
        (courses) {
          AppLogger.info(
            'FilterCoursesUseCase: Found ${courses.length} courses matching filters',
          );
          return Right(courses);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'FilterCoursesUseCase: Unexpected error',
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

/// Parameters for filter courses use case
class FilterCoursesParams extends Equatable {
  final CourseCategory? category;
  final CourseLevel? level;
  final double? minPrice;
  final double? maxPrice;
  final double? minRating;

  const FilterCoursesParams({
    this.category,
    this.level,
    this.minPrice,
    this.maxPrice,
    this.minRating,
  });

  @override
  List<Object?> get props => [category, level, minPrice, maxPrice, minRating];

  @override
  String toString() {
    return 'FilterCoursesParams('
        'category: $category, '
        'level: $level, '
        'minPrice: $minPrice, '
        'maxPrice: $maxPrice, '
        'minRating: $minRating'
        ')';
  }
}
