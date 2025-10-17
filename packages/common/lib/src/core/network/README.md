# Network Module

## Overview
Manages network-related functionality, primarily the Supabase client configuration and initialization.

## Files

### supabase_client.dart
Provides a singleton wrapper for the Supabase client with environment-specific configuration.

## Usage

### Initialization
Initialize Supabase client once during app startup:

```dart
// In main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await SupabaseClientWrapper.initialize();

  // Initialize dependency injection
  await configureDependencies();

  runApp(const MyApp());
}
```

### Accessing the Client
Access the Supabase client from anywhere in the app:

```dart
// Get the client instance
final supabase = SupabaseClientWrapper.instance;

// Use for database operations
final response = await supabase
    .from('courses')
    .select()
    .eq('is_published', true);

// Use for authentication
await supabase.auth.signInWithPassword(
  email: 'user@example.com',
  password: 'password',
);
```

### Auth State Management
```dart
// Check if user is authenticated
if (SupabaseClientWrapper.isAuthenticated) {
  print('User is logged in');
}

// Get current user
final user = SupabaseClientWrapper.currentUser;
if (user != null) {
  print('User ID: ${user.id}');
  print('Email: ${user.email}');
}

// Get current session
final session = SupabaseClientWrapper.currentSession;
if (session != null) {
  print('Access Token: ${session.accessToken}');
}

// Listen to auth state changes
SupabaseClientWrapper.authStateChanges.listen((AuthState state) {
  if (state.event == AuthChangeEvent.signedIn) {
    print('User signed in: ${state.session?.user.email}');
  } else if (state.event == AuthChangeEvent.signedOut) {
    print('User signed out');
  }
});
```

### Sign Out
```dart
await SupabaseClientWrapper.signOut();
```

## Data Source Pattern

Use the Supabase client in data sources:

```dart
import 'package:injectable/injectable.dart';
import '../../core/network/supabase_client.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabase;

  // Inject via constructor
  AuthRemoteDataSourceImpl(this._supabase);

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw const AuthenticationException(
          message: 'Invalid credentials',
        );
      }

      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      // Handle errors
      throw AuthenticationException(message: e.toString());
    }
  }
}
```

## Dependency Injection

Register Supabase client with GetIt:

```dart
// In injection_container.dart
@module
abstract class NetworkModule {
  @lazySingleton
  SupabaseClient get supabaseClient => SupabaseClientWrapper.instance;
}
```

## Environment Configuration

The client automatically uses environment-specific configuration:

**Development (.env.develop):**
```env
SUPABASE_URL=http://localhost:54321
SUPABASE_ANON_KEY=your_local_anon_key
```

**Staging (.env.staging):**
```env
SUPABASE_URL=https://your-project-staging.supabase.co
SUPABASE_ANON_KEY=your_staging_anon_key
```

**Production (.env.production):**
```env
SUPABASE_URL=https://your-project-prod.supabase.co
SUPABASE_ANON_KEY=your_production_anon_key
```

## Debug Mode

Debug mode is automatically enabled for development environment:
- Logs network requests and responses
- Shows detailed error messages
- Helps with troubleshooting

## Error Handling

The wrapper validates configuration on initialization:

```dart
try {
  await SupabaseClientWrapper.initialize();
} catch (e) {
  print('Failed to initialize Supabase: $e');
  // Handle initialization failure
}
```

Common errors:
- `SUPABASE_URL is not set` - Missing URL in environment config
- `SUPABASE_ANON_KEY is not set` - Missing anon key in environment config
- `SupabaseClient not initialized` - Trying to access client before initialization

## Testing

For testing, you can mock the Supabase client:

```dart
// In tests
class MockSupabaseClient extends Mock implements SupabaseClient {}

void main() {
  late MockSupabaseClient mockSupabase;
  late AuthRemoteDataSourceImpl dataSource;

  setUp(() {
    mockSupabase = MockSupabaseClient();
    dataSource = AuthRemoteDataSourceImpl(mockSupabase);
  });

  test('login should return user model on success', () async {
    // Arrange
    when(() => mockSupabase.auth.signInWithPassword(
      email: any(named: 'email'),
      password: any(named: 'password'),
    )).thenAnswer((_) async => AuthResponse(
      user: User(...),
      session: Session(...),
    ));

    // Act
    final result = await dataSource.login('test@example.com', 'password');

    // Assert
    expect(result, isA<UserModel>());
  });
}
```

## Best Practices

1. **Initialize Once**: Call `initialize()` only once during app startup
2. **Use Dependency Injection**: Inject SupabaseClient into data sources
3. **Handle Auth State**: Listen to auth state changes for session management
4. **Error Handling**: Wrap all Supabase operations in try-catch blocks
5. **Environment-Specific**: Use different configurations for dev/staging/prod
6. **Secure Keys**: Never commit actual keys to version control
7. **Testing**: Mock SupabaseClient for unit tests
