import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';

/// Implementation of [ProfileRepository]
///
/// This class implements the profile repository interface by delegating
/// to the remote data source and converting exceptions to failures.
@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, ProfileEntity>> getProfile(String userId) async {
    try {
      AppLogger.logRepository('getProfile', params: {
        'userId': userId,
      });

      final profileModel = await _remoteDataSource.getProfile(userId);
      return Right(profileModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('ProfileRepository: Unexpected error in getProfile', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getCurrentUserProfile() async {
    try {
      AppLogger.logRepository('getCurrentUserProfile');

      final profileModel = await _remoteDataSource.getCurrentUserProfile();
      return Right(profileModel.toEntity());
    } on AuthenticationException catch (e) {
      return Left(
        AuthenticationFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('ProfileRepository: Unexpected error in getCurrentUserProfile', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile({
    required String userId,
    String? fullName,
    String? phone,
    String? bio,
    DateTime? dateOfBirth,
    String? address,
    String? city,
    String? province,
    String? postalCode,
    String? country,
  }) async {
    try {
      AppLogger.logRepository('updateProfile', params: {
        'userId': userId,
      });

      final profileModel = await _remoteDataSource.updateProfile(
        userId: userId,
        fullName: fullName,
        phone: phone,
        bio: bio,
        dateOfBirth: dateOfBirth,
        address: address,
        city: city,
        province: province,
        postalCode: postalCode,
        country: country,
      );
      return Right(profileModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ValidationException catch (e) {
      return Left(
        ValidationFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('ProfileRepository: Unexpected error in updateProfile', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> uploadAvatar({
    required String userId,
    required String filePath,
  }) async {
    try {
      AppLogger.logRepository('uploadAvatar', params: {
        'userId': userId,
      });

      final profileModel = await _remoteDataSource.uploadAvatar(
        userId: userId,
        filePath: filePath,
      );
      return Right(profileModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ValidationException catch (e) {
      return Left(
        ValidationFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on FileStorageException catch (e) {
      return Left(
        FileStorageFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('ProfileRepository: Unexpected error in uploadAvatar', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> deleteAvatar(String userId) async {
    try {
      AppLogger.logRepository('deleteAvatar', params: {
        'userId': userId,
      });

      final profileModel = await _remoteDataSource.deleteAvatar(userId);
      return Right(profileModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on FileStorageException catch (e) {
      return Left(
        FileStorageFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('ProfileRepository: Unexpected error in deleteAvatar', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updatePreferences({
    required String userId,
    String? preferredLanguage,
    bool? notificationsEnabled,
    bool? emailNotificationsEnabled,
  }) async {
    try {
      AppLogger.logRepository('updatePreferences', params: {
        'userId': userId,
      });

      final profileModel = await _remoteDataSource.updatePreferences(
        userId: userId,
        preferredLanguage: preferredLanguage,
        notificationsEnabled: notificationsEnabled,
        emailNotificationsEnabled: emailNotificationsEnabled,
      );
      return Right(profileModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('ProfileRepository: Unexpected error in updatePreferences', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateLastLogin(String userId) async {
    try {
      AppLogger.logRepository('updateLastLogin', params: {
        'userId': userId,
      });

      final profileModel = await _remoteDataSource.updateLastLogin(userId);
      return Right(profileModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('ProfileRepository: Unexpected error in updateLastLogin', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateLearningStats({
    required String userId,
    int? totalEnrollments,
    int? completedCourses,
    int? certificatesEarned,
    int? totalPoints,
  }) async {
    try {
      AppLogger.logRepository('updateLearningStats', params: {
        'userId': userId,
      });

      final profileModel = await _remoteDataSource.updateLearningStats(
        userId: userId,
        totalEnrollments: totalEnrollments,
        completedCourses: completedCourses,
        certificatesEarned: certificatesEarned,
        totalPoints: totalPoints,
      );
      return Right(profileModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('ProfileRepository: Unexpected error in updateLearningStats', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> deactivateProfile(
    String userId,
  ) async {
    try {
      AppLogger.logRepository('deactivateProfile', params: {
        'userId': userId,
      });

      final profileModel = await _remoteDataSource.deactivateProfile(userId);
      return Right(profileModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('ProfileRepository: Unexpected error in deactivateProfile', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> reactivateProfile(
    String userId,
  ) async {
    try {
      AppLogger.logRepository('reactivateProfile', params: {
        'userId': userId,
      });

      final profileModel = await _remoteDataSource.reactivateProfile(userId);
      return Right(profileModel.toEntity());
    } on NotFoundException catch (e) {
      return Left(
        NotFoundFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('ProfileRepository: Unexpected error in reactivateProfile', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProfileEntity>>> searchProfiles(
    String query,
  ) async {
    try {
      AppLogger.logRepository('searchProfiles', params: {
        'query': query,
      });

      final profileModels = await _remoteDataSource.searchProfiles(query);
      final profiles = profileModels.map((model) => model.toEntity()).toList();

      return Right(profiles);
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('ProfileRepository: Unexpected error in searchProfiles', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProfileEntity>>> getProfilesByRole(
    UserRole role,
  ) async {
    try {
      AppLogger.logRepository('getProfilesByRole', params: {
        'role': role.toString(),
      });

      final profileModels = await _remoteDataSource.getProfilesByRole(role);
      final profiles = profileModels.map((model) => model.toEntity()).toList();

      return Right(profiles);
    } on DatabaseException catch (e) {
      return Left(
        DatabaseFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          code: e.code,
        ),
      );
    } catch (e) {
      AppLogger.error('ProfileRepository: Unexpected error in getProfilesByRole', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
        ),
      );
    }
  }
}
