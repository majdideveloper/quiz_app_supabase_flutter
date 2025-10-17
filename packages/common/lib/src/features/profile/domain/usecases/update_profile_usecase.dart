import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

/// Parameters for updating profile
class UpdateProfileParams {
  final String userId;
  final String? fullName;
  final String? phone;
  final String? bio;
  final DateTime? dateOfBirth;
  final String? address;
  final String? city;
  final String? province;
  final String? postalCode;
  final String? country;

  const UpdateProfileParams({
    required this.userId,
    this.fullName,
    this.phone,
    this.bio,
    this.dateOfBirth,
    this.address,
    this.city,
    this.province,
    this.postalCode,
    this.country,
  });

  /// Check if any field is being updated
  bool get hasUpdates =>
      fullName != null ||
      phone != null ||
      bio != null ||
      dateOfBirth != null ||
      address != null ||
      city != null ||
      province != null ||
      postalCode != null ||
      country != null;
}

/// Use case for updating user profile
///
/// This use case handles the business logic for updating a user's profile,
/// including validation and error handling.
@lazySingleton
class UpdateProfileUseCase {
  final ProfileRepository _repository;

  UpdateProfileUseCase(this._repository);

  /// Execute the use case
  ///
  /// Parameters:
  /// - [params]: The parameters for updating the profile
  ///
  /// Returns either a [Failure] or the updated [ProfileEntity]
  Future<Either<Failure, ProfileEntity>> call(
    UpdateProfileParams params,
  ) async {
    // Validate user ID
    if (params.userId.isEmpty) {
      AppLogger.error('UpdateProfileUseCase: Invalid user ID');
      return const Left(
        ValidationFailure(
          message: 'L\'identifiant utilisateur est invalide',
          code: 'INVALID_USER_ID',
        ),
      );
    }

    // Check if any updates provided
    if (!params.hasUpdates) {
      AppLogger.error('UpdateProfileUseCase: No updates provided');
      return const Left(
        ValidationFailure(
          message: 'Aucune modification fournie',
          code: 'NO_UPDATES',
        ),
      );
    }

    // Validate full name if provided
    if (params.fullName != null && params.fullName!.trim().isEmpty) {
      AppLogger.error('UpdateProfileUseCase: Invalid full name');
      return const Left(
        ValidationFailure(
          message: 'Le nom complet ne peut pas être vide',
          code: 'INVALID_FULL_NAME',
        ),
      );
    }

    // Validate phone if provided
    if (params.phone != null && params.phone!.isNotEmpty) {
      final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]+$');
      if (!phoneRegex.hasMatch(params.phone!)) {
        AppLogger.error('UpdateProfileUseCase: Invalid phone number');
        return const Left(
          ValidationFailure(
            message: 'Le numéro de téléphone est invalide',
            code: 'INVALID_PHONE',
          ),
        );
      }
    }

    // Validate date of birth if provided (must not be in future, must be at least 13 years old)
    if (params.dateOfBirth != null) {
      final now = DateTime.now();
      if (params.dateOfBirth!.isAfter(now)) {
        AppLogger.error('UpdateProfileUseCase: Date of birth in future');
        return const Left(
          ValidationFailure(
            message: 'La date de naissance ne peut pas être dans le futur',
            code: 'INVALID_DATE_OF_BIRTH',
          ),
        );
      }

      final age = now.year - params.dateOfBirth!.year;
      if (age < 13) {
        AppLogger.error('UpdateProfileUseCase: User too young');
        return const Left(
          ValidationFailure(
            message: 'Vous devez avoir au moins 13 ans',
            code: 'AGE_REQUIREMENT',
          ),
        );
      }
    }

    // Validate postal code if provided (Canadian format)
    if (params.postalCode != null && params.postalCode!.isNotEmpty) {
      final postalCodeRegex = RegExp(
        r'^[A-Za-z]\d[A-Za-z][\s\-]?\d[A-Za-z]\d$',
      );
      if (!postalCodeRegex.hasMatch(params.postalCode!.replaceAll(' ', ''))) {
        AppLogger.error('UpdateProfileUseCase: Invalid postal code');
        return const Left(
          ValidationFailure(
            message: 'Le code postal est invalide (format: A1A 1A1)',
            code: 'INVALID_POSTAL_CODE',
          ),
        );
      }
    }

    AppLogger.logUseCase('UpdateProfileUseCase', {
      'userId': params.userId,
      'hasFullName': params.fullName != null,
      'hasPhone': params.phone != null,
      'hasBio': params.bio != null,
      'hasDateOfBirth': params.dateOfBirth != null,
      'hasAddress': params.address != null,
    });

    final result = await _repository.updateProfile(
      userId: params.userId,
      fullName: params.fullName,
      phone: params.phone,
      bio: params.bio,
      dateOfBirth: params.dateOfBirth,
      address: params.address,
      city: params.city,
      province: params.province,
      postalCode: params.postalCode,
      country: params.country,
    );

    return result.fold(
      (failure) {
        AppLogger.error(
          'UpdateProfileUseCase: Failed to update profile',
          error: failure,
        );
        return Left(failure);
      },
      (profile) {
        AppLogger.info(
          'UpdateProfileUseCase: Profile updated successfully',
          error: {
            'userId': profile.id,
            'completionPercentage': profile.profileCompletionPercentage,
          },
        );
        return Right(profile);
      },
    );
  }
}
