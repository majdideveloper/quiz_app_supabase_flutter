# Authentication Feature - Mobile

## Overview
Mobile UI layer for user authentication, including login and registration screens with form validation.

## Architecture

### BLoC Pattern with Freezed
- **auth_bloc.dart**: Main BLoC managing authentication state
- **auth_event.dart**: Authentication events (Freezed union types)
- **auth_state.dart**: Authentication states (Freezed union types)

### Pages
- **login_page.dart**: Login screen with email/password form
- **register_page.dart**: Registration screen with full name, email, and password

### Widgets
- **login_form.dart**: Reusable login form with validation
- **register_form.dart**: Reusable registration form with validation

## Events (Freezed)

```dart
AuthEvent.checkRequested()         // Check authentication status
AuthEvent.loginRequested()          // Login with email/password
AuthEvent.registerRequested()       // Register new user
AuthEvent.logoutRequested()         // Logout current user
```

## States (Freezed)

```dart
AuthState.initial()                 // Initial state
AuthState.loading()                 // Processing request
AuthState.authenticated(UserEntity) // User logged in
AuthState.unauthenticated()         // User logged out
AuthState.error(String)             // Error occurred
```

## Form Validation

### Login Form
- Email: Valid format, required
- Password: Minimum 8 characters, required

### Register Form
- Full Name: Minimum 3 characters, required
- Email: Valid format, required
- Password: Minimum 8 characters, must contain uppercase, lowercase, and digit
- Confirm Password: Must match password

## Navigation Flow

```
LoginPage → (success) → /dashboard
LoginPage → (register link) → RegisterPage
RegisterPage → (success) → /dashboard
RegisterPage → (login link) → LoginPage
```

## Dependencies from Common Package

- **Theme**: AppTheme (no duplication)
- **Colors**: AppColors
- **Typography**: AppTypography
- **Spacing**: AppSpacing
- **Validators**: Validators.isValidEmail(), Validators.isStrongPassword()
- **Use Cases**: LoginUseCase, RegisterUseCase, LogoutUseCase, GetCurrentUserUseCase
- **Entities**: UserEntity

## Usage Example

```dart
// Provide BLoC
BlocProvider(
  create: (context) => getIt<AuthBloc>(),
  child: const LoginPage(),
)

// Trigger login event
context.read<AuthBloc>().add(
  AuthEvent.loginRequested(
    email: 'user@example.com',
    password: 'password123',
  ),
);

// Listen to state changes
BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
    state.maybeWhen(
      authenticated: (user) => context.go('/dashboard'),
      error: (message) => showSnackBar(message),
      orElse: () {},
    );
  },
  builder: (context, state) {
    // Build UI based on state
  },
)
```

## Error Handling

Errors are displayed via SnackBar with:
- Error message from failure
- Red background (AppColors.error)
- Automatic dismissal

## Loading States

Loading indicators are shown on:
- Login button (circular progress)
- Register button (circular progress)
- Form fields are disabled during loading

## Security

- Passwords are obscured by default
- Toggle visibility with eye icon
- No sensitive data logged
- Secure storage via Supabase auth

## Testing

Run BLoC tests:
```bash
cd packages/mobile
flutter test test/features/auth/presentation/bloc/
```

## Future Enhancements

- [ ] Social authentication (Google, Apple)
- [ ] Forgot password flow
- [ ] Email verification UI
- [ ] Biometric authentication
- [ ] Remember me checkbox
