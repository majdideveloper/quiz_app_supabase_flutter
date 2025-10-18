import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:common/common.dart';

import 'profile_event.dart';
import 'profile_state.dart';

/// Profile BLoC
///
/// Manages profile state and handles:
/// - Profile loading
/// - Profile updates
/// - Avatar upload/delete
/// - Preferences updates
@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final UploadAvatarUseCase _uploadAvatarUseCase;
  final DeleteAvatarUseCase _deleteAvatarUseCase;
  final UpdatePreferencesUseCase _updatePreferencesUseCase;

  ProfileBloc({
    required GetProfileUseCase getProfileUseCase,
    required UpdateProfileUseCase updateProfileUseCase,
    required UploadAvatarUseCase uploadAvatarUseCase,
    required DeleteAvatarUseCase deleteAvatarUseCase,
    required UpdatePreferencesUseCase updatePreferencesUseCase,
  })  : _getProfileUseCase = getProfileUseCase,
        _updateProfileUseCase = updateProfileUseCase,
        _uploadAvatarUseCase = uploadAvatarUseCase,
        _deleteAvatarUseCase = deleteAvatarUseCase,
        _updatePreferencesUseCase = updatePreferencesUseCase,
        super(const ProfileState.initial()) {
    on<LoadProfileEvent>(_onLoadProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<UploadAvatarEvent>(_onUploadAvatar);
    on<DeleteAvatarEvent>(_onDeleteAvatar);
    on<UpdatePreferencesEvent>(_onUpdatePreferences);
    on<RefreshProfileEvent>(_onRefreshProfile);
  }

  // ==========================================================================
  // EVENT HANDLERS
  // ==========================================================================

  /// Handles profile load request
  Future<void> _onLoadProfile(
    LoadProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await _getProfileUseCase();

    result.fold(
      (failure) => emit(ProfileState.error(message: failure.message)),
      (profile) => emit(ProfileState.loaded(profile: profile)),
    );
  }

  /// Handles profile update request
  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await _updateProfileUseCase(
      UpdateProfileParams(
        userId: event.userId,
        fullName: event.fullName,
        phone: event.phone,
        bio: event.bio,
        dateOfBirth: event.dateOfBirth,
        address: event.address,
        city: event.city,
        province: event.province,
        postalCode: event.postalCode,
        country: event.country,
      ),
    );

    result.fold(
      (failure) => emit(ProfileState.error(message: failure.message)),
      (profile) => emit(ProfileState.loaded(profile: profile)),
    );
  }

  /// Handles avatar upload request
  Future<void> _onUploadAvatar(
    UploadAvatarEvent event,
    Emitter<ProfileState> emit,
  ) async {
    // Get current profile if in loaded state
    final currentProfile = state.whenOrNull(
      loaded: (profile) => profile,
    );

    if (currentProfile != null) {
      emit(ProfileState.uploading(profile: currentProfile));
    } else {
      emit(const ProfileState.loading());
    }

    final result = await _uploadAvatarUseCase(
      UploadAvatarParams(
        userId: event.userId,
        filePath: event.filePath,
      ),
    );

    result.fold(
      (failure) => emit(ProfileState.error(message: failure.message)),
      (profile) => emit(ProfileState.loaded(profile: profile)),
    );
  }

  /// Handles avatar delete request
  Future<void> _onDeleteAvatar(
    DeleteAvatarEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await _deleteAvatarUseCase(event.userId);

    result.fold(
      (failure) => emit(ProfileState.error(message: failure.message)),
      (profile) => emit(ProfileState.loaded(profile: profile)),
    );
  }

  /// Handles preferences update request
  Future<void> _onUpdatePreferences(
    UpdatePreferencesEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await _updatePreferencesUseCase(
      UpdatePreferencesParams(
        userId: event.userId,
        preferredLanguage: event.preferredLanguage,
        notificationsEnabled: event.notificationsEnabled,
        emailNotificationsEnabled: event.emailNotificationsEnabled,
      ),
    );

    result.fold(
      (failure) => emit(ProfileState.error(message: failure.message)),
      (profile) => emit(ProfileState.loaded(profile: profile)),
    );
  }

  /// Handles profile refresh request
  Future<void> _onRefreshProfile(
    RefreshProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    // Same as load profile
    final result = await _getProfileUseCase();

    result.fold(
      (failure) => emit(ProfileState.error(message: failure.message)),
      (profile) => emit(ProfileState.loaded(profile: profile)),
    );
  }
}
