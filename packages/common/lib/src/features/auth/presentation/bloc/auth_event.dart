import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

/// Authentication events using Freezed
@freezed
class AuthEvent with _$AuthEvent {
  /// Event to check current authentication status
  const factory AuthEvent.checkRequested() = AuthCheckRequested;

  /// Event to login with email and password
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = AuthLoginRequested;

  /// Event to register a new user
  const factory AuthEvent.registerRequested({
    required String email,
    required String password,
    required String fullName,
  }) = AuthRegisterRequested;

  /// Event to logout the current user
  const factory AuthEvent.logoutRequested() = AuthLogoutRequested;
}
