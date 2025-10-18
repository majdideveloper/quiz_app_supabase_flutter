// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )
    updateProfile,
    required TResult Function(String userId, String filePath) uploadAvatar,
    required TResult Function(String userId) deleteAvatar,
    required TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )
    updatePreferences,
    required TResult Function() refreshProfile,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult? Function(String userId, String filePath)? uploadAvatar,
    TResult? Function(String userId)? deleteAvatar,
    TResult? Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult? Function()? refreshProfile,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult Function(String userId, String filePath)? uploadAvatar,
    TResult Function(String userId)? deleteAvatar,
    TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfileEvent value) loadProfile,
    required TResult Function(UpdateProfileEvent value) updateProfile,
    required TResult Function(UploadAvatarEvent value) uploadAvatar,
    required TResult Function(DeleteAvatarEvent value) deleteAvatar,
    required TResult Function(UpdatePreferencesEvent value) updatePreferences,
    required TResult Function(RefreshProfileEvent value) refreshProfile,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfileEvent value)? loadProfile,
    TResult? Function(UpdateProfileEvent value)? updateProfile,
    TResult? Function(UploadAvatarEvent value)? uploadAvatar,
    TResult? Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult? Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult? Function(RefreshProfileEvent value)? refreshProfile,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfileEvent value)? loadProfile,
    TResult Function(UpdateProfileEvent value)? updateProfile,
    TResult Function(UploadAvatarEvent value)? uploadAvatar,
    TResult Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult Function(RefreshProfileEvent value)? refreshProfile,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
    ProfileEvent value,
    $Res Function(ProfileEvent) then,
  ) = _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadProfileEventImplCopyWith<$Res> {
  factory _$$LoadProfileEventImplCopyWith(
    _$LoadProfileEventImpl value,
    $Res Function(_$LoadProfileEventImpl) then,
  ) = __$$LoadProfileEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadProfileEventImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$LoadProfileEventImpl>
    implements _$$LoadProfileEventImplCopyWith<$Res> {
  __$$LoadProfileEventImplCopyWithImpl(
    _$LoadProfileEventImpl _value,
    $Res Function(_$LoadProfileEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadProfileEventImpl implements LoadProfileEvent {
  const _$LoadProfileEventImpl();

  @override
  String toString() {
    return 'ProfileEvent.loadProfile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadProfileEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )
    updateProfile,
    required TResult Function(String userId, String filePath) uploadAvatar,
    required TResult Function(String userId) deleteAvatar,
    required TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )
    updatePreferences,
    required TResult Function() refreshProfile,
  }) {
    return loadProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult? Function(String userId, String filePath)? uploadAvatar,
    TResult? Function(String userId)? deleteAvatar,
    TResult? Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult? Function()? refreshProfile,
  }) {
    return loadProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult Function(String userId, String filePath)? uploadAvatar,
    TResult Function(String userId)? deleteAvatar,
    TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) {
    if (loadProfile != null) {
      return loadProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfileEvent value) loadProfile,
    required TResult Function(UpdateProfileEvent value) updateProfile,
    required TResult Function(UploadAvatarEvent value) uploadAvatar,
    required TResult Function(DeleteAvatarEvent value) deleteAvatar,
    required TResult Function(UpdatePreferencesEvent value) updatePreferences,
    required TResult Function(RefreshProfileEvent value) refreshProfile,
  }) {
    return loadProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfileEvent value)? loadProfile,
    TResult? Function(UpdateProfileEvent value)? updateProfile,
    TResult? Function(UploadAvatarEvent value)? uploadAvatar,
    TResult? Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult? Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult? Function(RefreshProfileEvent value)? refreshProfile,
  }) {
    return loadProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfileEvent value)? loadProfile,
    TResult Function(UpdateProfileEvent value)? updateProfile,
    TResult Function(UploadAvatarEvent value)? uploadAvatar,
    TResult Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult Function(RefreshProfileEvent value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (loadProfile != null) {
      return loadProfile(this);
    }
    return orElse();
  }
}

