import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

/// Use case for getting a user profile
///
/// This use case retrieves a user's profile by their ID,
/// including validation and error handling.
@lazySingleton
class GetProfileUseCase {
  final ProfileRepository _repository;

  GetProfileUseCase(this._repository);

  /// Execute the use case
  ///
  /// Parameters:
  /// - [userId]: The ID of the user (optional, uses current user if null)
  ///
  /// Returns either a [Failure] or the [ProfileEntity]
  Future<Either<Failure, ProfileEntity>> call([String? userId]) async {
    if (userId == null) {
      // Get current user's profile
      AppLogger.logUseCase('GetProfileUseCase', {
        'type': 'current_user',
      });

      final result = await _repository.getCurrentUserProfile();

      return result.fold(
        (failure) {
          AppLogger.error(
            'GetProfileUseCase: Failed to get current user profile',
            error: failure,
          );
          return Left(failure);
        },
        (profile) {
          AppLogger.info(
            'GetProfileUseCase: Retrieved current user profile successfully',
            error: {
              'userId': profile.id,
              'email': profile.email,
            },
          );
          return Right(profile);
        },
      );
    }

    // Validate user ID
    if (userId.isEmpty) {
      AppLogger.error('GetProfileUseCase: Invalid user ID');
      return const Left(
        ValidationFailure(
          message: 'L\'identifiant utilisateur est invalide',
          code: 'INVALID_USER_ID',
        ),
      );
    }

    AppLogger.logUseCase('GetProfileUseCase', {
      'userId': userId,
    });

    final result = await _repository.getProfile(userId);

    return result.fold(
      (failure) {
        AppLogger.error(
          'GetProfileUseCase: Failed to get profile',
          error: failure,
        );
        return Left(failure);
      },
      (profile) {
        AppLogger.info(
          'GetProfileUseCase: Retrieved profile successfully',
          error: {
            'userId': profile.id,
            'email': profile.email,
          },
        );
        return Right(profile);
      },
    );
  }
}
