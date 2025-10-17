/// Utility class for input validation
///
/// Provides common validation methods for forms and user input
class Validators {
  /// Private constructor to prevent instantiation
  Validators._();

  /// Validate email format
  ///
  /// Returns true if email is valid, false otherwise
  static bool isValidEmail(String email) {
    if (email.isEmpty) return false;

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(email);
  }

  /// Check if password is strong (returns boolean)
  ///
  /// Requirements:
  /// - At least 8 characters
  /// - At least one uppercase letter
  /// - At least one lowercase letter
  /// - At least one number
  static bool isStrongPassword(String password) {
    if (password.length < 8) return false;
    if (!password.contains(RegExp(r'[A-Z]'))) return false;
    if (!password.contains(RegExp(r'[a-z]'))) return false;
    if (!password.contains(RegExp(r'[0-9]'))) return false;
    return true;
  }

  /// Validate password strength
  ///
  /// Returns null if valid, error message if invalid
  ///
  /// Requirements:
  /// - At least [minLength] characters (default: 8)
  /// - At least one uppercase letter (if [requireUppercase] is true)
  /// - At least one lowercase letter (if [requireLowercase] is true)
  /// - At least one number (if [requireNumber] is true)
  /// - At least one special character (if [requireSpecialChar] is true)
  static String? validatePassword(
    String password, {
    int minLength = 8,
    bool requireUppercase = true,
    bool requireLowercase = true,
    bool requireNumber = true,
    bool requireSpecialChar = false,
  }) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    }

    if (password.length < minLength) {
      return 'Password must be at least $minLength characters';
    }

    if (requireUppercase && !password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    if (requireLowercase && !password.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    if (requireNumber && !password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    if (requireSpecialChar &&
        !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null; // Valid
  }

  /// Validate phone number format (North American)
  ///
  /// Accepts formats: (123) 456-7890, 123-456-7890, 1234567890
  static bool isValidPhoneNumber(String phone) {
    if (phone.isEmpty) return false;

    final phoneRegex = RegExp(
      r'^(\+1)?[\s-]?\(?[2-9]\d{2}\)?[\s-]?\d{3}[\s-]?\d{4}$',
    );

    return phoneRegex.hasMatch(phone);
  }

  /// Validate that field is not empty
  static String? required(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    return null;
  }

  /// Validate minimum length
  static String? minLength(
    String? value,
    int min, {
    String? fieldName,
  }) {
    if (value == null || value.length < min) {
      return '${fieldName ?? 'This field'} must be at least $min characters';
    }
    return null;
  }

  /// Validate maximum length
  static String? maxLength(
    String? value,
    int max, {
    String? fieldName,
  }) {
    if (value != null && value.length > max) {
      return '${fieldName ?? 'This field'} must be at most $max characters';
    }
    return null;
  }

  /// Validate numeric input
  static String? isNumeric(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) return null;

    if (double.tryParse(value) == null) {
      return '${fieldName ?? 'This field'} must be a number';
    }
    return null;
  }

  /// Validate integer input
  static String? isInteger(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) return null;

    if (int.tryParse(value) == null) {
      return '${fieldName ?? 'This field'} must be a whole number';
    }
    return null;
  }

  /// Validate minimum value
  static String? minValue(
    String? value,
    num min, {
    String? fieldName,
  }) {
    if (value == null || value.isEmpty) return null;

    final numValue = num.tryParse(value);
    if (numValue == null) {
      return '${fieldName ?? 'This field'} must be a number';
    }

    if (numValue < min) {
      return '${fieldName ?? 'This field'} must be at least $min';
    }
    return null;
  }

  /// Validate maximum value
  static String? maxValue(
    String? value,
    num max, {
    String? fieldName,
  }) {
    if (value == null || value.isEmpty) return null;

    final numValue = num.tryParse(value);
    if (numValue == null) {
      return '${fieldName ?? 'This field'} must be a number';
    }

    if (numValue > max) {
      return '${fieldName ?? 'This field'} must be at most $max';
    }
    return null;
  }

  /// Validate URL format
  static bool isValidUrl(String url) {
    if (url.isEmpty) return false;

    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && (uri.hasAuthority || uri.host.isNotEmpty);
    } catch (e) {
      return false;
    }
  }

  /// Validate that two values match (e.g., password confirmation)
  static String? matches(
    String? value,
    String? otherValue, {
    String? fieldName,
  }) {
    if (value != otherValue) {
      return '${fieldName ?? 'This field'} does not match';
    }
    return null;
  }

  /// Validate Quebec postal code format (H1A 1A1)
  static bool isValidQuebecPostalCode(String postalCode) {
    if (postalCode.isEmpty) return false;

    // Quebec postal codes start with G, H, or J
    final postalCodeRegex = RegExp(
      r'^[GHJ][0-9][A-Z]\s?[0-9][A-Z][0-9]$',
      caseSensitive: false,
    );

    return postalCodeRegex.hasMatch(postalCode);
  }

  /// Validate Canadian postal code format
  static bool isValidCanadianPostalCode(String postalCode) {
    if (postalCode.isEmpty) return false;

    final postalCodeRegex = RegExp(
      r'^[A-Z][0-9][A-Z]\s?[0-9][A-Z][0-9]$',
      caseSensitive: false,
    );

    return postalCodeRegex.hasMatch(postalCode);
  }

  /// Compose multiple validators
  ///
  /// Returns the first error message encountered, or null if all pass
  ///
  /// Example:
  /// ```dart
  /// final validator = Validators.compose([
  ///   (value) => Validators.required(value),
  ///   (value) => Validators.minLength(value, 8),
  /// ]);
  /// ```
  static String? Function(String?) compose(
    List<String? Function(String?)> validators,
  ) {
    return (String? value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) return error;
      }
      return null;
    };
  }

  /// Validate credit card number using Luhn algorithm
  static bool isValidCreditCard(String cardNumber) {
    if (cardNumber.isEmpty) return false;

    // Remove spaces and dashes
    final cleaned = cardNumber.replaceAll(RegExp(r'[\s-]'), '');

    // Must be numeric
    if (!RegExp(r'^\d+$').hasMatch(cleaned)) return false;

    // Must be between 13 and 19 digits
    if (cleaned.length < 13 || cleaned.length > 19) return false;

    // Luhn algorithm
    int sum = 0;
    bool alternate = false;

    for (int i = cleaned.length - 1; i >= 0; i--) {
      int digit = int.parse(cleaned[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
      alternate = !alternate;
    }

    return sum % 10 == 0;
  }

  /// Validate date format (YYYY-MM-DD)
  static bool isValidDate(String date) {
    if (date.isEmpty) return false;

    try {
      final parsedDate = DateTime.parse(date);
      return parsedDate.toString().startsWith(date);
    } catch (e) {
      return false;
    }
  }

  /// Validate that date is in the past
  static String? isPastDate(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) return null;

    try {
      final date = DateTime.parse(value);
      if (date.isAfter(DateTime.now())) {
        return '${fieldName ?? 'Date'} must be in the past';
      }
    } catch (e) {
      return '${fieldName ?? 'Date'} is not valid';
    }

    return null;
  }

  /// Validate that date is in the future
  static String? isFutureDate(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) return null;

    try {
      final date = DateTime.parse(value);
      if (date.isBefore(DateTime.now())) {
        return '${fieldName ?? 'Date'} must be in the future';
      }
    } catch (e) {
      return '${fieldName ?? 'Date'} is not valid';
    }

    return null;
  }

  /// Validate age (must be at least minAge years old)
  static String? isAgeValid(
    String? birthDate,
    int minAge, {
    String? fieldName,
  }) {
    if (birthDate == null || birthDate.isEmpty) return null;

    try {
      final date = DateTime.parse(birthDate);
      final today = DateTime.now();
      final age = today.year -
          date.year -
          (today.month > date.month ||
                  (today.month == date.month && today.day >= date.day)
              ? 0
              : 1);

      if (age < minAge) {
        return 'You must be at least $minAge years old';
      }
    } catch (e) {
      return '${fieldName ?? 'Birth date'} is not valid';
    }

    return null;
  }
}
