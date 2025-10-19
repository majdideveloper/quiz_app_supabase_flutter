import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

/// Parameters for updating preferences
class UpdatePreferencesParams {
  final String userId;
  final String? preferredLanguage;
  final bool? notificationsEnabled;
  final bool? emailNotificationsEnabled;

  const UpdatePreferencesParams({
    required this.userId,
    this.preferredLanguage,
    this.notificationsEnabled,
    this.emailNotificationsEnabled,
  });

  /// Check if any preference is being updated
  bool get hasUpdates =>
      preferredLanguage != null ||
      notificationsEnabled != null ||
      emailNotificationsEnabled != null;
}

/// Use case for updating user preferences
///
/// This use case handles the business logic for updating a user's preferences,
/// including validation and error handling.
@lazySingleton
class UpdatePreferencesUseCase {
  final ProfileRepository _repository;

  UpdatePreferencesUseCase(this._repository);

  /// Execute the use case
  ///
  /// Parameters:
  /// - [params]: The parameters for updating preferences
  ///
  /// Returns either a [Failure] or the updated [ProfileEntity]
  Future<Either<Failure, ProfileEntity>> call(
    UpdatePreferencesParams params,
  ) async {
    // Validate user ID
    if (params.userId.isEmpty) {
      AppLogger.error('UpdatePreferencesUseCase: Invalid user ID');
      return const Left(
        ValidationFailure(
          message: 'L\'identifiant utilisateur est invalide',
          code: 'INVALID_USER_ID',
        ),
      );
    }

    // Check if any updates provided
    if (!params.hasUpdates) {
      AppLogger.error('UpdatePreferencesUseCase: No updates provided');
      return const Left(
        ValidationFailure(
          message: 'Aucune modification fournie',
          code: 'NO_UPDATES',
        ),
      );
    }

    // Validate language if provided
    if (params.preferredLanguage != null) {
      final validLanguages = ['fr', 'en'];
      if (!validLanguages.contains(params.preferredLanguage)) {
        AppLogger.error('UpdatePreferencesUseCase: Invalid language');
        return const Left(
          ValidationFailure(
            message: 'Langue non supportée. Utilisez "fr" ou "en".',
            code: 'INVALID_LANGUAGE',
          ),
        );
      }
    }

    AppLogger.logUseCase('UpdatePreferencesUseCase', {
      'userId': params.userId,
      'hasLanguage': params.preferredLanguage != null,
      'hasNotifications': params.notificationsEnabled != null,
      'hasEmailNotifications': params.emailNotificationsEnabled != null,
    });

    final result = await _repository.updatePreferences(
      userId: params.userId,
      preferredLanguage: params.preferredLanguage,
      notificationsEnabled: params.notificationsEnabled,
      emailNotificationsEnabled: params.emailNotificationsEnabled,
    );

    return result.fold(
      (failure) {
        AppLogger.error(
          'UpdatePreferencesUseCase: Failed to update preferences',
          error: failure,
        );
        return Left(failure);
      },
      (profile) {
        AppLogger.info(
          'UpdatePreferencesUseCase: Preferences updated successfully',
          error: {
            'userId': profile.id,
            'language': profile.preferredLanguage,
            'notifications': profile.notificationsEnabled,
          },
        );
        return Right(profile);
      },
    );
  }
}