abstract class LoadProfileEvent implements ProfileEvent {
  const factory LoadProfileEvent() = _$LoadProfileEventImpl;
}

/// @nodoc
abstract class _$$UpdateProfileEventImplCopyWith<$Res> {
  factory _$$UpdateProfileEventImplCopyWith(
    _$UpdateProfileEventImpl value,
    $Res Function(_$UpdateProfileEventImpl) then,
  ) = __$$UpdateProfileEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String userId,
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
}

/// @nodoc
class __$$UpdateProfileEventImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UpdateProfileEventImpl>
    implements _$$UpdateProfileEventImplCopyWith<$Res> {
  __$$UpdateProfileEventImplCopyWithImpl(
    _$UpdateProfileEventImpl _value,
    $Res Function(_$UpdateProfileEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? fullName = freezed,
    Object? phone = freezed,
    Object? bio = freezed,
    Object? dateOfBirth = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? province = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
  }) {
    return _then(
      _$UpdateProfileEventImpl(
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        fullName:
            freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                    as String?,
        phone:
            freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                    as String?,
        bio:
            freezed == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                    as String?,
        dateOfBirth:
            freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        address:
            freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String?,
        city:
            freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String?,
        province:
            freezed == province
                ? _value.province
                : province // ignore: cast_nullable_to_non_nullable
                    as String?,
        postalCode:
            freezed == postalCode
                ? _value.postalCode
                : postalCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        country:
            freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$UpdateProfileEventImpl implements UpdateProfileEvent {
  const _$UpdateProfileEventImpl({
    required this.userId,
    this.fullName,
    this.phone,
    this.bio,
    this.dateOfBirth,
    this.address,
    this.city,
    this.province,
    this.postalCode,
    this.country,
  });

  @override
  final String userId;
  @override
  final String? fullName;
  @override
  final String? phone;
  @override
  final String? bio;
  @override
  final DateTime? dateOfBirth;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? province;
  @override
  final String? postalCode;
  @override
  final String? country;

  @override
  String toString() {
    return 'ProfileEvent.updateProfile(userId: $userId, fullName: $fullName, phone: $phone, bio: $bio, dateOfBirth: $dateOfBirth, address: $address, city: $city, province: $province, postalCode: $postalCode, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    fullName,
    phone,
    bio,
    dateOfBirth,
    address,
    city,
    province,
    postalCode,
    country,
  );

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileEventImplCopyWith<_$UpdateProfileEventImpl> get copyWith =>
      __$$UpdateProfileEventImplCopyWithImpl<_$UpdateProfileEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )
    updateProfile,
    required TResult Function(String userId, String filePath) uploadAvatar,
    required TResult Function(String userId) deleteAvatar,
    required TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )
    updatePreferences,
    required TResult Function() refreshProfile,
  }) {
    return updateProfile(
      userId,
      fullName,
      phone,
      bio,
      dateOfBirth,
      address,
      city,
      province,
      postalCode,
      country,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult? Function(String userId, String filePath)? uploadAvatar,
    TResult? Function(String userId)? deleteAvatar,
    TResult? Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult? Function()? refreshProfile,
  }) {
    return updateProfile?.call(
      userId,
      fullName,
      phone,
      bio,
      dateOfBirth,
      address,
      city,
      province,
      postalCode,
      country,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult Function(String userId, String filePath)? uploadAvatar,
    TResult Function(String userId)? deleteAvatar,
    TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(
        userId,
        fullName,
        phone,
        bio,
        dateOfBirth,
        address,
        city,
        province,
        postalCode,
        country,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfileEvent value) loadProfile,
    required TResult Function(UpdateProfileEvent value) updateProfile,
    required TResult Function(UploadAvatarEvent value) uploadAvatar,
    required TResult Function(DeleteAvatarEvent value) deleteAvatar,
    required TResult Function(UpdatePreferencesEvent value) updatePreferences,
    required TResult Function(RefreshProfileEvent value) refreshProfile,
  }) {
    return updateProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfileEvent value)? loadProfile,
    TResult? Function(UpdateProfileEvent value)? updateProfile,
    TResult? Function(UploadAvatarEvent value)? uploadAvatar,
    TResult? Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult? Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult? Function(RefreshProfileEvent value)? refreshProfile,
  }) {
    return updateProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfileEvent value)? loadProfile,
    TResult Function(UpdateProfileEvent value)? updateProfile,
    TResult Function(UploadAvatarEvent value)? uploadAvatar,
    TResult Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult Function(RefreshProfileEvent value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(this);
    }
    return orElse();
  }
}

