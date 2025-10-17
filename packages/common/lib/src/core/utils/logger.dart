import 'package:logger/logger.dart';
import '../config/env_config.dart';

/// Application-wide logger instance
///
/// Provides structured logging with different levels (debug, info, warning, error).
/// Automatically adjusts log level based on environment (verbose in development).
class AppLogger {
  static Logger? _instance;

  /// Private constructor
  AppLogger._();

  /// Get the logger instance
  static Logger get instance {
    _instance ??= Logger(
      filter: _getLogFilter(),
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      output: ConsoleOutput(),
    );
    return _instance!;
  }

  /// Get log filter based on environment
  static LogFilter _getLogFilter() {
    if (EnvConfig.isProduction) {
      // Production: Only log warnings and errors
      return ProductionFilter();
    } else if (EnvConfig.isStaging) {
      // Staging: Log info and above
      return _CustomLogFilter(Level.info);
    } else {
      // Development: Log everything
      return DevelopmentFilter();
    }
  }

  /// Debug level logging - for detailed debugging information
  static void debug(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    instance.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Info level logging - for general informational messages
  static void info(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    instance.i(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Warning level logging - for potentially harmful situations
  static void warning(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    instance.w(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Error level logging - for error events
  static void error(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    instance.e(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Fatal level logging - for very severe error events
  static void fatal(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    instance.f(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a trace message - for very detailed debugging
  static void trace(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    instance.t(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log API request
  static void logRequest(
    String method,
    String endpoint, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
  }) {
    instance.d(
      '🌐 API Request: $method $endpoint',
      error: {
        if (params != null) 'params': params,
        if (body != null) 'body': body,
      },
    );
  }

  /// Log API response
  static void logResponse(
    String method,
    String endpoint,
    int statusCode, {
    dynamic body,
  }) {
    if (statusCode >= 200 && statusCode < 300) {
      instance.d(
        '✅ API Response: $method $endpoint [$statusCode]',
        error: body,
      );
    } else {
      instance.w(
        '⚠️ API Response: $method $endpoint [$statusCode]',
        error: body,
      );
    }
  }

  /// Log BLoC event
  static void logBlocEvent(String blocName, dynamic event) {
    instance.d('📤 [$blocName] Event: ${event.runtimeType}', error: event);
  }

  /// Log BLoC state change
  static void logBlocTransition(
    String blocName,
    dynamic currentState,
    dynamic nextState,
  ) {
    instance.d(
      '🔄 [$blocName] Transition: ${currentState.runtimeType} → ${nextState.runtimeType}',
    );
  }

  /// Log BLoC error
  static void logBlocError(
    String blocName,
    Object error,
    StackTrace stackTrace,
  ) {
    instance.e(
      '❌ [$blocName] Error',
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log use case execution
  static void logUseCase(String useCaseName, dynamic params) {
    instance.d('⚙️ UseCase: $useCaseName', error: params);
  }

  /// Log repository operation
  static void logRepository(String operation, {Map<String, dynamic>? params}) {
    instance.d('💾 Repository: $operation', error: params);
  }
}

/// Custom log filter for specific log levels
class _CustomLogFilter extends LogFilter {
  final Level _minLevel;

  _CustomLogFilter(this._minLevel);

  @override
  bool shouldLog(LogEvent event) {
    return event.level.index >= _minLevel.index;
  }
}
