import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common/common.dart';

part 'course_state.freezed.dart';

/// Course states
@freezed
class CourseState with _$CourseState {
  /// Initial state
  const factory CourseState.initial() = CourseInitial;

  /// Loading state
  const factory CourseState.loading() = CourseLoading;

  /// Courses loaded successfully
  const factory CourseState.coursesLoaded({
    required List<CourseEntity> courses,
    CourseCategory? selectedCategory,
    CourseLevel? selectedLevel,
    String? searchQuery,
  }) = CoursesLoaded;

  /// Single course loaded
  const factory CourseState.courseDetailLoaded({
    required CourseEntity course,
  }) = CourseDetailLoaded;

  /// Course lessons loaded
  const factory CourseState.courseLessonsLoaded({
    required CourseEntity course,
    required List<LessonEntity> lessons,
  }) = CourseLessonsLoaded;

  /// Error state
  const factory CourseState.error({
    required String message,
  }) = CourseError;
}
