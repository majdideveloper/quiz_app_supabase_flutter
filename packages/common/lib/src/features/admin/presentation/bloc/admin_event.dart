import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_event.freezed.dart';

@freezed
class AdminEvent with _$AdminEvent {
  const factory AdminEvent.loadDashboardStats() = LoadDashboardStats;
  const factory AdminEvent.loadAllUsers() = LoadAllUsers;
  const factory AdminEvent.loadAllCourses() = LoadAllCourses;
  const factory AdminEvent.loadAllQuizzes() = LoadAllQuizzes;

  // Actions utilisateur
  const factory AdminEvent.toggleUserStatus({
    required String userId,
    required bool isActive,
  }) = ToggleUserStatus;

  const factory AdminEvent.deleteUser(String userId) = DeleteUser;

  // Actions cours
  const factory AdminEvent.toggleCoursePublished({
    required String courseId,
    required bool isPublished,
  }) = ToggleCoursePublished;

  const factory AdminEvent.deleteCourse(String courseId) = DeleteCourse;

  // Actions quiz
  const factory AdminEvent.toggleQuizPublished({
    required String quizId,
    required bool isPublished,
  }) = ToggleQuizPublished;

  const factory AdminEvent.deleteQuiz(String quizId) = DeleteQuiz;
}