abstract class UpdateProfileEvent implements ProfileEvent {
  const factory UpdateProfileEvent({
    required final String userId,
    final String? fullName,
    final String? phone,
    final String? bio,
    final DateTime? dateOfBirth,
    final String? address,
    final String? city,
    final String? province,
    final String? postalCode,
    final String? country,
  }) = _$UpdateProfileEventImpl;

  String get userId;
  String? get fullName;
  String? get phone;
  String? get bio;
  DateTime? get dateOfBirth;
  String? get address;
  String? get city;
  String? get province;
  String? get postalCode;
  String? get country;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProfileEventImplCopyWith<_$UpdateProfileEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadAvatarEventImplCopyWith<$Res> {
  factory _$$UploadAvatarEventImplCopyWith(
    _$UploadAvatarEventImpl value,
    $Res Function(_$UploadAvatarEventImpl) then,
  ) = __$$UploadAvatarEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String filePath});
}

/// @nodoc
class __$$UploadAvatarEventImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UploadAvatarEventImpl>
    implements _$$UploadAvatarEventImplCopyWith<$Res> {
  __$$UploadAvatarEventImplCopyWithImpl(
    _$UploadAvatarEventImpl _value,
    $Res Function(_$UploadAvatarEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? filePath = null}) {
    return _then(
      _$UploadAvatarEventImpl(
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        filePath:
            null == filePath
                ? _value.filePath
                : filePath // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$UploadAvatarEventImpl implements UploadAvatarEvent {
  const _$UploadAvatarEventImpl({required this.userId, required this.filePath});

  @override
  final String userId;
  @override
  final String filePath;

  @override
  String toString() {
    return 'ProfileEvent.uploadAvatar(userId: $userId, filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadAvatarEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, filePath);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadAvatarEventImplCopyWith<_$UploadAvatarEventImpl> get copyWith =>
      __$$UploadAvatarEventImplCopyWithImpl<_$UploadAvatarEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )
    updateProfile,
    required TResult Function(String userId, String filePath) uploadAvatar,
    required TResult Function(String userId) deleteAvatar,
    required TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )
    updatePreferences,
    required TResult Function() refreshProfile,
  }) {
    return uploadAvatar(userId, filePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult? Function(String userId, String filePath)? uploadAvatar,
    TResult? Function(String userId)? deleteAvatar,
    TResult? Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult? Function()? refreshProfile,
  }) {
    return uploadAvatar?.call(userId, filePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult Function(String userId, String filePath)? uploadAvatar,
    TResult Function(String userId)? deleteAvatar,
    TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) {
    if (uploadAvatar != null) {
      return uploadAvatar(userId, filePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfileEvent value) loadProfile,
    required TResult Function(UpdateProfileEvent value) updateProfile,
    required TResult Function(UploadAvatarEvent value) uploadAvatar,
    required TResult Function(DeleteAvatarEvent value) deleteAvatar,
    required TResult Function(UpdatePreferencesEvent value) updatePreferences,
    required TResult Function(RefreshProfileEvent value) refreshProfile,
  }) {
    return uploadAvatar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfileEvent value)? loadProfile,
    TResult? Function(UpdateProfileEvent value)? updateProfile,
    TResult? Function(UploadAvatarEvent value)? uploadAvatar,
    TResult? Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult? Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult? Function(RefreshProfileEvent value)? refreshProfile,
  }) {
    return uploadAvatar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfileEvent value)? loadProfile,
    TResult Function(UpdateProfileEvent value)? updateProfile,
    TResult Function(UploadAvatarEvent value)? uploadAvatar,
    TResult Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult Function(RefreshProfileEvent value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (uploadAvatar != null) {
      return uploadAvatar(this);
    }
    return orElse();
  }
}

