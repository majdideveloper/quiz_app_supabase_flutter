import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common/common.dart';

part 'profile_state.freezed.dart';

/// Profile states using Freezed
@freezed
class ProfileState with _$ProfileState {
  /// Initial profile state
  const factory ProfileState.initial() = ProfileInitial;

  /// Profile loading state
  const factory ProfileState.loading() = ProfileLoading;

  /// Profile loaded successfully
  const factory ProfileState.loaded({
    required ProfileEntity profile,
  }) = ProfileLoaded;

  /// Avatar uploading state
  const factory ProfileState.uploading({
    required ProfileEntity profile,
  }) = ProfileUploading;

  /// Profile error state
  const factory ProfileState.error({
    required String message,
  }) = ProfileError;
}
