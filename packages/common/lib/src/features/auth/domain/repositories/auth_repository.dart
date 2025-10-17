import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';

/// Authentication repository interface
///
/// This interface defines the contract for authentication operations in the domain layer.
/// Implementations should handle all auth-related data operations and return Either
/// for proper error handling.
///
/// All methods return Either<Failure, T> where:
/// - Left: Contains a Failure object describing what went wrong
/// - Right: Contains the successful result
abstract class AuthRepository {
  /// Login with email and password
  ///
  /// Returns [UserEntity] on success, or [AuthenticationFailure] on failure.
  ///
  /// Possible failures:
  /// - [AuthenticationFailure]: Invalid credentials, user not found, etc.
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  ///
  /// Example:
  /// ```dart
  /// final result = await authRepository.login(
  ///   email: 'user@example.com',
  ///   password: 'password123',
  /// );
  ///
  /// result.fold(
  ///   (failure) => print('Login failed: ${failure.message}'),
  ///   (user) => print('Logged in as: ${user.email}'),
  /// );
  /// ```
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  /// Register a new user with email and password
  ///
  /// Returns [UserEntity] on success, or [ValidationFailure]/[AuthenticationFailure] on failure.
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Invalid email format, weak password, etc.
  /// - [AuthenticationFailure]: Email already in use
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  ///
  /// Example:
  /// ```dart
  /// final result = await authRepository.register(
  ///   email: 'newuser@example.com',
  ///   password: 'SecurePass123!',
  ///   fullName: 'Jean Tremblay',
  /// );
  ///
  /// result.fold(
  ///   (failure) => print('Registration failed: ${failure.message}'),
  ///   (user) => print('Account created for: ${user.email}'),
  /// );
  /// ```
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
    String? fullName,
  });

  /// Logout the current user
  ///
  /// Returns [Unit] on success, or [AuthenticationFailure] on failure.
  ///
  /// Possible failures:
  /// - [AuthenticationFailure]: No user logged in
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  ///
  /// Example:
  /// ```dart
  /// final result = await authRepository.logout();
  ///
  /// result.fold(
  ///   (failure) => print('Logout failed: ${failure.message}'),
  ///   (_) => print('Logged out successfully'),
  /// );
  /// ```
  Future<Either<Failure, Unit>> logout();

  /// Get the currently authenticated user
  ///
  /// Returns [UserEntity] if a user is logged in, or [AuthenticationFailure] if not.
  ///
  /// Possible failures:
  /// - [AuthenticationFailure]: No user logged in, session expired
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  ///
  /// Example:
  /// ```dart
  /// final result = await authRepository.getCurrentUser();
  ///
  /// result.fold(
  ///   (failure) => print('Not logged in'),
  ///   (user) => print('Current user: ${user.email}'),
  /// );
  /// ```
  Future<Either<Failure, UserEntity>> getCurrentUser();

  /// Update user profile information
  ///
  /// Returns updated [UserEntity] on success, or [ValidationFailure]/[AuthenticationFailure] on failure.
  ///
  /// Possible failures:
  /// - [AuthenticationFailure]: No user logged in
  /// - [ValidationFailure]: Invalid data
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  ///
  /// Example:
  /// ```dart
  /// final result = await authRepository.updateProfile(
  ///   fullName: 'Jean-Pierre Tremblay',
  ///   avatarUrl: 'https://example.com/avatar.jpg',
  /// );
  /// ```
  Future<Either<Failure, UserEntity>> updateProfile({
    String? fullName,
    String? avatarUrl,
  });

  /// Send password reset email
  ///
  /// Returns [Unit] on success, or [ValidationFailure]/[NetworkFailure] on failure.
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Invalid email format
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  ///
  /// Example:
  /// ```dart
  /// final result = await authRepository.resetPassword(
  ///   email: 'user@example.com',
  /// );
  ///
  /// result.fold(
  ///   (failure) => print('Failed to send reset email'),
  ///   (_) => print('Reset email sent'),
  /// );
  /// ```
  Future<Either<Failure, Unit>> resetPassword({
    required String email,
  });

  /// Stream of authentication state changes
  ///
  /// Emits [UserEntity] when user logs in, null when user logs out.
  /// This stream allows the app to react to authentication state changes.
  ///
  /// Example:
  /// ```dart
  /// authRepository.authStateChanges.listen((user) {
  ///   if (user != null) {
  ///     print('User logged in: ${user.email}');
  ///   } else {
  ///     print('User logged out');
  ///   }
  /// });
  /// ```
  Stream<UserEntity?> get authStateChanges;
}
