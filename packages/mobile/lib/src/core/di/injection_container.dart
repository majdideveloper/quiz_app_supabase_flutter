import 'package:common/common.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.config.dart';

/// Initializes dependency injection for mobile app
///
/// Sets up GetIt service locator with:
/// - Common package dependencies (domain, data, core) from common package
/// - Mobile-specific dependencies (BLoCs, pages, etc.)
///
/// Note: The common package's getIt instance is used for all dependencies
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureMobileDependencies() async {
  // Initialize common package dependencies first
  // This registers all domain, data, and core dependencies
  await configureDependencies();

  // Initialize mobile-specific dependencies (BLoCs) using the same getIt instance
  getIt.init();
}