abstract class UploadAvatarEvent implements ProfileEvent {
  const factory UploadAvatarEvent({
    required final String userId,
    required final String filePath,
  }) = _$UploadAvatarEventImpl;

  String get userId;
  String get filePath;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadAvatarEventImplCopyWith<_$UploadAvatarEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAvatarEventImplCopyWith<$Res> {
  factory _$$DeleteAvatarEventImplCopyWith(
    _$DeleteAvatarEventImpl value,
    $Res Function(_$DeleteAvatarEventImpl) then,
  ) = __$$DeleteAvatarEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$DeleteAvatarEventImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$DeleteAvatarEventImpl>
    implements _$$DeleteAvatarEventImplCopyWith<$Res> {
  __$$DeleteAvatarEventImplCopyWithImpl(
    _$DeleteAvatarEventImpl _value,
    $Res Function(_$DeleteAvatarEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$DeleteAvatarEventImpl(
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteAvatarEventImpl implements DeleteAvatarEvent {
  const _$DeleteAvatarEventImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'ProfileEvent.deleteAvatar(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAvatarEventImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAvatarEventImplCopyWith<_$DeleteAvatarEventImpl> get copyWith =>
      __$$DeleteAvatarEventImplCopyWithImpl<_$DeleteAvatarEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )
    updateProfile,
    required TResult Function(String userId, String filePath) uploadAvatar,
    required TResult Function(String userId) deleteAvatar,
    required TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )
    updatePreferences,
    required TResult Function() refreshProfile,
  }) {
    return deleteAvatar(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult? Function(String userId, String filePath)? uploadAvatar,
    TResult? Function(String userId)? deleteAvatar,
    TResult? Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult? Function()? refreshProfile,
  }) {
    return deleteAvatar?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult Function(String userId, String filePath)? uploadAvatar,
    TResult Function(String userId)? deleteAvatar,
    TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) {
    if (deleteAvatar != null) {
      return deleteAvatar(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfileEvent value) loadProfile,
    required TResult Function(UpdateProfileEvent value) updateProfile,
    required TResult Function(UploadAvatarEvent value) uploadAvatar,
    required TResult Function(DeleteAvatarEvent value) deleteAvatar,
    required TResult Function(UpdatePreferencesEvent value) updatePreferences,
    required TResult Function(RefreshProfileEvent value) refreshProfile,
  }) {
    return deleteAvatar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfileEvent value)? loadProfile,
    TResult? Function(UpdateProfileEvent value)? updateProfile,
    TResult? Function(UploadAvatarEvent value)? uploadAvatar,
    TResult? Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult? Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult? Function(RefreshProfileEvent value)? refreshProfile,
  }) {
    return deleteAvatar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfileEvent value)? loadProfile,
    TResult Function(UpdateProfileEvent value)? updateProfile,
    TResult Function(UploadAvatarEvent value)? uploadAvatar,
    TResult Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult Function(RefreshProfileEvent value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (deleteAvatar != null) {
      return deleteAvatar(this);
    }
    return orElse();
  }
}

abstract class DeleteAvatarEvent implements ProfileEvent {
  const factory DeleteAvatarEvent({required final String userId}) =
      _$DeleteAvatarEventImpl;

  String get userId;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteAvatarEventImplCopyWith<_$DeleteAvatarEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePreferencesEventImplCopyWith<$Res> {
  factory _$$UpdatePreferencesEventImplCopyWith(
    _$UpdatePreferencesEventImpl value,
    $Res Function(_$UpdatePreferencesEventImpl) then,
  ) = __$$UpdatePreferencesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String userId,
    String? preferredLanguage,
    bool? notificationsEnabled,
    bool? emailNotificationsEnabled,
  });
}

