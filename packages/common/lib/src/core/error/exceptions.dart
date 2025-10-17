/// Base class for all exceptions in the application
///
/// Exceptions represent unexpected errors that occur at the data layer.
/// They are caught and converted to Failures at the repository level.
class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;
  final StackTrace? stackTrace;

  const AppException({
    required this.message,
    this.code,
    this.originalError,
    this.stackTrace,
  });

  @override
  String toString() {
    return 'AppException: $message${code != null ? ' (Code: $code)' : ''}';
  }
}

/// Exception when server returns an error
class ServerException extends AppException {
  const ServerException({
    required super.message,
    super.code,
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'ServerException: $message${code != null ? ' (Code: $code)' : ''}';
  }
}

/// Exception when there's no internet connection
class NetworkException extends AppException {
  const NetworkException({
    super.message = 'No internet connection available',
    super.code = 'NETWORK_ERROR',
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'NetworkException: $message';
  }
}

/// Exception when authentication fails
class AuthenticationException extends AppException {
  const AuthenticationException({
    required super.message,
    super.code = 'AUTH_ERROR',
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'AuthenticationException: $message';
  }
}

/// Exception when user is not authorized
class AuthorizationException extends AppException {
  const AuthorizationException({
    super.message = 'Not authorized to perform this action',
    super.code = 'AUTHORIZATION_ERROR',
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'AuthorizationException: $message';
  }
}

/// Exception when resource is not found
class NotFoundException extends AppException {
  const NotFoundException({
    super.message = 'Resource not found',
    super.code = 'NOT_FOUND',
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'NotFoundException: $message';
  }
}

/// Exception when validation fails
class ValidationException extends AppException {
  final Map<String, String>? fieldErrors;

  const ValidationException({
    required super.message,
    super.code = 'VALIDATION_ERROR',
    this.fieldErrors,
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'ValidationException: $message${fieldErrors != null ? '\nFields: $fieldErrors' : ''}';
  }
}

/// Exception when cache operation fails
class CacheException extends AppException {
  const CacheException({
    super.message = 'Cache operation failed',
    super.code = 'CACHE_ERROR',
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'CacheException: $message';
  }
}

/// Exception when database operation fails
class DatabaseException extends AppException {
  const DatabaseException({
    required super.message,
    super.code = 'DATABASE_ERROR',
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'DatabaseException: $message';
  }
}

/// Exception when timeout occurs
class TimeoutException extends AppException {
  const TimeoutException({
    super.message = 'Operation timed out',
    super.code = 'TIMEOUT_ERROR',
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'TimeoutException: $message';
  }
}

/// Exception for parsing/serialization errors
class ParseException extends AppException {
  const ParseException({
    super.message = 'Failed to parse data',
    super.code = 'PARSE_ERROR',
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'ParseException: $message';
  }
}

/// Exception for unexpected errors
class UnexpectedException extends AppException {
  const UnexpectedException({
    super.message = 'An unexpected error occurred',
    super.code = 'UNEXPECTED_ERROR',
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'UnexpectedException: $message';
  }
}

/// Exception when file storage operation fails
class FileStorageException extends AppException {
  const FileStorageException({
    required super.message,
    super.code = 'STORAGE_ERROR',
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'FileStorageException: $message';
  }
}
