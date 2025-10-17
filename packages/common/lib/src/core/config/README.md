# Configuration Module

## Overview
Manages environment-specific configuration for the application across different deployment environments (develop, staging, production).

## Files

### env_config.dart
Central configuration class that provides environment-specific settings.

**Features:**
- Environment detection (develop, staging, production)
- Supabase URL and keys management
- API endpoint configuration
- Configuration validation

**Usage:**
```dart
import 'package:common/common.dart';

void main() {
  // Validate environment configuration
  EnvConfig.validate();

  // Check current environment
  if (EnvConfig.isDevelopment) {
    print('Running in development mode');
  }

  // Access configuration
  final supabaseUrl = EnvConfig.supabaseUrl;
  final apiKey = EnvConfig.supabaseAnonKey;
}
```

## Environment Files

The project uses three environment files located at the root:

- `.env.develop` - Local development with Supabase CLI
- `.env.staging` - Staging environment on Supabase Cloud
- `.env.production` - Production environment on Supabase Cloud

## Running with Environment Configuration

### Development (Local)
```bash
flutter run --dart-define-from-file=.env.develop
```

### Staging
```bash
flutter run --dart-define-from-file=.env.staging
```

### Production
```bash
flutter build apk --dart-define-from-file=.env.production
flutter build web --dart-define-from-file=.env.production
```

## Environment Variables

Required variables in all `.env` files:

- `ENVIRONMENT` - Environment name (develop/staging/production)
- `SUPABASE_URL` - Supabase project URL
- `SUPABASE_ANON_KEY` - Supabase anonymous/public key
- `API_URL` - API base URL (if using custom API)

## Security Notes

⚠️ **Important:**
- Never commit `.env` files with real credentials to version control
- Use `.env.example` files as templates
- Store production secrets in CI/CD environment variables
- Rotate keys regularly
- Use different keys for each environment
