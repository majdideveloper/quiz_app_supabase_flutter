import 'package:equatable/equatable.dart';

/// Base class for all failures in the application
///
/// Failures represent expected errors that can occur during business logic execution.
/// They are used with the Either<Failure, Success> pattern from dartz package.
abstract class Failure extends Equatable {
  final String message;
  final String? code;

  const Failure({
    required this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message, code];
}

/// Failure when server returns an error
class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.code,
  });
}

/// Failure when there's no internet connection
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection. Please check your network settings.',
    super.code = 'NETWORK_ERROR',
  });
}

/// Failure when authentication fails
class AuthenticationFailure extends Failure {
  const AuthenticationFailure({
    required super.message,
    super.code = 'AUTH_ERROR',
  });
}

/// Failure when user is not authorized to perform an action
class AuthorizationFailure extends Failure {
  const AuthorizationFailure({
    super.message = 'You are not authorized to perform this action.',
    super.code = 'AUTHORIZATION_ERROR',
  });
}

/// Failure when requested resource is not found
class NotFoundFailure extends Failure {
  const NotFoundFailure({
    super.message = 'The requested resource was not found.',
    super.code = 'NOT_FOUND',
  });
}

/// Failure when input validation fails
class ValidationFailure extends Failure {
  final Map<String, String>? fieldErrors;

  const ValidationFailure({
    required super.message,
    super.code = 'VALIDATION_ERROR',
    this.fieldErrors,
  });

  @override
  List<Object?> get props => [message, code, fieldErrors];
}

/// Failure when cache operation fails
class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'Failed to access cached data.',
    super.code = 'CACHE_ERROR',
  });
}

/// Failure when database operation fails
class DatabaseFailure extends Failure {
  const DatabaseFailure({
    required super.message,
    super.code = 'DATABASE_ERROR',
  });
}

/// Failure when timeout occurs
class TimeoutFailure extends Failure {
  const TimeoutFailure({
    super.message = 'The operation timed out. Please try again.',
    super.code = 'TIMEOUT_ERROR',
  });
}

/// Generic failure for unexpected errors
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({
    super.message = 'An unexpected error occurred. Please try again.',
    super.code = 'UNEXPECTED_ERROR',
  });
}

/// Failure when a feature is not implemented
class NotImplementedFailure extends Failure {
  const NotImplementedFailure({
    super.message = 'This feature is not yet implemented.',
    super.code = 'NOT_IMPLEMENTED',
  });
}

/// Failure when user cancels an operation
class CancelledFailure extends Failure {
  const CancelledFailure({
    super.message = 'Operation was cancelled.',
    super.code = 'CANCELLED',
  });
}

/// Failure when file storage operation fails
class FileStorageFailure extends Failure {
  const FileStorageFailure({
    required super.message,
    super.code = 'STORAGE_ERROR',
  });
}
