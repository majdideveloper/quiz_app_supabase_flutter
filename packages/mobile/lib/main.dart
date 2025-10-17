import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:common/common.dart';

import 'src/app.dart';
import 'src/core/di/injection_container.dart';

/// Entry point for Formation Métiers mobile app
///
/// Initializes:
/// - Flutter framework
/// - Supabase backend
/// - Dependency injection (common + mobile)
/// - System UI overlays
void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Configure system UI
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  // Initialize Supabase
  await SupabaseClientWrapper.initialize();

  // Initialize dependency injection
  await configureMobileDependencies();

  // Run app
  runApp(const App());
}
