# Utils Module

## Overview
Provides utility functions and helper classes used throughout the application, including logging and input validation.

## Files

### logger.dart
Application-wide logger with environment-aware configuration.

### validators.dart
Input validation utilities for forms and user input.

## Logger Usage

### Basic Logging

```dart
import 'package:common/common.dart';

// Debug messages (development only)
AppLogger.debug('User tapped login button');

// Info messages (development + staging)
AppLogger.info('User successfully logged in');

// Warning messages (all environments)
AppLogger.warning('API rate limit approaching');

// Error messages (all environments)
AppLogger.error('Failed to fetch courses', error: exception, stackTrace: trace);

// Fatal errors (all environments)
AppLogger.fatal('Critical system error', error: error);
```

### Specialized Logging

```dart
// Log API requests
AppLogger.logRequest(
  'POST',
  '/api/auth/login',
  body: {'email': 'user@example.com'},
);

// Log API responses
AppLogger.logResponse('POST', '/api/auth/login', 200, body: responseData);

// Log BLoC events
AppLogger.logBlocEvent('AuthBloc', LoginRequested(email: email));

// Log BLoC state transitions
AppLogger.logBlocTransition('AuthBloc', currentState, nextState);

// Log BLoC errors
AppLogger.logBlocError('AuthBloc', error, stackTrace);

// Log use case execution
AppLogger.logUseCase('LoginUseCase', LoginParams(email: email));

// Log repository operations
AppLogger.logRepository('login', params: {'email': email});
```

### Environment-Based Logging

Logging levels automatically adjust based on environment:

**Development:**
- All logs (trace, debug, info, warning, error, fatal)
- Verbose output with colors and emojis
- Full stack traces

**Staging:**
- Info and above (info, warning, error, fatal)
- Moderate verbosity

**Production:**
- Warnings and errors only (warning, error, fatal)
- Minimal verbosity
- Privacy-focused (no sensitive data)

## Validators Usage

### Email Validation

```dart
// Simple validation
if (Validators.isValidEmail('user@example.com')) {
  print('Valid email');
}

// In form validation
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  if (!Validators.isValidEmail(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}
```

### Password Validation

```dart
// Default requirements (8+ chars, uppercase, lowercase, number)
final error = Validators.validatePassword('MyPass123');
if (error != null) {
  print(error); // null = valid
}

// Custom requirements
final error = Validators.validatePassword(
  'password',
  minLength: 12,
  requireUppercase: true,
  requireLowercase: true,
  requireNumber: true,
  requireSpecialChar: true,
);
```

### Required Field Validation

```dart
// Basic required field
final error = Validators.required(value);

// With custom field name
final error = Validators.required(value, fieldName: 'Email');
// Returns: "Email is required" if empty
```

### Length Validation

```dart
// Minimum length
final error = Validators.minLength(value, 8, fieldName: 'Password');

// Maximum length
final error = Validators.maxLength(value, 100, fieldName: 'Bio');
```

### Numeric Validation

```dart
// Must be a number
final error = Validators.isNumeric(value, fieldName: 'Age');

// Must be an integer
final error = Validators.isInteger(value, fieldName: 'Quantity');

// Minimum value
final error = Validators.minValue(value, 0, fieldName: 'Price');

// Maximum value
final error = Validators.maxValue(value, 100, fieldName: 'Percentage');
```

### Phone Number Validation

```dart
// North American format
if (Validators.isValidPhoneNumber('(514) 555-1234')) {
  print('Valid phone number');
}

// Accepts: (514) 555-1234, 514-555-1234, 5145551234
```

### Canadian Postal Code Validation

```dart
// Any Canadian postal code
if (Validators.isValidCanadianPostalCode('H1A 1A1')) {
  print('Valid postal code');
}

// Quebec-specific (starts with G, H, or J)
if (Validators.isValidQuebecPostalCode('H1A 1A1')) {
  print('Valid Quebec postal code');
}
```

### URL Validation

```dart
if (Validators.isValidUrl('https://example.com')) {
  print('Valid URL');
}
```

### Password Confirmation

```dart
// Match two fields
final error = Validators.matches(
  confirmPassword,
  password,
  fieldName: 'Password confirmation',
);
```

### Date Validation

```dart
// Valid date format (YYYY-MM-DD)
if (Validators.isValidDate('2025-01-15')) {
  print('Valid date');
}

// Must be in the past
final error = Validators.isPastDate(birthDate, fieldName: 'Birth date');

// Must be in the future
final error = Validators.isFutureDate(eventDate, fieldName: 'Event date');

// Age validation (e.g., must be 18+)
final error = Validators.isAgeValid(birthDate, 18);
```

### Credit Card Validation

```dart
// Luhn algorithm validation
if (Validators.isValidCreditCard('4532 1234 5678 9010')) {
  print('Valid credit card number');
}
```

### Composing Validators

Combine multiple validators for complex validation:

```dart
// Create a composite validator
final passwordValidator = Validators.compose([
  (value) => Validators.required(value, fieldName: 'Password'),
  (value) => Validators.minLength(value, 8, fieldName: 'Password'),
  (value) => Validators.validatePassword(value),
]);

// Use in form
TextFormField(
  validator: passwordValidator,
  decoration: InputDecoration(labelText: 'Password'),
);
```

### Form Validation Example

```dart
class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    final requiredError = Validators.required(value, fieldName: 'Email');
    if (requiredError != null) return requiredError;

    if (!Validators.isValidEmail(value!)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final requiredError = Validators.required(value, fieldName: 'Password');
    if (requiredError != null) return requiredError;

    return Validators.validatePassword(value!);
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with login
      AppLogger.info('Login form validated successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            validator: _validateEmail,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: _passwordController,
            validator: _validatePassword,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(
            onPressed: _submit,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
```

## Best Practices

### Logging

1. **Use Appropriate Levels**: Debug for development, info for general events, warning for issues, error for failures
2. **Don't Log Sensitive Data**: Never log passwords, tokens, or personal information
3. **Include Context**: Add relevant parameters and error details
4. **Use Specialized Methods**: Use `logBlocEvent`, `logUseCase`, etc. for better tracking
5. **Error Logging**: Always include error object and stack trace

### Validation

1. **Validate Early**: Check input at the presentation layer before passing to use cases
2. **Provide Clear Messages**: Use fieldName parameter for user-friendly error messages
3. **Compose Validators**: Combine multiple validators for complex validation logic
4. **Server-Side Validation**: Always validate on the server too, client validation is just UX
5. **Reuse Validators**: Create shared validators for common patterns

## Testing

### Testing Validators

```dart
test('should return error for invalid email', () {
  final result = Validators.isValidEmail('invalid-email');
  expect(result, false);
});

test('should validate password with correct requirements', () {
  final result = Validators.validatePassword('SecurePass123!');
  expect(result, null); // null means valid
});
```

### Testing with Logger

```dart
// Mock logger in tests if needed
setUp(() {
  // Logger automatically uses appropriate filter for test environment
});

test('should log error when operation fails', () {
  // Your test code
  AppLogger.error('Test error', error: exception);
  // Logger will output to console during tests
});
```
