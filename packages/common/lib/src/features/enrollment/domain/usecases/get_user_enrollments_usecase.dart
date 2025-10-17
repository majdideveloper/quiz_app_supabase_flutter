import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../entities/enrollment_entity.dart';
import '../repositories/enrollment_repository.dart';

/// Use case for getting all user enrollments
///
/// This use case retrieves all enrollments for a specific user,
/// including validation and error handling.
@lazySingleton
class GetUserEnrollmentsUseCase {
  final EnrollmentRepository _repository;

  GetUserEnrollmentsUseCase(this._repository);

  /// Execute the use case
  ///
  /// Parameters:
  /// - [userId]: The ID of the user
  ///
  /// Returns either a [Failure] or a list of [EnrollmentEntity]
  Future<Either<Failure, List<EnrollmentEntity>>> call(String userId) async {
    // Validate user ID
    if (userId.isEmpty) {
      AppLogger.error('GetUserEnrollmentsUseCase: Invalid user ID');
      return const Left(
        ValidationFailure(
          message: 'L\'identifiant utilisateur est invalide',
          code: 'INVALID_USER_ID',
        ),
      );
    }

    AppLogger.logUseCase('GetUserEnrollmentsUseCase', {
      'userId': userId,
    });

    final result = await _repository.getUserEnrollments(userId);

    return result.fold(
      (failure) {
        AppLogger.error(
          'GetUserEnrollmentsUseCase: Failed to get enrollments',
          error: failure,
        );
        return Left(failure);
      },
      (enrollments) {
        AppLogger.info(
          'GetUserEnrollmentsUseCase: Retrieved enrollments successfully',
          error: {
            'userId': userId,
            'count': enrollments.length,
          },
        );
        return Right(enrollments);
      },
    );
  }
}
