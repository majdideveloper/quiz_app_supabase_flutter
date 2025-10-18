import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common/common.dart';

part 'dashboard_state.freezed.dart';

/// Dashboard states
@freezed
class DashboardState with _$DashboardState {
  /// Initial state
  const factory DashboardState.initial() = DashboardInitial;

  /// Loading state
  const factory DashboardState.loading() = DashboardLoading;

  /// Loaded state with dashboard data
  const factory DashboardState.loaded({
    required ProfileEntity profile,
    required List<EnrollmentEntity> enrollments,
    required int totalCourses,
    required int completedCourses,
    required int totalPoints,
  }) = DashboardLoaded;

  /// Error state
  const factory DashboardState.error({required String message}) = DashboardError;
}
