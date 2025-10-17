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

  /// Supabase project URL
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');

  /// Supabase anonymous key
  static const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  /// API base URL
  static const apiUrl = String.fromEnvironment('API_URL');

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
