import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:common/common.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

/// Dashboard BLoC
///
/// Manages dashboard state including:
/// - User profile
/// - Enrolled courses
/// - Learning statistics
/// - Recent activity
@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetProfileUseCase _getProfileUseCase;
  final GetUserEnrollmentsUseCase _getUserEnrollmentsUseCase;

  DashboardBloc(
    this._getProfileUseCase,
    this._getUserEnrollmentsUseCase,
  ) : super(const DashboardState.initial()) {
    on<LoadDashboardEvent>(_onLoadDashboard);
    on<RefreshDashboardEvent>(_onRefreshDashboard);
  }

  // ==========================================================================
  // EVENT HANDLERS
  // ==========================================================================

  /// Handles dashboard load request
  Future<void> _onLoadDashboard(
    LoadDashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());

    // Get current user profile
    final profileResult = await _getProfileUseCase();

    await profileResult.fold(
      (failure) async {
        emit(DashboardState.error(message: failure.message));
      },
      (profile) async {
        // Get user enrollments
        final enrollmentsResult = await _getUserEnrollmentsUseCase(profile.id);

        enrollmentsResult.fold(
          (failure) {
            emit(DashboardState.error(message: failure.message));
          },
          (enrollments) {
            // Calculate statistics
            final totalCourses = enrollments.length;
            final completedCourses = enrollments
                .where((e) => e.progress >= 100)
                .length;

            emit(
              DashboardState.loaded(
                profile: profile,
                enrollments: enrollments,
                totalCourses: totalCourses,
                completedCourses: completedCourses,
                totalPoints: profile.totalPoints,
              ),
            );
          },
        );
      },
    );
  }

  /// Handles dashboard refresh request
  Future<void> _onRefreshDashboard(
    RefreshDashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    // Reuse the load logic
    add(const DashboardEvent.loadDashboard());
  }
}
