import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/env_config.dart';

/// Wrapper class for Supabase client initialization and access
///
/// Provides a singleton instance of SupabaseClient configured with
/// environment-specific settings.
class SupabaseClientWrapper {
  static SupabaseClient? _instance;

  /// Private constructor to prevent instantiation
  SupabaseClientWrapper._();

  /// Initialize Supabase with environment configuration
  ///
  /// Should be called once during app initialization (in main.dart)
  /// before any other operations that require Supabase.
  ///
  /// Example:
  /// ```dart
  /// await SupabaseClientWrapper.initialize();
  /// ```
  static Future<void> initialize() async {
    // Validate environment configuration
    EnvConfig.validate();

    await Supabase.initialize(
      url: EnvConfig.supabaseUrl,
      anonKey: EnvConfig.supabaseAnonKey,
      debug: EnvConfig.isDevelopment,
    );

    _instance = Supabase.instance.client;
  }

  /// Get the Supabase client instance
  ///
  /// Throws [StateError] if called before [initialize]
  static SupabaseClient get instance {
    if (_instance == null) {
      throw StateError(
        'SupabaseClient not initialized. Call SupabaseClientWrapper.initialize() first.',
      );
    }
    return _instance!;
  }

  /// Check if Supabase client is initialized
  static bool get isInitialized => _instance != null;

  /// Get the current user session
  static Session? get currentSession => instance.auth.currentSession;

  /// Get the current user
  static User? get currentUser => instance.auth.currentUser;

  /// Check if user is authenticated
  static bool get isAuthenticated => currentUser != null;

  /// Stream of auth state changes
  static Stream<AuthState> get authStateChanges =>
      instance.auth.onAuthStateChange;

  /// Sign out the current user
  static Future<void> signOut() async {
    await instance.auth.signOut();
  }

  /// Dispose resources (for testing purposes)
  static void dispose() {
    _instance = null;
  }
}
