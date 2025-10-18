import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:common/common.dart';

import 'course_event.dart';
import 'course_state.dart';

/// Course BLoC
///
/// Manages course-related business logic and state.
/// Uses Freezed for type-safe events and states.
@injectable
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCoursesUseCase _getCoursesUseCase;
  final GetCourseByIdUseCase _getCourseByIdUseCase;
  final GetCourseLessonsUseCase _getCourseLessonsUseCase;
  final SearchCoursesUseCase _searchCoursesUseCase;
  final FilterCoursesUseCase _filterCoursesUseCase;

  // Cache for all courses
  List<CourseEntity> _allCourses = [];

  CourseBloc(
    this._getCoursesUseCase,
    this._getCourseByIdUseCase,
    this._getCourseLessonsUseCase,
    this._searchCoursesUseCase,
    this._filterCoursesUseCase,
  ) : super(const CourseState.initial()) {
    on<LoadCoursesEvent>(_onLoadCourses);
    on<LoadCourseByIdEvent>(_onLoadCourseById);
    on<LoadCourseLessonsEvent>(_onLoadCourseLessons);
    on<SearchCoursesEvent>(_onSearchCourses);
    on<FilterByCategoryEvent>(_onFilterByCategory);
    on<FilterByLevelEvent>(_onFilterByLevel);
    on<ClearFiltersEvent>(_onClearFilters);
    on<RefreshCoursesEvent>(_onRefreshCourses);
  }

  /// Load all courses
  Future<void> _onLoadCourses(
    LoadCoursesEvent event,
    Emitter<CourseState> emit,
  ) async {
    emit(const CourseState.loading());

    final result = await _getCoursesUseCase();

    result.fold(
      (failure) => emit(CourseState.error(message: failure.message)),
      (courses) {
        _allCourses = courses;
        emit(CourseState.coursesLoaded(courses: courses));
      },
    );
  }

  /// Load course by ID
  Future<void> _onLoadCourseById(
    LoadCourseByIdEvent event,
    Emitter<CourseState> emit,
  ) async {
    emit(const CourseState.loading());

    final result = await _getCourseByIdUseCase(
      GetCourseByIdParams(courseId: event.courseId),
    );

    result.fold(
      (failure) => emit(CourseState.error(message: failure.message)),
      (course) => emit(CourseState.courseDetailLoaded(course: course)),
    );
  }

  /// Load course lessons
  Future<void> _onLoadCourseLessons(
    LoadCourseLessonsEvent event,
    Emitter<CourseState> emit,
  ) async {
    emit(const CourseState.loading());

    // Load course details first
    final courseResult = await _getCourseByIdUseCase(
      GetCourseByIdParams(courseId: event.courseId),
    );

    await courseResult.fold(
      (failure) async => emit(CourseState.error(message: failure.message)),
      (course) async {
        // Then load lessons
        final lessonsResult = await _getCourseLessonsUseCase(
          GetCourseLessonsParams(courseId: event.courseId),
        );

        lessonsResult.fold(
          (failure) => emit(CourseState.error(message: failure.message)),
          (lessons) => emit(
            CourseState.courseLessonsLoaded(
              course: course,
              lessons: lessons,
            ),
          ),
        );
      },
    );
  }

  /// Search courses
  Future<void> _onSearchCourses(
    SearchCoursesEvent event,
    Emitter<CourseState> emit,
  ) async {
    emit(const CourseState.loading());

    final result = await _searchCoursesUseCase(
      SearchCoursesParams(query: event.query),
    );

    result.fold(
      (failure) => emit(CourseState.error(message: failure.message)),
      (courses) => emit(
        CourseState.coursesLoaded(
          courses: courses,
          searchQuery: event.query,
        ),
      ),
    );
  }

  /// Filter by category
  Future<void> _onFilterByCategory(
    FilterByCategoryEvent event,
    Emitter<CourseState> emit,
  ) async {
    emit(const CourseState.loading());

    final result = await _filterCoursesUseCase(
      FilterCoursesParams(category: event.category),
    );

    result.fold(
      (failure) => emit(CourseState.error(message: failure.message)),
      (courses) => emit(
        CourseState.coursesLoaded(
          courses: courses,
          selectedCategory: event.category,
        ),
      ),
    );
  }

  /// Filter by level
  Future<void> _onFilterByLevel(
    FilterByLevelEvent event,
    Emitter<CourseState> emit,
  ) async {
    emit(const CourseState.loading());

    final result = await _filterCoursesUseCase(
      FilterCoursesParams(level: event.level),
    );

    result.fold(
      (failure) => emit(CourseState.error(message: failure.message)),
      (courses) => emit(
        CourseState.coursesLoaded(
          courses: courses,
          selectedLevel: event.level,
        ),
      ),
    );
  }

  /// Clear filters
  Future<void> _onClearFilters(
    ClearFiltersEvent event,
    Emitter<CourseState> emit,
  ) async {
    emit(const CourseState.loading());

    if (_allCourses.isEmpty) {
      // Load all courses if cache is empty
      final result = await _getCoursesUseCase();
      result.fold(
        (failure) => emit(CourseState.error(message: failure.message)),
        (courses) {
          _allCourses = courses;
          emit(CourseState.coursesLoaded(courses: courses));
        },
      );
    } else {
      emit(CourseState.coursesLoaded(courses: _allCourses));
    }
  }

  /// Refresh courses
  Future<void> _onRefreshCourses(
    RefreshCoursesEvent event,
    Emitter<CourseState> emit,
  ) async {
    // Don't show loading on refresh
    final result = await _getCoursesUseCase();

    result.fold(
      (failure) => emit(CourseState.error(message: failure.message)),
      (courses) {
        _allCourses = courses;
        emit(CourseState.coursesLoaded(courses: courses));
      },
    );
  }
}
