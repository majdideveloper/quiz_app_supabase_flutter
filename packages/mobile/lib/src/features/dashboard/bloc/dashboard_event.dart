import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_event.freezed.dart';

/// Dashboard events
@freezed
class DashboardEvent with _$DashboardEvent {
  /// Load dashboard data
  const factory DashboardEvent.loadDashboard() = LoadDashboardEvent;

  /// Refresh dashboard
  const factory DashboardEvent.refreshDashboard() = RefreshDashboardEvent;
}
