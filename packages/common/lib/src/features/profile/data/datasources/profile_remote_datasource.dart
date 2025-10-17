import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/profile_entity.dart';
import '../models/profile_model.dart';

/// Remote data source for profile operations
///
/// This class handles all remote data operations for user profiles
/// using Supabase.
abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile(String userId);
  Future<ProfileModel> getCurrentUserProfile();
  Future<ProfileModel> updateProfile({
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
  Future<ProfileModel> uploadAvatar({
    required String userId,
    required String filePath,
  });
  Future<ProfileModel> deleteAvatar(String userId);
  Future<ProfileModel> updatePreferences({
    required String userId,
    String? preferredLanguage,
    bool? notificationsEnabled,
    bool? emailNotificationsEnabled,
  });
  Future<ProfileModel> updateLastLogin(String userId);
  Future<ProfileModel> updateLearningStats({
    required String userId,
    int? totalEnrollments,
    int? completedCourses,
    int? certificatesEarned,
    int? totalPoints,
  });
  Future<ProfileModel> deactivateProfile(String userId);
  Future<ProfileModel> reactivateProfile(String userId);
  Future<List<ProfileModel>> searchProfiles(String query);
  Future<List<ProfileModel>> getProfilesByRole(UserRole role);
}

/// Implementation of [ProfileRemoteDataSource] using Supabase
@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SupabaseClient _supabase;

  ProfileRemoteDataSourceImpl(this._supabase);

  @override
  Future<ProfileModel> getProfile(String userId) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/profiles/$userId');

      final response = await _supabase
          .from('profiles')
          .select()
          .eq('id', userId)
          .single();

      final profile = ProfileModel.fromJson(response);

      AppLogger.logResponse('GET', '/rest/v1/profiles/$userId', 200);
      return profile;
    } on PostgrestException catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Get profile failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Profil non trouvé',
          code: 'PROFILE_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la récupération du profil',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Get profile error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<ProfileModel> getCurrentUserProfile() async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/profiles/current');

      final user = _supabase.auth.currentUser;
      if (user == null) {
        throw AuthenticationException(
          message: 'Utilisateur non authentifié',
          code: 'NOT_AUTHENTICATED',
        );
      }

      final response = await _supabase
          .from('profiles')
          .select()
          .eq('id', user.id)
          .single();

      final profile = ProfileModel.fromJson(response);

      AppLogger.logResponse('GET', '/rest/v1/profiles/current', 200);
      return profile;
    } on AuthenticationException {
      rethrow;
    } on PostgrestException catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Get current profile failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Profil non trouvé',
          code: 'PROFILE_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la récupération du profil',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Get current profile error', error: e);
      if (e is NotFoundException || e is DatabaseException || e is AuthenticationException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<ProfileModel> updateProfile({
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
      AppLogger.logRequest('PATCH', '/rest/v1/profiles/$userId');

      final updates = <String, dynamic>{
        'updated_at': DateTime.now().toIso8601String(),
      };

      if (fullName != null) updates['full_name'] = fullName;
      if (phone != null) updates['phone'] = phone;
      if (bio != null) updates['bio'] = bio;
      if (dateOfBirth != null) {
        updates['date_of_birth'] = dateOfBirth.toIso8601String();
      }
      if (address != null) updates['address'] = address;
      if (city != null) updates['city'] = city;
      if (province != null) updates['province'] = province;
      if (postalCode != null) updates['postal_code'] = postalCode;
      if (country != null) updates['country'] = country;

      final response = await _supabase
          .from('profiles')
          .update(updates)
          .eq('id', userId)
          .select()
          .single();

      final profile = ProfileModel.fromJson(response);

      AppLogger.logResponse('PATCH', '/rest/v1/profiles/$userId', 200);
      return profile;
    } on PostgrestException catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Update profile failed', error: e.message);

      if (e.code == 'PGRST116' || e.message.contains('0 rows')) {
        throw NotFoundException(
          message: 'Profil non trouvé',
          code: 'PROFILE_NOT_FOUND',
        );
      }

      throw DatabaseException(
        message: 'Erreur lors de la mise à jour du profil',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Update profile error', error: e);
      if (e is NotFoundException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<ProfileModel> uploadAvatar({
    required String userId,
    required String filePath,
  }) async {
    try {
      AppLogger.logRequest('POST', '/storage/v1/object/avatars');

      // Upload file to Supabase Storage
      final file = File(filePath);
      final fileExt = filePath.split('.').last;
      final fileName = '$userId-${DateTime.now().millisecondsSinceEpoch}.$fileExt';
      final storagePath = 'avatars/$fileName';

      final uploadResponse = await _supabase.storage
          .from('avatars')
          .upload(storagePath, file);

      if (uploadResponse.isEmpty) {
        throw const FileStorageException(
          message: 'Erreur lors du téléchargement de l\'avatar',
          code: 'UPLOAD_FAILED',
        );
      }

      // Get public URL
      final avatarUrl = _supabase.storage
          .from('avatars')
          .getPublicUrl(storagePath);

      // Update profile with avatar URL
      final response = await _supabase
          .from('profiles')
          .update({
            'avatar_url': avatarUrl,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', userId)
          .select()
          .single();

      final profile = ProfileModel.fromJson(response);

      AppLogger.logResponse('POST', '/storage/v1/object/avatars', 200);
      return profile;
    } on StorageException {
      rethrow;
    } on PostgrestException catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Upload avatar failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la mise à jour du profil',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Upload avatar error', error: e);
      if (e is StorageException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<ProfileModel> deleteAvatar(String userId) async {
    try {
      AppLogger.logRequest('DELETE', '/rest/v1/profiles/$userId/avatar');

      // Get current avatar URL to delete from storage
      final currentProfile = await getProfile(userId);

      if (currentProfile.avatarUrl != null) {
        // Extract file path from URL
        final uri = Uri.parse(currentProfile.avatarUrl!);
        final path = uri.pathSegments.last;

        // Delete from storage
        await _supabase.storage
            .from('avatars')
            .remove(['avatars/$path']);
      }

      // Update profile to remove avatar URL
      final response = await _supabase
          .from('profiles')
          .update({
            'avatar_url': null,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', userId)
          .select()
          .single();

      final profile = ProfileModel.fromJson(response);

      AppLogger.logResponse('DELETE', '/rest/v1/profiles/$userId/avatar', 200);
      return profile;
    } on PostgrestException catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Delete avatar failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la suppression de l\'avatar',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Delete avatar error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<ProfileModel> updatePreferences({
    required String userId,
    String? preferredLanguage,
    bool? notificationsEnabled,
    bool? emailNotificationsEnabled,
  }) async {
    try {
      AppLogger.logRequest('PATCH', '/rest/v1/profiles/$userId/preferences');

      final updates = <String, dynamic>{
        'updated_at': DateTime.now().toIso8601String(),
      };

      if (preferredLanguage != null) {
        updates['preferred_language'] = preferredLanguage;
      }
      if (notificationsEnabled != null) {
        updates['notifications_enabled'] = notificationsEnabled;
      }
      if (emailNotificationsEnabled != null) {
        updates['email_notifications_enabled'] = emailNotificationsEnabled;
      }

      final response = await _supabase
          .from('profiles')
          .update(updates)
          .eq('id', userId)
          .select()
          .single();

      final profile = ProfileModel.fromJson(response);

      AppLogger.logResponse('PATCH', '/rest/v1/profiles/$userId/preferences', 200);
      return profile;
    } on PostgrestException catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Update preferences failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la mise à jour des préférences',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Update preferences error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<ProfileModel> updateLastLogin(String userId) async {
    try {
      AppLogger.logRequest('PATCH', '/rest/v1/profiles/$userId/last_login');

      final now = DateTime.now().toIso8601String();
      final response = await _supabase
          .from('profiles')
          .update({
            'last_login_at': now,
            'updated_at': now,
          })
          .eq('id', userId)
          .select()
          .single();

      final profile = ProfileModel.fromJson(response);

      AppLogger.logResponse('PATCH', '/rest/v1/profiles/$userId/last_login', 200);
      return profile;
    } on PostgrestException catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Update last login failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la mise à jour de la dernière connexion',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Update last login error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<ProfileModel> updateLearningStats({
    required String userId,
    int? totalEnrollments,
    int? completedCourses,
    int? certificatesEarned,
    int? totalPoints,
  }) async {
    try {
      AppLogger.logRequest('PATCH', '/rest/v1/profiles/$userId/stats');

      final updates = <String, dynamic>{
        'updated_at': DateTime.now().toIso8601String(),
      };

      if (totalEnrollments != null) {
        updates['total_enrollments'] = totalEnrollments;
      }
      if (completedCourses != null) {
        updates['completed_courses'] = completedCourses;
      }
      if (certificatesEarned != null) {
        updates['certificates_earned'] = certificatesEarned;
      }
      if (totalPoints != null) {
        updates['total_points'] = totalPoints;
      }

      final response = await _supabase
          .from('profiles')
          .update(updates)
          .eq('id', userId)
          .select()
          .single();

      final profile = ProfileModel.fromJson(response);

      AppLogger.logResponse('PATCH', '/rest/v1/profiles/$userId/stats', 200);
      return profile;
    } on PostgrestException catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Update learning stats failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la mise à jour des statistiques',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Update learning stats error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<ProfileModel> deactivateProfile(String userId) async {
    try {
      AppLogger.logRequest('PATCH', '/rest/v1/profiles/$userId/deactivate');

      final response = await _supabase
          .from('profiles')
          .update({
            'is_active': false,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', userId)
          .select()
          .single();

      final profile = ProfileModel.fromJson(response);

      AppLogger.logResponse('PATCH', '/rest/v1/profiles/$userId/deactivate', 200);
      return profile;
    } on PostgrestException catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Deactivate profile failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la désactivation du profil',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Deactivate profile error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<ProfileModel> reactivateProfile(String userId) async {
    try {
      AppLogger.logRequest('PATCH', '/rest/v1/profiles/$userId/reactivate');

      final response = await _supabase
          .from('profiles')
          .update({
            'is_active': true,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', userId)
          .select()
          .single();

      final profile = ProfileModel.fromJson(response);

      AppLogger.logResponse('PATCH', '/rest/v1/profiles/$userId/reactivate', 200);
      return profile;
    } on PostgrestException catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Reactivate profile failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la réactivation du profil',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Reactivate profile error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<ProfileModel>> searchProfiles(String query) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/profiles/search', params: {
        'query': query,
      });

      final response = await _supabase
          .from('profiles')
          .select()
          .or('full_name.ilike.%$query%,email.ilike.%$query%')
          .order('full_name');

      final profiles = (response as List)
          .map((json) => ProfileModel.fromJson(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/profiles/search', 200);
      return profiles;
    } on PostgrestException catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Search profiles failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la recherche de profils',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Search profiles error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<List<ProfileModel>> getProfilesByRole(UserRole role) async {
    try {
      AppLogger.logRequest('GET', '/rest/v1/profiles', params: {
        'role': role.toString(),
      });

      final roleString = role.toString().split('.').last;
      final response = await _supabase
          .from('profiles')
          .select()
          .eq('role', roleString)
          .order('full_name');

      final profiles = (response as List)
          .map((json) => ProfileModel.fromJson(json))
          .toList();

      AppLogger.logResponse('GET', '/rest/v1/profiles', 200);
      return profiles;
    } on PostgrestException catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Get profiles by role failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération des profils',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('ProfileRemoteDataSource: Get profiles by role error', error: e);
      if (e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }
}
