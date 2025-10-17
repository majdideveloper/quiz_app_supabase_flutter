import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../network/supabase_client.dart';
import 'injection_container.config.dart';

/// Service locator instance
final getIt = GetIt.instance;

/// Initialize dependency injection
///
/// This should be called once during app startup after Supabase initialization.
/// Injectable will automatically register all annotated dependencies.
///
/// Example:
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///
///   // Initialize Supabase first
///   await SupabaseClientWrapper.initialize();
///
///   // Then configure dependencies
///   await configureDependencies();
///
///   runApp(const MyApp());
/// }
/// ```
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  // Initialize Injectable generated dependencies
  getIt.init();
}

/// Module for registering external dependencies
///
/// External dependencies are third-party objects that cannot be
/// annotated with @injectable (like SupabaseClient)
@module
abstract class RegisterModule {
  /// Register Supabase client
  @lazySingleton
  SupabaseClient get supabaseClient => SupabaseClientWrapper.instance;
}
