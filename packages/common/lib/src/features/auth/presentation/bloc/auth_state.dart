import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common/common.dart';

part 'auth_state.freezed.dart';

/// Authentication states using Freezed
@freezed
class AuthState with _$AuthState {
  /// Initial authentication state
  const factory AuthState.initial() = AuthInitial;

  /// Authentication loading state
  const factory AuthState.loading() = AuthLoading;

  /// User is authenticated
  const factory AuthState.authenticated(UserEntity user) = AuthAuthenticated;

  /// User is not authenticated
  const factory AuthState.unauthenticated() = AuthUnauthenticated;

  /// Authentication error state
  const factory AuthState.error(String message) = AuthError;
}
