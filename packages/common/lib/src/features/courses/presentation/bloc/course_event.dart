import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common/common.dart';

part 'course_event.freezed.dart';

/// Course events
@freezed
class CourseEvent with _$CourseEvent {
  /// Load all courses
  const factory CourseEvent.loadCourses() = LoadCoursesEvent;

  /// Load course by ID
  const factory CourseEvent.loadCourseById(String courseId) =
      LoadCourseByIdEvent;

  /// Load course lessons
  const factory CourseEvent.loadCourseLessons(String courseId) =
      LoadCourseLessonsEvent;

  /// Search courses
  const factory CourseEvent.searchCourses(String query) = SearchCoursesEvent;

  /// Filter courses by category
  const factory CourseEvent.filterByCategory(CourseCategory category) =
      FilterByCategoryEvent;

  /// Filter courses by level
  const factory CourseEvent.filterByLevel(CourseLevel level) =
      FilterByLevelEvent;

  /// Clear filters
  const factory CourseEvent.clearFilters() = ClearFiltersEvent;

  /// Refresh courses
  const factory CourseEvent.refreshCourses() = RefreshCoursesEvent;
}
