import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:common/common.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Use path URL strategy (removes # from URLs)
  setPathUrlStrategy();

  // Load environment variables (relative to assets directory)
  await dotenv.load(fileName: '.env.develop');

  // Initialize Supabase
  await SupabaseClientWrapper.initialize();

  // Initialize common package DI (BLoCs, use cases, repositories)
  await configureDependencies();

  runApp(const App());
}
