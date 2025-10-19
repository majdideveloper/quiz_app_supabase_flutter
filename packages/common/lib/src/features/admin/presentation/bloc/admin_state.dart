import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/admin_stats_entity.dart';
import '../../../profile/domain/entities/profile_entity.dart';
import '../../../courses/domain/entities/course_entity.dart';
import '../../../quizzes/domain/entities/quiz_entity.dart';

part 'admin_state.freezed.dart';

@freezed
class AdminState with _$AdminState {
  const factory AdminState.initial() = _Initial;

  const factory AdminState.loading() = _Loading;

  const factory AdminState.dashboardLoaded({
    required AdminStatsEntity stats,
  }) = _DashboardLoaded;

  const factory AdminState.usersLoaded({
    required List<ProfileEntity> users,
  }) = _UsersLoaded;

  const factory AdminState.coursesLoaded({
    required List<CourseEntity> courses,
  }) = _CoursesLoaded;

  const factory AdminState.quizzesLoaded({
    required List<QuizEntity> quizzes,
  }) = _QuizzesLoaded;

  const factory AdminState.error(String message) = _Error;
}
