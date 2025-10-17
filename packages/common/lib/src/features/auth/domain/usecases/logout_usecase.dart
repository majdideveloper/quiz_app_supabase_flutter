import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../repositories/auth_repository.dart';

/// Use case for user logout
///
/// This use case handles the business logic for logging out the current user.
/// It calls the repository to sign out and logs the operation.
///
/// Usage:
/// ```dart
/// final logoutUseCase = getIt<LogoutUseCase>();
/// final result = await logoutUseCase();
///
/// result.fold(
///   (failure) => print('Logout failed: ${failure.message}'),
///   (_) => print('Logged out successfully'),
/// );
/// ```
@lazySingleton
class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  /// Execute the logout use case
  ///
  /// Returns [Unit] on success, or [Failure] on error.
  ///
  /// Possible failures:
  /// - [AuthenticationFailure]: No user logged in
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  Future<Either<Failure, Unit>> call() async {
    AppLogger.logUseCase('LogoutUseCase', 'Attempting logout');

    try {
      final result = await _repository.logout();

      return result.fold(
        (failure) {
          AppLogger.error(
            'LogoutUseCase: Logout failed',
            error: failure.message,
          );
          return Left(failure);
        },
        (unit) {
          AppLogger.info('LogoutUseCase: Logout successful');
          return Right(unit);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'LogoutUseCase: Unexpected error',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite lors de la déconnexion',
        ),
      );
    }
  }
}
