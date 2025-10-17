import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../entities/profile_entity.dart';

/// Repository interface for profile operations
///
/// This interface defines the contract for profile data operations.
/// Implementations should handle profile retrieval, updates, and
/// user preferences management.
abstract class ProfileRepository {
  /// Get user profile by user ID
  ///
  /// Returns the profile for the specified user.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the profile is not found
  /// - [ValidationFailure] if the user ID is invalid
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, ProfileEntity>> getProfile(String userId);

  /// Get current user's profile
  ///
  /// Returns the profile for the currently authenticated user.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the profile is not found
  /// - [AuthenticationFailure] if the user is not authenticated
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, ProfileEntity>> getCurrentUserProfile();

  /// Update user profile
  ///
  /// Updates the profile information for the specified user.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the profile is not found
  /// - [ValidationFailure] if the data is invalid
  /// - [AuthorizationFailure] if the user is not authorized
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
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
  });

  /// Upload user avatar
  ///
  /// Uploads a new avatar image for the user and updates their profile.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the profile is not found
  /// - [ValidationFailure] if the file is invalid
  /// - [AuthorizationFailure] if the user is not authorized
  /// - [StorageFailure] if there's a storage error
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, ProfileEntity>> uploadAvatar({
    required String userId,
    required String filePath,
  });

  /// Delete user avatar
  ///
  /// Removes the avatar image for the user.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the profile is not found
  /// - [AuthorizationFailure] if the user is not authorized
  /// - [StorageFailure] if there's a storage error
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, ProfileEntity>> deleteAvatar(String userId);

  /// Update user preferences
  ///
  /// Updates the user's preferences (language, notifications, etc.).
  ///
  /// Throws:
  /// - [NotFoundFailure] if the profile is not found
  /// - [ValidationFailure] if the data is invalid
  /// - [AuthorizationFailure] if the user is not authorized
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, ProfileEntity>> updatePreferences({
    required String userId,
    String? preferredLanguage,
    bool? notificationsEnabled,
    bool? emailNotificationsEnabled,
  });

  /// Update last login timestamp
  ///
  /// Records the user's last login time.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the profile is not found
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, ProfileEntity>> updateLastLogin(String userId);

  /// Update learning statistics
  ///
  /// Updates the user's learning statistics (enrollments, completed courses, etc.).
  /// This is typically called automatically when courses are completed.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the profile is not found
  /// - [ValidationFailure] if the data is invalid
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, ProfileEntity>> updateLearningStats({
    required String userId,
    int? totalEnrollments,
    int? completedCourses,
    int? certificatesEarned,
    int? totalPoints,
  });

  /// Deactivate user profile
  ///
  /// Marks the user profile as inactive.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the profile is not found
  /// - [AuthorizationFailure] if the user is not authorized
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, ProfileEntity>> deactivateProfile(String userId);

  /// Reactivate user profile
  ///
  /// Marks the user profile as active.
  ///
  /// Throws:
  /// - [NotFoundFailure] if the profile is not found
  /// - [AuthorizationFailure] if the user is not authorized
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, ProfileEntity>> reactivateProfile(String userId);

  /// Search profiles by name or email
  ///
  /// Returns a list of profiles matching the search query.
  /// Typically used by instructors or admins.
  ///
  /// Throws:
  /// - [ValidationFailure] if the query is invalid
  /// - [AuthorizationFailure] if the user is not authorized
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, List<ProfileEntity>>> searchProfiles(String query);

  /// Get profiles by role
  ///
  /// Returns all profiles with the specified role.
  /// Typically used by admins.
  ///
  /// Throws:
  /// - [AuthorizationFailure] if the user is not authorized
  /// - [DatabaseFailure] if there's a database error
  /// - [NetworkFailure] if there's a network error
  Future<Either<Failure, List<ProfileEntity>>> getProfilesByRole(
    UserRole role,
  );
}
