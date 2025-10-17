import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../../../../core/utils/validators.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Use case for user registration
///
/// This use case handles the business logic for creating a new user account.
/// It validates input (email format, password strength), calls the repository,
/// and logs the operation.
///
/// Usage:
/// ```dart
/// final registerUseCase = getIt<RegisterUseCase>();
/// final result = await registerUseCase(
///   RegisterParams(
///     email: 'newuser@example.com',
///     password: 'SecurePass123!',
///     fullName: 'Jean Tremblay',
///   ),
/// );
///
/// result.fold(
///   (failure) => print('Registration failed: ${failure.message}'),
///   (user) => print('Account created for: ${user.email}'),
/// );
/// ```
@lazySingleton
class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  /// Execute the registration use case
  ///
  /// Returns [UserEntity] on success, or [Failure] on error.
  ///
  /// Possible failures:
  /// - [ValidationFailure]: Invalid email, weak password, etc.
  /// - [AuthenticationFailure]: Email already in use
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  Future<Either<Failure, UserEntity>> call(RegisterParams params) async {
    AppLogger.logUseCase(
      'RegisterUseCase',
      'Attempting registration for: ${params.email}',
    );

    try {
      // Validate email
      if (!Validators.isValidEmail(params.email)) {
        AppLogger.warning('RegisterUseCase: Invalid email format');
        return const Left(
          ValidationFailure(
            message: 'Format de courriel invalide',
            code: 'INVALID_EMAIL',
          ),
        );
      }

      // Validate password strength
      final passwordError = Validators.validatePassword(
        params.password,
        minLength: 8,
        requireUppercase: true,
        requireLowercase: true,
        requireNumber: true,
      );

      if (passwordError != null) {
        AppLogger.warning('RegisterUseCase: Weak password - $passwordError');
        return Left(
          ValidationFailure(
            message: passwordError,
            code: 'WEAK_PASSWORD',
          ),
        );
      }

      // Validate full name if provided
      if (params.fullName != null && params.fullName!.trim().isEmpty) {
        AppLogger.warning('RegisterUseCase: Empty full name');
        return const Left(
          ValidationFailure(
            message: 'Le nom complet ne peut pas être vide',
            code: 'EMPTY_FULL_NAME',
          ),
        );
      }

      // Call repository
      final result = await _repository.register(
        email: params.email,
        password: params.password,
        fullName: params.fullName,
      );

      return result.fold(
        (failure) {
          AppLogger.error(
            'RegisterUseCase: Registration failed',
            error: failure.message,
          );
          return Left(failure);
        },
        (user) {
          AppLogger.info(
            'RegisterUseCase: Registration successful for ${user.email}',
          );
          return Right(user);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'RegisterUseCase: Unexpected error',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(
        UnexpectedFailure(
          message: 'Une erreur inattendue s\'est produite lors de l\'inscription',
        ),
      );
    }
  }
}

/// Parameters for registration use case
class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String? fullName;

  const RegisterParams({
    required this.email,
    required this.password,
    this.fullName,
  });

  @override
  List<Object?> get props => [email, password, fullName];
}
