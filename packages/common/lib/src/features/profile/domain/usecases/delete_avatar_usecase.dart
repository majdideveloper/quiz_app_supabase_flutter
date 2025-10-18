import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

/// Use case for deleting user avatar
///
/// This use case handles the business logic for removing a user's avatar image,
/// including validation and error handling.
@lazySingleton
class DeleteAvatarUseCase {
  final ProfileRepository _repository;

  DeleteAvatarUseCase(this._repository);

  /// Execute the use case
  ///
  /// Parameters:
  /// - [userId]: The ID of the user
  ///
  /// Returns either a [Failure] or the updated [ProfileEntity]
  Future<Either<Failure, ProfileEntity>> call(String userId) async {
    // Validate user ID
    if (userId.isEmpty) {
      AppLogger.error('DeleteAvatarUseCase: Invalid user ID');
      return const Left(
        ValidationFailure(
          message: 'L\'identifiant utilisateur est invalide',
          code: 'INVALID_USER_ID',
        ),
      );
    }

    AppLogger.logUseCase('DeleteAvatarUseCase', {
      'userId': userId,
    });

    final result = await _repository.deleteAvatar(userId);

    return result.fold(
      (failure) {
        AppLogger.error(
          'DeleteAvatarUseCase: Failed to delete avatar',
          error: failure,
        );
        return Left(failure);
      },
      (profile) {
        AppLogger.info(
          'DeleteAvatarUseCase: Avatar deleted successfully',
          error: {
            'userId': profile.id,
          },
        );
        return Right(profile);
      },
    );
  }
}
