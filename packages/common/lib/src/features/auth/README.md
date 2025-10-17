# Authentication Feature

## Overview

The Authentication feature provides complete user authentication functionality for the Formation Métiers application using Supabase Auth. It follows Clean Architecture principles with distinct domain, data, and presentation layers.

## Architecture

```
auth/
├── domain/
│   ├── entities/
│   │   └── user_entity.dart          # User domain entity with business logic
│   ├── repositories/
│   │   └── auth_repository.dart      # Repository interface
│   └── usecases/
│       ├── login_usecase.dart        # Login business logic
│       ├── register_usecase.dart     # Registration business logic
│       ├── logout_usecase.dart       # Logout business logic
│       └── get_current_user_usecase.dart  # Get current user
├── data/
│   ├── models/
│   │   └── user_model.dart           # User data model with JSON serialization
│   ├── datasources/
│   │   └── auth_remote_datasource.dart  # Supabase auth implementation
│   └── repositories/
│       └── auth_repository_impl.dart # Repository implementation
└── README.md
```

## Features

### ✅ Implemented

- **User Registration**: Create new accounts with email and password
- **User Login**: Authenticate with email and password
- **User Logout**: Sign out current user
- **Get Current User**: Retrieve authenticated user information
- **Update Profile**: Update user full name and avatar
- **Password Reset**: Send password reset email
- **Auth State Stream**: Listen to authentication state changes
- **Error Handling**: Comprehensive error handling with Either pattern
- **Dependency Injection**: Full GetIt + Injectable integration
- **Logging**: Detailed logging for debugging and monitoring

### 🔜 Future Enhancements

- OAuth providers (Google, Apple)
- Email confirmation flow
- Two-factor authentication
- Session management
- Password strength meter

## Domain Layer

### UserEntity

The core domain entity representing a user in the system.

```dart
import 'package:common/common.dart';

final user = UserEntity(
  id: '123e4567-e89b-12d3-a456-426614174000',
  email: 'jean@example.com',
  fullName: 'Jean Tremblay',
  avatarUrl: 'https://example.com/avatar.jpg',
  role: UserRole.student,
  createdAt: DateTime.now(),
);

// Helper methods
print(user.displayName);  // 'Jean Tremblay' or email if no name
print(user.initials);     // 'JT'
print(user.isStudent);    // true
print(user.hasAvatar);    // true
```

**User Roles:**
- `UserRole.student` - Regular users who enroll in courses
- `UserRole.instructor` - Users who create and manage courses
- `UserRole.admin` - System administrators

### AuthRepository Interface

Defines the contract for authentication operations.

```dart
abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
    String? fullName,
  });

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, UserEntity>> getCurrentUser();

  Future<Either<Failure, UserEntity>> updateProfile({
    String? fullName,
    String? avatarUrl,
  });

  Future<Either<Failure, Unit>> resetPassword({
    required String email,
  });

  Stream<UserEntity?> get authStateChanges;
}
```

### Use Cases

#### LoginUseCase

Handles user authentication with email and password.

```dart
final loginUseCase = getIt<LoginUseCase>();

final result = await loginUseCase(
  LoginParams(
    email: 'jean@example.com',
    password: 'SecurePass123!',
  ),
);

result.fold(
  (failure) {
    // Handle error
    if (failure is AuthenticationFailure) {
      print('Invalid credentials');
    } else if (failure is NetworkFailure) {
      print('No internet connection');
    }
  },
  (user) {
    // Login successful
    print('Welcome ${user.displayName}!');
    print('Role: ${user.role.name}');
  },
);
```

**Validations:**
- Email format validation
- Password not empty

**Possible Failures:**
- `ValidationFailure` - Invalid email or empty password
- `AuthenticationFailure` - Invalid credentials
- `NetworkFailure` - No internet connection
- `ServerFailure` - Server error

#### RegisterUseCase

Handles new user registration.

```dart
final registerUseCase = getIt<RegisterUseCase>();

final result = await registerUseCase(
  RegisterParams(
    email: 'nouveau@example.com',
    password: 'SecurePass123!',
    fullName: 'Jean-Pierre Tremblay',
  ),
);

result.fold(
  (failure) {
    // Handle error
    if (failure is ValidationFailure) {
      print('Validation error: ${failure.message}');
    } else if (failure is AuthenticationFailure) {
      print('Email already in use');
    }
  },
  (user) {
    // Registration successful
    print('Account created for ${user.email}');
  },
);
```

**Validations:**
- Email format (using Validators.isValidEmail)
- Password strength (min 8 chars, uppercase, lowercase, number)
- Full name not empty if provided

**Possible Failures:**
- `ValidationFailure` - Invalid email, weak password, empty name
- `AuthenticationFailure` - Email already in use
- `NetworkFailure` - No internet connection
- `ServerFailure` - Server error

#### LogoutUseCase

Handles user logout.