/// @nodoc
class __$$UpdatePreferencesEventImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UpdatePreferencesEventImpl>
    implements _$$UpdatePreferencesEventImplCopyWith<$Res> {
  __$$UpdatePreferencesEventImplCopyWithImpl(
    _$UpdatePreferencesEventImpl _value,
    $Res Function(_$UpdatePreferencesEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? preferredLanguage = freezed,
    Object? notificationsEnabled = freezed,
    Object? emailNotificationsEnabled = freezed,
  }) {
    return _then(
      _$UpdatePreferencesEventImpl(
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        preferredLanguage:
            freezed == preferredLanguage
                ? _value.preferredLanguage
                : preferredLanguage // ignore: cast_nullable_to_non_nullable
                    as String?,
        notificationsEnabled:
            freezed == notificationsEnabled
                ? _value.notificationsEnabled
                : notificationsEnabled // ignore: cast_nullable_to_non_nullable
                    as bool?,
        emailNotificationsEnabled:
            freezed == emailNotificationsEnabled
                ? _value.emailNotificationsEnabled
                : emailNotificationsEnabled // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc

class _$UpdatePreferencesEventImpl implements UpdatePreferencesEvent {
  const _$UpdatePreferencesEventImpl({
    required this.userId,
    this.preferredLanguage,
    this.notificationsEnabled,
    this.emailNotificationsEnabled,
  });

  @override
  final String userId;
  @override
  final String? preferredLanguage;
  @override
  final bool? notificationsEnabled;
  @override
  final bool? emailNotificationsEnabled;

  @override
  String toString() {
    return 'ProfileEvent.updatePreferences(userId: $userId, preferredLanguage: $preferredLanguage, notificationsEnabled: $notificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePreferencesEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.preferredLanguage, preferredLanguage) ||
                other.preferredLanguage == preferredLanguage) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(
                  other.emailNotificationsEnabled,
                  emailNotificationsEnabled,
                ) ||
                other.emailNotificationsEnabled == emailNotificationsEnabled));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    preferredLanguage,
    notificationsEnabled,
    emailNotificationsEnabled,
  );

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePreferencesEventImplCopyWith<_$UpdatePreferencesEventImpl>
  get copyWith =>
      __$$UpdatePreferencesEventImplCopyWithImpl<_$UpdatePreferencesEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )
    updateProfile,
    required TResult Function(String userId, String filePath) uploadAvatar,
    required TResult Function(String userId) deleteAvatar,
    required TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )
    updatePreferences,
    required TResult Function() refreshProfile,
  }) {
    return updatePreferences(
      userId,
      preferredLanguage,
      notificationsEnabled,
      emailNotificationsEnabled,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult? Function(String userId, String filePath)? uploadAvatar,
    TResult? Function(String userId)? deleteAvatar,
    TResult? Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult? Function()? refreshProfile,
  }) {
    return updatePreferences?.call(
      userId,
      preferredLanguage,
      notificationsEnabled,
      emailNotificationsEnabled,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult Function(String userId, String filePath)? uploadAvatar,
    TResult Function(String userId)? deleteAvatar,
    TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) {
    if (updatePreferences != null) {
      return updatePreferences(
        userId,
        preferredLanguage,
        notificationsEnabled,
        emailNotificationsEnabled,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfileEvent value) loadProfile,
    required TResult Function(UpdateProfileEvent value) updateProfile,
    required TResult Function(UploadAvatarEvent value) uploadAvatar,
    required TResult Function(DeleteAvatarEvent value) deleteAvatar,
    required TResult Function(UpdatePreferencesEvent value) updatePreferences,
    required TResult Function(RefreshProfileEvent value) refreshProfile,
  }) {
    return updatePreferences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfileEvent value)? loadProfile,
    TResult? Function(UpdateProfileEvent value)? updateProfile,
    TResult? Function(UploadAvatarEvent value)? uploadAvatar,
    TResult? Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult? Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult? Function(RefreshProfileEvent value)? refreshProfile,
  }) {
    return updatePreferences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfileEvent value)? loadProfile,
    TResult Function(UpdateProfileEvent value)? updateProfile,
    TResult Function(UploadAvatarEvent value)? uploadAvatar,
    TResult Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult Function(RefreshProfileEvent value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updatePreferences != null) {
      return updatePreferences(this);
    }
    return orElse();
  }
}

