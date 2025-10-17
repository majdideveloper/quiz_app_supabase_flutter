import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

/// Implementation of [AuthRepository]
///
/// This class implements the authentication repository interface by delegating
/// to the remote data source and converting exceptions to failures.
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      AppLogger.logRepository(
        'login',
        params: {'email': email},
      );

      final userModel = await _remoteDataSource.login(
        email: email,
        password: password,
      );

      return Right(userModel.toEntity());
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(message: e.message, code: e.code));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message, code: e.code));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      AppLogger.error('AuthRepository: Unexpected error in login', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
          code: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
    String? fullName,
  }) async {
    try {
      AppLogger.logRepository(
        'register',
        params: {'email': email, 'fullName': fullName},
      );

      final userModel = await _remoteDataSource.register(
        email: email,
        password: password,
        fullName: fullName,
      );

      return Right(userModel.toEntity());
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(message: e.message, code: e.code));
    } on ValidationException catch (e) {
      return Left(
        ValidationFailure(
          message: e.message,
          code: e.code,
          fieldErrors: e.fieldErrors,
        ),
      );
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message, code: e.code));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      AppLogger.error('AuthRepository: Unexpected error in register', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
          code: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      AppLogger.logRepository('logout');

      await _remoteDataSource.logout();

      return const Right(unit);
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(message: e.message, code: e.code));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message, code: e.code));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      AppLogger.error('AuthRepository: Unexpected error in logout', error: e);
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
          code: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      AppLogger.logRepository('getCurrentUser');

      final userModel = await _remoteDataSource.getCurrentUser();

      return Right(userModel.toEntity());
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(message: e.message, code: e.code));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message, code: e.code));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      AppLogger.error(
        'AuthRepository: Unexpected error in getCurrentUser',
        error: e,
      );
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
          code: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    String? fullName,
    String? avatarUrl,
  }) async {
    try {
      AppLogger.logRepository(
        'updateProfile',
        params: {'fullName': fullName, 'avatarUrl': avatarUrl},
      );

      final userModel = await _remoteDataSource.updateProfile(
        fullName: fullName,
        avatarUrl: avatarUrl,
      );

      return Right(userModel.toEntity());
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(message: e.message, code: e.code));
    } on ValidationException catch (e) {
      return Left(ValidationFailure(message: e.message, code: e.code));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message, code: e.code));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      AppLogger.error(
        'AuthRepository: Unexpected error in updateProfile',
        error: e,
      );
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
          code: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required String email}) async {
    try {
      AppLogger.logRepository(
        'resetPassword',
        params: {'email': email},
      );

      await _remoteDataSource.resetPassword(email: email);

      return const Right(unit);
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(message: e.message, code: e.code));
    } on ValidationException catch (e) {
      return Left(ValidationFailure(message: e.message, code: e.code));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message, code: e.code));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      AppLogger.error(
        'AuthRepository: Unexpected error in resetPassword',
        error: e,
      );
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite',
          code: e.toString(),
        ),
      );
    }
  }

  @override
  Stream<UserEntity?> get authStateChanges {
    return _remoteDataSource.authStateChanges.map(
      (userModel) => userModel?.toEntity(),
    );
  }
}
