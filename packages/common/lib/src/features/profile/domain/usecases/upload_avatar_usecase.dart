import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

/// Parameters for uploading avatar
class UploadAvatarParams {
  final String userId;
  final String filePath;

  const UploadAvatarParams({
    required this.userId,
    required this.filePath,
  });
}

/// Use case for uploading user avatar
///
/// This use case handles the business logic for uploading a user's avatar image,
/// including validation and error handling.
@lazySingleton
class UploadAvatarUseCase {
  final ProfileRepository _repository;

  UploadAvatarUseCase(this._repository);

  /// Execute the use case
  ///
  /// Parameters:
  /// - [params]: The parameters for uploading the avatar
  ///
  /// Returns either a [Failure] or the updated [ProfileEntity]
  Future<Either<Failure, ProfileEntity>> call(
    UploadAvatarParams params,
  ) async {
    // Validate user ID
    if (params.userId.isEmpty) {
      AppLogger.error('UploadAvatarUseCase: Invalid user ID');
      return const Left(
        ValidationFailure(
          message: 'L\'identifiant utilisateur est invalide',
          code: 'INVALID_USER_ID',
        ),
      );
    }

    // Validate file path
    if (params.filePath.isEmpty) {
      AppLogger.error('UploadAvatarUseCase: Invalid file path');
      return const Left(
        ValidationFailure(
          message: 'Le chemin du fichier est invalide',
          code: 'INVALID_FILE_PATH',
        ),
      );
    }

    // Validate file extension
    final validExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp'];
    final fileExtension = params.filePath.toLowerCase().substring(
      params.filePath.lastIndexOf('.'),
    );

    if (!validExtensions.contains(fileExtension)) {
      AppLogger.error('UploadAvatarUseCase: Invalid file type');
      return const Left(
        ValidationFailure(
          message: 'Format de fichier non supporté. Utilisez JPG, PNG, GIF ou WebP.',
          code: 'INVALID_FILE_TYPE',
        ),
      );
    }

    AppLogger.logUseCase('UploadAvatarUseCase', {
      'userId': params.userId,
      'filePath': params.filePath,
      'fileExtension': fileExtension,
    });

    final result = await _repository.uploadAvatar(
      userId: params.userId,
      filePath: params.filePath,
    );

    return result.fold(
      (failure) {
        AppLogger.error(
          'UploadAvatarUseCase: Failed to upload avatar',
          error: failure,
        );
        return Left(failure);
      },
      (profile) {
        AppLogger.info(
          'UploadAvatarUseCase: Avatar uploaded successfully',
          error: {
            'userId': profile.id,
            'avatarUrl': profile.avatarUrl,
          },
        );
        return Right(profile);
      },
    );
  }
}
