import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/logger.dart';
import '../models/user_model.dart';

/// Remote data source for authentication operations
///
/// This class handles all remote data operations for authentication using Supabase.
/// It communicates with Supabase Auth and the profiles table.
///
/// All methods throw specific exceptions on error:
/// - [AuthenticationException]: Auth-related errors (invalid credentials, etc.)
/// - [ServerException]: Server or database errors
/// - [NetworkException]: Network connectivity issues
abstract class AuthRemoteDataSource {
  /// Login with email and password
  Future<UserModel> login({
    required String email,
    required String password,
  });

  /// Register a new user
  Future<UserModel> register({
    required String email,
    required String password,
    String? fullName,
  });

  /// Logout the current user
  Future<void> logout();

  /// Get the current user
  Future<UserModel> getCurrentUser();

  /// Update user profile
  Future<UserModel> updateProfile({
    String? fullName,
    String? avatarUrl,
  });

  /// Send password reset email
  Future<void> resetPassword({required String email});

  /// Stream of authentication state changes
  Stream<UserModel?> get authStateChanges;
}

/// Implementation of [AuthRemoteDataSource] using Supabase
@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabase;

  AuthRemoteDataSourceImpl(this._supabase);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      AppLogger.logRequest('POST', '/auth/v1/token', params: {'email': email});

      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw const AuthenticationException(
          message: 'Échec de la connexion',
          code: 'LOGIN_FAILED',
        );
      }

      // Fetch user profile from profiles table
      final userModel = await _fetchUserProfile(response.user!.id);

      AppLogger.logResponse('POST', '/auth/v1/token', 200);
      return userModel;
    } on AuthException catch (e) {
      AppLogger.error('AuthRemoteDataSource: Login failed', error: e.message);
      throw AuthenticationException(
        message: _mapAuthErrorMessage(e.message),
        code: e.statusCode ?? 'AUTH_ERROR',
      );
    } catch (e) {
      AppLogger.error('AuthRemoteDataSource: Login error', error: e);
      if (e is AuthenticationException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<UserModel> register({
    required String email,
    required String password,
    String? fullName,
  }) async {
    try {
      AppLogger.logRequest('POST', '/auth/v1/signup', params: {'email': email});

      // Create auth user
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw const AuthenticationException(
          message: 'Échec de la création du compte',
          code: 'SIGNUP_FAILED',
        );
      }

      // Update profile with full name if provided
      if (fullName != null && fullName.isNotEmpty) {
        await _supabase.from('profiles').update({
          'full_name': fullName,
        }).eq('id', response.user!.id);
      }

      // Fetch complete user profile
      final userModel = await _fetchUserProfile(response.user!.id);

      AppLogger.logResponse('POST', '/auth/v1/signup', 200);
      return userModel;
    } on AuthException catch (e) {
      AppLogger.error('AuthRemoteDataSource: Registration failed', error: e.message);
      throw AuthenticationException(
        message: _mapAuthErrorMessage(e.message),
        code: e.statusCode ?? 'AUTH_ERROR',
      );
    } on PostgrestException catch (e) {
      AppLogger.error('AuthRemoteDataSource: Profile update failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la création du profil',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('AuthRemoteDataSource: Registration error', error: e);
      if (e is AuthenticationException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur de connexion au serveur',
        originalError: e,
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      AppLogger.logRequest('POST', '/auth/v1/logout');

      await _supabase.auth.signOut();

      AppLogger.logResponse('POST', '/auth/v1/logout', 200);
    } on AuthException catch (e) {
      AppLogger.error('AuthRemoteDataSource: Logout failed', error: e.message);
      throw AuthenticationException(
        message: 'Échec de la déconnexion',
        code: e.statusCode ?? 'LOGOUT_ERROR',
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('AuthRemoteDataSource: Logout error', error: e);
      throw ServerException(
        message: 'Erreur lors de la déconnexion',
        originalError: e,
      );
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final user = _supabase.auth.currentUser;

      if (user == null) {
        throw const AuthenticationException(
          message: 'Aucun utilisateur connecté',
          code: 'NO_USER',
        );
      }

      // Fetch user profile from profiles table
      return await _fetchUserProfile(user.id);
    } catch (e) {
      AppLogger.error('AuthRemoteDataSource: Get current user error', error: e);
      if (e is AuthenticationException) rethrow;
      throw ServerException(
        message: 'Erreur lors de la récupération de l\'utilisateur',
        originalError: e,
      );
    }
  }

  @override
  Future<UserModel> updateProfile({
    String? fullName,
    String? avatarUrl,
  }) async {
    try {
      final user = _supabase.auth.currentUser;

      if (user == null) {
        throw const AuthenticationException(
          message: 'Aucun utilisateur connecté',
          code: 'NO_USER',
        );
      }

      AppLogger.logRequest('PATCH', '/rest/v1/profiles', params: {
        'full_name': fullName,
        'avatar_url': avatarUrl,
      });

      // Build update data
      final updateData = <String, dynamic>{};
      if (fullName != null) updateData['full_name'] = fullName;
      if (avatarUrl != null) updateData['avatar_url'] = avatarUrl;

      if (updateData.isEmpty) {
        // Nothing to update, return current user
        return await _fetchUserProfile(user.id);
      }

      // Update profile
      await _supabase.from('profiles').update(updateData).eq('id', user.id);

      // Fetch updated profile
      final updatedUser = await _fetchUserProfile(user.id);

      AppLogger.logResponse('PATCH', '/rest/v1/profiles', 200);
      return updatedUser;
    } on PostgrestException catch (e) {
      AppLogger.error('AuthRemoteDataSource: Profile update failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la mise à jour du profil',
        code: e.code,
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('AuthRemoteDataSource: Update profile error', error: e);
      if (e is AuthenticationException || e is DatabaseException) rethrow;
      throw ServerException(
        message: 'Erreur lors de la mise à jour du profil',
        originalError: e,
      );
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      AppLogger.logRequest('POST', '/auth/v1/recover', params: {'email': email});

      await _supabase.auth.resetPasswordForEmail(email);

      AppLogger.logResponse('POST', '/auth/v1/recover', 200);
    } on AuthException catch (e) {
      AppLogger.error('AuthRemoteDataSource: Password reset failed', error: e.message);
      throw AuthenticationException(
        message: 'Échec de l\'envoi du courriel de réinitialisation',
        code: e.statusCode ?? 'RESET_ERROR',
        originalError: e,
      );
    } catch (e) {
      AppLogger.error('AuthRemoteDataSource: Password reset error', error: e);
      throw ServerException(
        message: 'Erreur lors de l\'envoi du courriel de réinitialisation',
        originalError: e,
      );
    }
  }

  @override
  Stream<UserModel?> get authStateChanges {
    return _supabase.auth.onAuthStateChange.asyncMap((event) async {
      final user = event.session?.user;
      if (user == null) return null;

      try {
        return await _fetchUserProfile(user.id);
      } catch (e) {
        AppLogger.error(
          'AuthRemoteDataSource: Auth state change error',
          error: e,
        );
        return null;
      }
    });
  }

  /// Fetch user profile from profiles table
  Future<UserModel> _fetchUserProfile(String userId) async {
    try {
      final response = await _supabase
          .from('profiles')
          .select()
          .eq('id', userId)
          .single();

      return UserModel.fromJson(response);
    } on PostgrestException catch (e) {
      AppLogger.error('AuthRemoteDataSource: Profile fetch failed', error: e.message);
      throw DatabaseException(
        message: 'Erreur lors de la récupération du profil',
        code: e.code,
        originalError: e,
      );
    }
  }

  /// Map Supabase auth error messages to French user-friendly messages
  String _mapAuthErrorMessage(String errorMessage) {
    final message = errorMessage.toLowerCase();

    if (message.contains('invalid login credentials')) {
      return 'Courriel ou mot de passe invalide';
    } else if (message.contains('user already registered')) {
      return 'Ce courriel est déjà utilisé';
    } else if (message.contains('email not confirmed')) {
      return 'Veuillez confirmer votre courriel';
    } else if (message.contains('invalid email')) {
      return 'Format de courriel invalide';
    } else if (message.contains('password')) {
      return 'Mot de passe invalide';
    } else if (message.contains('network')) {
      return 'Erreur de connexion réseau';
    }

    return 'Erreur d\'authentification';
  }
}
