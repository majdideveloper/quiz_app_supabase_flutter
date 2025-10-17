import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Use case for user login
///
/// This use case handles the business logic for authenticating a user
/// with email and password. It validates input, calls the repository,
/// and logs the operation.
///
/// Usage:
/// ```dart
/// final loginUseCase = getIt<LoginUseCase>();
/// final result = await loginUseCase(
///   LoginParams(
///     email: 'user@example.com',
///     password: 'password123',
///   ),
/// );
///
/// result.fold(
///   (failure) => print('Login failed: ${failure.message}'),
///   (user) => print('Logged in as: ${user.email}'),
/// );
/// ```
@lazySingleton
class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  /// Execute the login use case
  ///
  /// Returns [UserEntity] on success, or [Failure] on error.
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Invalid email or password format
  /// - [AuthenticationFailure]: Invalid credentials
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    AppLogger.logUseCase('LoginUseCase', 'Attempting login for: ${params.email}');

    try {
      // Validate email format
      if (!_isValidEmail(params.email)) {
        AppLogger.warning('LoginUseCase: Invalid email format');
        return const Left(
          ValidationFailure(
            message: 'Format de courriel invalide',
            code: 'INVALID_EMAIL',
          ),
        );
      }

      // Validate password is not empty
      if (params.password.isEmpty) {
        AppLogger.warning('LoginUseCase: Empty password');
        return const Left(
          ValidationFailure(
            message: 'Le mot de passe ne peut pas être vide',
            code: 'EMPTY_PASSWORD',
          ),
        );
      }

      // Call repository
      final result = await _repository.login(
        email: params.email,
        password: params.password,
      );

      return result.fold(
        (failure) {
          AppLogger.error(
            'LoginUseCase: Login failed',
            error: failure.message,
          );
          return Left(failure);
        },
        (user) {
          AppLogger.info(
            'LoginUseCase: Login successful for ${user.email} (${user.role.name})',
          );
          return Right(user);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'LoginUseCase: Unexpected error',
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

  /// Validate email format using simple regex
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }
}

/// Parameters for login use case
class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
