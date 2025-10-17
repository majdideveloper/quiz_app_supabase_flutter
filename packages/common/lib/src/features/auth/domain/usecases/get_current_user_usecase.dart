import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Use case for getting the current authenticated user
///
/// This use case handles the business logic for retrieving the current user's
/// information. It's useful for checking authentication state and getting user data.
///
/// Usage:
/// ```dart
/// final getCurrentUserUseCase = getIt<GetCurrentUserUseCase>();
/// final result = await getCurrentUserUseCase();
///
/// result.fold(
///   (failure) => print('Not logged in'),
///   (user) => print('Current user: ${user.email}'),
/// );
/// ```
@lazySingleton
class GetCurrentUserUseCase {
  final AuthRepository _repository;

  GetCurrentUserUseCase(this._repository);

  /// Execute the get current user use case
  ///
  /// Returns [UserEntity] on success, or [Failure] if no user is logged in.
  ///
  /// Possible failures:
  /// - [AuthenticationFailure]: No user logged in, session expired
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  Future<Either<Failure, UserEntity>> call() async {
    AppLogger.logUseCase('GetCurrentUserUseCase', 'Fetching current user');

    try {
      final result = await _repository.getCurrentUser();

      return result.fold(
        (failure) {
          AppLogger.warning(
            'GetCurrentUserUseCase: No current user',
            error: failure.message,
          );
          return Left(failure);
        },
        (user) {
          AppLogger.info(
            'GetCurrentUserUseCase: Retrieved user ${user.email} (${user.role.name})',
          );
          return Right(user);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'GetCurrentUserUseCase: Unexpected error',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }
}