```dart
final logoutUseCase = getIt<LogoutUseCase>();

final result = await logoutUseCase();

result.fold(
  (failure) => print('Logout failed'),
  (_) => print('Logged out successfully'),
);
```

#### GetCurrentUserUseCase

Retrieves the currently authenticated user.

```dart
final getCurrentUserUseCase = getIt<GetCurrentUserUseCase>();

final result = await getCurrentUserUseCase();

result.fold(
  (failure) {
    // No user logged in
    print('Please login');
  },
  (user) {
    // User is logged in
    print('Current user: ${user.email}');
    print('Role: ${user.role.name}');
  },
);
```

## Data Layer

### UserModel

Data layer model with JSON serialization for API communication.

```dart
// From JSON (Supabase response)
final json = {
  'id': '123e4567-e89b-12d3-a456-426614174000',
  'email': 'jean@example.com',
  'full_name': 'Jean Tremblay',
  'avatar_url': 'https://example.com/avatar.jpg',
  'role': 'student',
  'created_at': '2024-01-15T10:30:00.000Z',
};

final model = UserModel.fromJson(json);

// To JSON
final jsonOutput = model.toJson();

// To domain entity
final entity = model.toEntity();

// From domain entity
final model2 = UserModel.fromEntity(entity);
```

### AuthRemoteDataSource

Handles all remote authentication operations using Supabase.

```dart
@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabase;

  // Login with Supabase Auth
  Future<UserModel> login({
    required String email,
    required String password,
  });

  // Register and create profile
  Future<UserModel> register({
    required String email,
    required String password,
    String? fullName,
  });

  // Other methods...
}
```

**Key Features:**
- Supabase Auth integration
- Automatic profile creation on registration
- Profile data fetching from `profiles` table
- French error messages
- Comprehensive logging

### AuthRepositoryImpl

Implements the repository interface, converting exceptions to failures.

```dart
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  // Converts AuthenticationException -> AuthenticationFailure
  // Converts NetworkException -> NetworkFailure
  // etc.
}
```

## Dependency Injection

All authentication components are registered with GetIt using Injectable.

```dart
// In your app initialization
await configureDependencies();

// Use cases are available via GetIt
final loginUseCase = getIt<LoginUseCase>();
final registerUseCase = getIt<RegisterUseCase>();
final logoutUseCase = getIt<LogoutUseCase>();
final getCurrentUserUseCase = getIt<GetCurrentUserUseCase>();

// Repository is also available
final authRepository = getIt<AuthRepository>();
```

**Registered Components:**
- `LoginUseCase` - @lazySingleton
- `RegisterUseCase` - @lazySingleton
- `LogoutUseCase` - @lazySingleton
- `GetCurrentUserUseCase` - @lazySingleton
- `AuthRemoteDataSource` - @LazySingleton (as AuthRemoteDataSource)
- `AuthRepository` - @LazySingleton (as AuthRepository)

## Database Schema

The authentication feature uses the `profiles` table in Supabase:

```sql
CREATE TABLE public.profiles (
  id UUID REFERENCES auth.users PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  full_name TEXT,
  avatar_url TEXT,
  role TEXT DEFAULT 'student' CHECK (role IN ('student', 'instructor', 'admin')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

**Triggers:**
- Auto-create profile on auth.users insert
- Auto-update `updated_at` on profile changes

**Row Level Security (RLS):**
- Users can read their own profile
- Users can update their own profile
- Admins can read all profiles
- Admins can update user roles

## Error Handling

The feature uses the Either pattern from Dartz for functional error handling.

### Common Failures

```dart
// Validation errors (invalid input)
const ValidationFailure(
  message: 'Format de courriel invalide',
  code: 'INVALID_EMAIL',
);

// Authentication errors (wrong credentials, etc.)
const AuthenticationFailure(
  message: 'Courriel ou mot de passe invalide',
  code: 'INVALID_CREDENTIALS',
);

// Network errors (no internet)
const NetworkFailure(
  message: 'Pas de connexion Internet',
  code: 'NO_CONNECTION',
);

// Server errors (Supabase down, etc.)
const ServerFailure(
  message: 'Erreur du serveur',
  code: 'SERVER_ERROR',
);
```

### Error Handling Pattern

```dart
final result = await loginUseCase(params);

