# Error Handling Module

## Overview
Provides comprehensive error handling for the application using the Either pattern from dartz. This module defines failures (expected errors) and exceptions (unexpected errors) to ensure consistent error handling across all layers.

## Architecture

```
Data Layer          Repository Layer       Domain/Presentation Layer
───────────         ────────────────       ─────────────────────────
Exception    ──────> Caught & Converted ──> Failure
(throw)             to Either              (returned)
```

## Files

### failures.dart
Defines failure types for expected errors returned from use cases.

**Base Class:**
```dart
abstract class Failure extends Equatable {
  final String message;
  final String? code;
}
```

**Available Failures:**
- `ServerFailure` - Server-side errors
- `NetworkFailure` - No internet connection
- `AuthenticationFailure` - Login/signup failures
- `AuthorizationFailure` - Permission denied
- `NotFoundFailure` - Resource not found (404)
- `ValidationFailure` - Input validation errors
- `CacheFailure` - Local cache errors
- `DatabaseFailure` - Database operation errors
- `TimeoutFailure` - Request timeout
- `UnexpectedFailure` - Catch-all for unexpected errors
- `NotImplementedFailure` - Feature not yet implemented
- `CancelledFailure` - User cancelled operation

### exceptions.dart
Defines exception types thrown at the data layer.

**Base Class:**
```dart
class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;
  final StackTrace? stackTrace;
}
```

**Available Exceptions:**
- `ServerException` - Server errors
- `NetworkException` - Network connectivity issues
- `AuthenticationException` - Auth failures
- `AuthorizationException` - Permission issues
- `NotFoundException` - Resource not found
- `ValidationException` - Data validation errors (includes field-level errors)
- `CacheException` - Cache operation failures
- `DatabaseException` - Database errors
- `TimeoutException` - Operation timeout
- `ParseException` - JSON/data parsing errors
- `UnexpectedException` - Unexpected errors

## Usage Patterns

### 1. Data Layer (Throwing Exceptions)
```dart
// In data sources
class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw const AuthenticationException(
          message: 'Invalid credentials',
        );
      }

      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw AuthenticationException(
        message: e.message,
        code: e.statusCode,
        originalError: e,
      );
    } catch (e, stackTrace) {
      throw UnexpectedException(
        message: 'Failed to login',
        originalError: e,
        stackTrace: stackTrace,
      );
    }
  }
}
```

### 2. Repository Layer (Converting to Either)
```dart
// In repository implementations
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      return Right(userModel.toEntity());
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(message: e.message, code: e.code));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
```

### 3. Use Case Layer (Returning Either)
```dart
// In use cases
class LoginUseCase implements UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    // Validation
    if (!EmailValidator.validate(params.email)) {
      return const Left(ValidationFailure(
        message: 'Invalid email format',
      ));
    }

    // Call repository
    return await repository.login(params.email, params.password);
  }
}
```

### 4. Presentation Layer (Handling Failures)
```dart
// In BLoC event handlers
Future<void> _onLoginRequested(
  LoginRequested event,
  Emitter<AuthState> emit,
) async {
  emit(AuthLoading());

  final result = await loginUseCase(
    LoginParams(email: event.email, password: event.password),
  );

  result.fold(
    (failure) {
      // Handle different failure types
      if (failure is NetworkFailure) {
        emit(AuthError(message: 'No internet connection'));
      } else if (failure is AuthenticationFailure) {
        emit(AuthError(message: 'Invalid email or password'));
      } else {
        emit(AuthError(message: failure.message));
      }
    },
    (user) => emit(AuthAuthenticated(user)),
  );
}
```

## Validation Exception with Field Errors

```dart
// Throwing validation exception with field errors
throw ValidationException(
  message: 'Form validation failed',
  fieldErrors: {
    'email': 'Invalid email format',
    'password': 'Password must be at least 8 characters',
  },
);

// Handling in UI
if (failure is ValidationFailure && failure.fieldErrors != null) {
  // Show field-specific errors
  failure.fieldErrors!.forEach((field, error) {
    formKey.currentState?.fields[field]?.invalidate(error);
  });
}
```

## Best Practices

1. **Always use Either in repositories and use cases**
   - Never throw exceptions from repositories or use cases
   - Always return `Either<Failure, Success>`

2. **Throw exceptions only in data sources**
   - Data sources should throw specific exceptions
   - Include original error for debugging

3. **Convert exceptions to failures in repositories**
   - Catch all possible exceptions
   - Map to appropriate failure types
   - Add context-specific messages

4. **Handle failures in presentation layer**
   - Use `fold()` to handle both success and failure cases
   - Show user-friendly messages
   - Log detailed errors for debugging

5. **Provide meaningful error messages**
   - User-facing messages should be clear and actionable
   - Include error codes for debugging
   - Preserve stack traces for unexpected errors

## Error Code Conventions

- `AUTH_ERROR` - Authentication issues
- `AUTHORIZATION_ERROR` - Permission issues
- `NETWORK_ERROR` - Network connectivity
- `SERVER_ERROR` - Server-side errors (5xx)
- `NOT_FOUND` - Resource not found (404)
- `VALIDATION_ERROR` - Input validation
- `DATABASE_ERROR` - Database operations
- `CACHE_ERROR` - Cache operations
- `TIMEOUT_ERROR` - Request timeout
- `PARSE_ERROR` - Data parsing/serialization
- `UNEXPECTED_ERROR` - Unexpected errors

## Testing

```dart
// Testing failures
test('should return AuthenticationFailure when login fails', () async {
  // Arrange
  when(() => remoteDataSource.login(any(), any()))
      .thenThrow(const AuthenticationException(message: 'Invalid credentials'));

  // Act
  final result = await repository.login('test@example.com', 'password');

  // Assert
  expect(result, isA<Left<Failure, UserEntity>>());
  result.fold(
    (failure) => expect(failure, isA<AuthenticationFailure>()),
    (_) => fail('Should return failure'),
  );
});
```
