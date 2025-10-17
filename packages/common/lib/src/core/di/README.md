# Dependency Injection Module

## Overview
Manages dependency injection using GetIt service locator and Injectable code generation. Provides a centralized way to register and retrieve dependencies throughout the application.

## Files

### injection_container.dart
Main DI configuration file with GetIt service locator and Injectable setup.

### injection_container.config.dart
Auto-generated file containing all dependency registrations (created by build_runner).

## Setup

### 1. Initialize During App Startup

```dart
// main.dart
import 'package:flutter/material.dart';
import 'package:common/common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase first
  await SupabaseClientWrapper.initialize();

  // Configure dependency injection
  await configureDependencies();

  runApp(const MyApp());
}
```

## Injectable Annotations

### @injectable
Register a class for dependency injection with default scope (factory).

```dart
@injectable
class LoginUseCase implements UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}
```

### @lazySingleton
Register a class as lazy singleton (created once when first requested).

```dart
@lazySingleton
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  // Implementation...
}
```

### @singleton
Register a class as eager singleton (created during initialization).

```dart
@singleton
class AppConfig {
  final String apiUrl;

  AppConfig(this.apiUrl);
}
```

### @LazySingleton(as:)
Register an implementation with an interface.

```dart
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  // Implementation...
}
```

### @Injectable(as:)
Register with interface for factory scope.

```dart
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // Implementation...
}
```

## Scopes

### Factory (Default)
Creates a new instance every time it's requested.

```dart
@injectable
class MyService {
  // New instance on each getIt<MyService>()
}
```

### Lazy Singleton
Creates a single instance when first requested, reuses thereafter.

```dart
@lazySingleton
class MyService {
  // Single instance, created on first request
}
```

### Singleton
Creates a single instance during initialization.

```dart
@singleton
class MyService {
  // Single instance, created immediately
}
```

## Registering External Dependencies

For third-party objects that can't be annotated:

```dart
@module
abstract class RegisterModule {
  @lazySingleton
  SupabaseClient get supabaseClient => SupabaseClientWrapper.instance;

  @lazySingleton
  SharedPreferences get sharedPreferences => // async initialization

  @singleton
  Dio get dio => Dio(BaseOptions(baseUrl: EnvConfig.apiUrl));
}
```

## Retrieving Dependencies

### Simple Retrieval

```dart
// Get an instance
final useCase = getIt<LoginUseCase>();

// Call directly
final result = await getIt<LoginUseCase>()(params);
```

### In BLoC

```dart
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.logoutUseCase,
  }) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  // Event handlers...
}

// In UI - create BLoC with dependencies
BlocProvider(
  create: (context) => getIt<AuthBloc>(),
  child: LoginPage(),
)
```

## Code Generation

### Generate Dependency Injection Code

```bash
# From common package
cd packages/common

# One-time generation
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerates on changes)
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Using Melos

```bash
# From project root
melos build-runner:common
```

## Complete Example

### 1. Define Interfaces

```dart
// domain/repositories/auth_repository.dart
abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, void>> logout();
}
```

### 2. Implement with Injectable

```dart
// data/repositories/auth_repository_impl.dart
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final user = await _remoteDataSource.login(email, password);
      return Right(user.toEntity());
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(message: e.message));
    }
  }
}
```

### 3. Data Source with Injectable

```dart
// data/datasources/auth_remote_datasource.dart
abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabase;

  AuthRemoteDataSourceImpl(this._supabase);

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw const AuthenticationException(message: 'Invalid credentials');
    }

    return UserModel.fromJson(response.user!.toJson());
  }
}
```

### 4. Use Case with Injectable

```dart
// domain/usecases/login_usecase.dart
@injectable
class LoginUseCase implements UseCase<UserEntity, LoginParams> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    // Validation
    if (!Validators.isValidEmail(params.email)) {
      return const Left(ValidationFailure(message: 'Invalid email'));
    }

    // Call repository
    return await _repository.login(params.email, params.password);
  }
}
```

### 5. BLoC with Injectable

```dart
// presentation/bloc/auth_bloc.dart
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc({
    required LoginUseCase loginUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _loginUseCase = loginUseCase,
        _logoutUseCase = logoutUseCase,
        super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }
}
```

### 6. Use in UI

```dart
// In a widget
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // GetIt automatically resolves all dependencies
      create: (context) => getIt<AuthBloc>(),
      child: LoginView(),
    );
  }
}
```

## Dependency Graph

Injectable automatically resolves the entire dependency tree:

```
LoginPage
  └─> AuthBloc (injectable)
      ├─> LoginUseCase (injectable)
      │   └─> AuthRepository (lazySingleton as interface)
      │       └─> AuthRepositoryImpl
      │           └─> AuthRemoteDataSource (lazySingleton as interface)
      │               └─> AuthRemoteDataSourceImpl
      │                   └─> SupabaseClient (lazySingleton via @module)
      └─> LogoutUseCase (injectable)
          └─> AuthRepository (same singleton instance)
```

## Testing

### Mock Dependencies for Testing

```dart
// In tests
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LoginUseCase(mockRepository);
  });

  test('should return user entity on successful login', () async {
    // Arrange
    when(() => mockRepository.login(any(), any()))
        .thenAnswer((_) async => Right(userEntity));

    // Act
    final result = await useCase(LoginParams(
      email: 'test@example.com',
      password: 'password',
    ));

    // Assert
    expect(result, Right(userEntity));
  });
}
```

### Override Dependencies in Tests

```dart
// For integration tests
void main() {
  setUp(() async {
    // Reset GetIt
    await getIt.reset();

    // Register test dependencies
    getIt.registerLazySingleton<AuthRepository>(
      () => MockAuthRepository(),
    );

    await configureDependencies();
  });
}
```

## Best Practices

1. **Use Interfaces**: Always register implementations with their interfaces using `as:`
2. **Lazy Singletons for Repositories**: Use `@lazySingleton` for repositories and data sources
3. **Factory for Use Cases**: Use `@injectable` (factory) for use cases
4. **Injectable for BLoCs**: Use `@injectable` for BLoCs (new instance per screen)
5. **Module for External**: Use `@module` for third-party dependencies
6. **Run Build Runner**: Always run build_runner after adding/changing Injectable annotations
7. **Constructor Injection**: Always inject dependencies through constructors
8. **Test Friendly**: Design for testability by using interfaces

## Troubleshooting

### "No registered instance found"
- Run `flutter pub run build_runner build --delete-conflicting-outputs`
- Ensure class is annotated with `@injectable`, `@lazySingleton`, or `@singleton`
- Check that `configureDependencies()` was called

### "Circular dependency detected"
- Review your dependency graph
- Consider using lazy initialization or breaking the cycle

### Changes not reflected
- Delete generated files: `find . -name "*.g.dart" -delete`
- Run build_runner again
- Restart your IDE

## Migration from Manual Registration

Before (manual):
```dart
void setupDependencies() {
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );
  getIt.registerFactory<LoginUseCase>(
    () => LoginUseCase(getIt()),
  );
}
```

After (Injectable):
```dart
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository { ... }

@injectable
class LoginUseCase { ... }

// Just call configureDependencies()
```