result.fold(
  (failure) {
    // Left side - handle error
    switch (failure.runtimeType) {
      case ValidationFailure:
        showError('Veuillez vérifier vos informations');
        break;
      case AuthenticationFailure:
        showError('Identifiants invalides');
        break;
      case NetworkFailure:
        showError('Vérifiez votre connexion Internet');
        break;
      default:
        showError('Une erreur est survenue');
    }
  },
  (user) {
    // Right side - handle success
    navigateToHome();
  },
);
```

## Usage Examples

### Complete Login Flow

```dart
import 'package:common/common.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginUseCase = getIt<LoginUseCase>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    setState(() => _isLoading = true);

    final result = await _loginUseCase(
      LoginParams(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );

    setState(() => _isLoading = false);

    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.message)),
        );
      },
      (user) {
        Navigator.pushReplacementNamed(context, '/home');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.pagePadding),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Courriel'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            const SizedBox(height: AppSpacing.xl),
            FilledButton(
              onPressed: _isLoading ? null : _handleLogin,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('SE CONNECTER'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Auth State Listener

```dart
class AuthWrapper extends StatefulWidget {
  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final _authRepository = getIt<AuthRepository>();
  StreamSubscription<UserEntity?>? _authSubscription;

  @override
  void initState() {
    super.initState();

    // Listen to auth state changes
    _authSubscription = _authRepository.authStateChanges.listen((user) {
      if (user != null) {
        // User logged in
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // User logged out
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
```

### Profile Update

```dart
Future<void> updateUserProfile() async {
  final authRepository = getIt<AuthRepository>();

  final result = await authRepository.updateProfile(
    fullName: 'Jean-Pierre Tremblay',
    avatarUrl: 'https://example.com/new-avatar.jpg',
  );

  result.fold(
    (failure) => print('Update failed: ${failure.message}'),
    (user) => print('Profile updated: ${user.displayName}'),
  );
}
```

### Password Reset

```dart
Future<void> resetPassword(String email) async {
  final authRepository = getIt<AuthRepository>();

  final result = await authRepository.resetPassword(email: email);

  result.fold(
    (failure) => print('Reset failed: ${failure.message}'),
    (_) => print('Reset email sent to $email'),
  );
}
```

## Testing

### Unit Testing Use Cases

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LoginUseCase(mockRepository);
  });

  test('should return UserEntity on successful login', () async {
    // Arrange
    final user = UserEntity(
      id: '123',
      email: 'test@example.com',
      role: UserRole.student,
      createdAt: DateTime.now(),
    );

    when(mockRepository.login(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenAnswer((_) async => Right(user));

    // Act
    final result = await useCase(
      LoginParams(email: 'test@example.com', password: 'password'),
    );

    // Assert
    expect(result, Right(user));
    verify(mockRepository.login(
      email: 'test@example.com',
      password: 'password',
    )).called(1);
  });

  test('should return ValidationFailure for invalid email', () async {
    // Act
    final result = await useCase(
      LoginParams(email: 'invalid-email', password: 'password'),
    );

    // Assert
    expect(result.isLeft(), true);
    result.fold(
      (failure) => expect(failure, isA<ValidationFailure>()),
      (_) => fail('Should return failure'),
    );
  });
}
```

## Best Practices

### 1. Always Handle Both Sides of Either

```dart
// ✅ Good - handles both success and failure
result.fold(
  (failure) => handleError(failure),
  (user) => handleSuccess(user),
);

// ❌ Bad - doesn't handle failure
result.fold(
  (_) => null,
  (user) => handleSuccess(user),
);
```

### 2. Use Specific Failure Types

```dart
// ✅ Good - specific error handling
result.fold(
  (failure) {
    if (failure is ValidationFailure) {
      showValidationError(failure.message);
    } else if (failure is AuthenticationFailure) {
      showAuthError(failure.message);
    }
  },
  (user) => navigateToHome(),
);

// ❌ Bad - generic error handling
result.fold(
  (failure) => showError('Error occurred'),
  (user) => navigateToHome(),
);
```

### 3. Inject Dependencies

```dart
// ✅ Good - uses dependency injection
class LoginBloc {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase);
}

// ❌ Bad - creates dependencies directly
class LoginBloc {
  final _loginUseCase = LoginUseCase(AuthRepositoryImpl(...));
}
```

### 4. Validate in Use Cases

```dart
// ✅ Good - validation in use case
class LoginUseCase {
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    if (!_isValidEmail(params.email)) {
      return Left(ValidationFailure(...));
    }
    // ...
  }
}
```

## Troubleshooting

### Common Issues

**Issue: "No user logged in" after successful login**
- Check Supabase configuration (URL, anon key)
- Verify auth.users table and profiles table are synced
- Check RLS policies on profiles table

**Issue: Registration creates user but no profile**
- Verify the trigger for auto-creating profiles exists
- Check trigger is enabled
- Review Supabase logs for errors

**Issue: Password reset email not sent**
- Verify email templates configured in Supabase
- Check SMTP settings
- Review Supabase auth logs

**Issue: Dependency injection errors**
- Run `melos run build-runner:common`
- Check all classes have proper Injectable annotations
- Verify `configureDependencies()` is called before using GetIt

## Related Documentation

- [Core Error Handling](../../core/error/README.md)
- [Dependency Injection](../../core/di/README.md)
- [Validators](../../core/utils/README.md)
- [Supabase Client](../../core/network/README.md)

## Support

For issues or questions:
1. Check Supabase documentation: https://supabase.com/docs
2. Review Clean Architecture patterns
3. Check application logs using AppLogger
