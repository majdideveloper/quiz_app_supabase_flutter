import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

/// Environment configuration for the application
///
/// Manages environment-specific settings for develop, staging, and production
/// environments. Configuration values are loaded from .env files using
/// --dart-define-from-file flag during build/run.
class EnvConfig {
  /// Current environment name (develop, staging, production)
  static const environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'develop',
  );

  /// Supabase project URL (raw from environment)
  static const _supabaseUrlRaw = String.fromEnvironment('SUPABASE_URL');

  /// Supabase anonymous key
  static const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  /// API base URL (raw from environment)
  static const _apiUrlRaw = String.fromEnvironment('API_URL');

  /// Get platform-specific Supabase URL
  ///
  /// For local development:
  /// - Android emulator uses 10.0.2.2 (special alias for host machine)
  /// - iOS simulator and web use 127.0.0.1 or localhost
  static String get supabaseUrl {
    if (isDevelopment && _supabaseUrlRaw.contains('10.0.2.2')) {
      // Replace Android emulator IP with localhost for iOS/web
      if (kIsWeb || (!kIsWeb && Platform.isIOS)) {
        return _supabaseUrlRaw.replaceAll('10.0.2.2', '127.0.0.1');
      }
    }
    return _supabaseUrlRaw;
  }

  /// Get platform-specific API URL
  static String get apiUrl {
    if (isDevelopment && _apiUrlRaw.contains('10.0.2.2')) {
      if (kIsWeb || (!kIsWeb && Platform.isIOS)) {
        return _apiUrlRaw.replaceAll('10.0.2.2', '127.0.0.1');
      }
    }
    return _apiUrlRaw;
  }

  /// Check if running in development environment
  static bool get isDevelopment => environment == 'develop';

  /// Check if running in staging environment
  static bool get isStaging => environment == 'staging';

  /// Check if running in production environment
  static bool get isProduction => environment == 'production';

  /// Validate that all required environment variables are set
  static void validate() {
    if (supabaseUrl.isEmpty) {
      throw Exception('SUPABASE_URL is not set in environment configuration');
    }
    if (supabaseAnonKey.isEmpty) {
      throw Exception('SUPABASE_ANON_KEY is not set in environment configuration');
    }
  }

  /// Get a human-readable description of the current environment
  static String get environmentDescription {
    switch (environment) {
      case 'develop':
        return 'Development (Local)';
      case 'staging':
        return 'Staging';
      case 'production':
        return 'Production';
      default:
        return 'Unknown Environment';
    }
  }
}
