import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// User model for data layer
///
/// This is the data layer representation of a user. It extends [UserEntity]
/// and adds JSON serialization capabilities for API communication.
///
/// The model maps to the `profiles` table in Supabase:
/// - id: UUID from auth.users
/// - email: User's email address
/// - full_name: User's full name (nullable)
/// - avatar_url: URL to avatar image (nullable)
/// - role: User role (student/instructor/admin)
/// - created_at: Account creation timestamp
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    required UserRole role,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserModel;

  const UserModel._();

  /// Create UserModel from JSON
  ///
  /// Example JSON from Supabase:
  /// ```json
  /// {
  ///   "id": "123e4567-e89b-12d3-a456-426614174000",
  ///   "email": "user@example.com",
  ///   "full_name": "Jean Tremblay",
  ///   "avatar_url": "https://example.com/avatar.jpg",
  ///   "role": "student",
  ///   "created_at": "2024-01-15T10:30:00.000Z"
  /// }
  /// ```
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Convert UserModel to domain entity
  ///
  /// This allows the data layer to return domain entities to the
  /// domain layer, maintaining clean architecture boundaries.
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      fullName: fullName,
      avatarUrl: avatarUrl,
      role: role,
      createdAt: createdAt,
    );
  }

  /// Create UserModel from domain entity
  ///
  /// Useful when you need to convert a domain entity to a model
  /// for serialization or database operations.
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      fullName: entity.fullName,
      avatarUrl: entity.avatarUrl,
      role: entity.role,
      createdAt: entity.createdAt,
    );
  }

  /// Create UserModel from Supabase Auth User
  ///
  /// This is used when converting Supabase's auth.User object
  /// to our UserModel. Note that we need to fetch the profile
  /// separately to get full_name, avatar_url, and role.
  factory UserModel.fromSupabaseUser({
    required String id,
    required String email,
    String? fullName,
    String? avatarUrl,
    UserRole role = UserRole.student,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id,
      email: email,
      fullName: fullName,
      avatarUrl: avatarUrl,
      role: role,
      createdAt: createdAt ?? DateTime.now(),
    );
  }
}