abstract class UpdatePreferencesEvent implements ProfileEvent {
  const factory UpdatePreferencesEvent({
    required final String userId,
    final String? preferredLanguage,
    final bool? notificationsEnabled,
    final bool? emailNotificationsEnabled,
  }) = _$UpdatePreferencesEventImpl;

  String get userId;
  String? get preferredLanguage;
  bool? get notificationsEnabled;
  bool? get emailNotificationsEnabled;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePreferencesEventImplCopyWith<_$UpdatePreferencesEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshProfileEventImplCopyWith<$Res> {
  factory _$$RefreshProfileEventImplCopyWith(
    _$RefreshProfileEventImpl value,
    $Res Function(_$RefreshProfileEventImpl) then,
  ) = __$$RefreshProfileEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshProfileEventImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$RefreshProfileEventImpl>
    implements _$$RefreshProfileEventImplCopyWith<$Res> {
  __$$RefreshProfileEventImplCopyWithImpl(
    _$RefreshProfileEventImpl _value,
    $Res Function(_$RefreshProfileEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshProfileEventImpl implements RefreshProfileEvent {
  const _$RefreshProfileEventImpl();

  @override
  String toString() {
    return 'ProfileEvent.refreshProfile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshProfileEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )
    updateProfile,
    required TResult Function(String userId, String filePath) uploadAvatar,
    required TResult Function(String userId) deleteAvatar,
    required TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )
    updatePreferences,
    required TResult Function() refreshProfile,
  }) {
    return refreshProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult? Function(String userId, String filePath)? uploadAvatar,
    TResult? Function(String userId)? deleteAvatar,
    TResult? Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult? Function()? refreshProfile,
  }) {
    return refreshProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(
      String userId,
      String? fullName,
      String? phone,
      String? bio,
      DateTime? dateOfBirth,
      String? address,
      String? city,
      String? province,
      String? postalCode,
      String? country,
    )?
    updateProfile,
    TResult Function(String userId, String filePath)? uploadAvatar,
    TResult Function(String userId)? deleteAvatar,
    TResult Function(
      String userId,
      String? preferredLanguage,
      bool? notificationsEnabled,
      bool? emailNotificationsEnabled,
    )?
    updatePreferences,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) {
    if (refreshProfile != null) {
      return refreshProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfileEvent value) loadProfile,
    required TResult Function(UpdateProfileEvent value) updateProfile,
    required TResult Function(UploadAvatarEvent value) uploadAvatar,
    required TResult Function(DeleteAvatarEvent value) deleteAvatar,
    required TResult Function(UpdatePreferencesEvent value) updatePreferences,
    required TResult Function(RefreshProfileEvent value) refreshProfile,
  }) {
    return refreshProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfileEvent value)? loadProfile,
    TResult? Function(UpdateProfileEvent value)? updateProfile,
    TResult? Function(UploadAvatarEvent value)? uploadAvatar,
    TResult? Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult? Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult? Function(RefreshProfileEvent value)? refreshProfile,
  }) {
    return refreshProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfileEvent value)? loadProfile,
    TResult Function(UpdateProfileEvent value)? updateProfile,
    TResult Function(UploadAvatarEvent value)? uploadAvatar,
    TResult Function(DeleteAvatarEvent value)? deleteAvatar,
    TResult Function(UpdatePreferencesEvent value)? updatePreferences,
    TResult Function(RefreshProfileEvent value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (refreshProfile != null) {
      return refreshProfile(this);
    }
    return orElse();
  }
}

abstract class RefreshProfileEvent implements ProfileEvent {
  const factory RefreshProfileEvent() = _$RefreshProfileEventImpl;
}
