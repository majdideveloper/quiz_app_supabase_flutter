// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified')
  bool get emailVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get province => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String? get postalCode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_language')
  String get preferredLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'notifications_enabled')
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_notifications_enabled')
  bool get emailNotificationsEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_enrollments')
  int get totalEnrollments => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_courses')
  int get completedCourses => throw _privateConstructorUsedError;
  @JsonKey(name: 'certificates_earned')
  int get certificatesEarned => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_points')
  int get totalPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_login_at')
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
    ProfileModel value,
    $Res Function(ProfileModel) then,
  ) = _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call({
    String id,
    String email,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? phone,
    String? bio,
    UserRole role,
    @JsonKey(name: 'email_verified') bool emailVerified,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
    String? address,
    String? city,
    String? province,
    @JsonKey(name: 'postal_code') String? postalCode,
    String? country,
    @JsonKey(name: 'preferred_language') String preferredLanguage,
    @JsonKey(name: 'notifications_enabled') bool notificationsEnabled,
    @JsonKey(name: 'email_notifications_enabled')
    bool emailNotificationsEnabled,
    @JsonKey(name: 'total_enrollments') int totalEnrollments,
    @JsonKey(name: 'completed_courses') int completedCourses,
    @JsonKey(name: 'certificates_earned') int certificatesEarned,
    @JsonKey(name: 'total_points') int totalPoints,
    @JsonKey(name: 'last_login_at') DateTime? lastLoginAt,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
    Object? avatarUrl = freezed,
    Object? phone = freezed,
    Object? bio = freezed,
    Object? role = null,
    Object? emailVerified = null,
    Object? isActive = null,
    Object? dateOfBirth = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? province = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
    Object? preferredLanguage = null,
    Object? notificationsEnabled = null,
    Object? emailNotificationsEnabled = null,
    Object? totalEnrollments = null,
    Object? completedCourses = null,
    Object? certificatesEarned = null,
    Object? totalPoints = null,
    Object? lastLoginAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            fullName:
                null == fullName
                    ? _value.fullName
                    : fullName // ignore: cast_nullable_to_non_nullable
                        as String,
            avatarUrl:
                freezed == avatarUrl
                    ? _value.avatarUrl
                    : avatarUrl // ignore: cast_nullable_to_non_nullable
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
            role:
                null == role
                    ? _value.role
                    : role // ignore: cast_nullable_to_non_nullable
                        as UserRole,
            emailVerified:
                null == emailVerified
                    ? _value.emailVerified
                    : emailVerified // ignore: cast_nullable_to_non_nullable
                        as bool,
            isActive:
                null == isActive
                    ? _value.isActive
                    : isActive // ignore: cast_nullable_to_non_nullable
                        as bool,
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
            preferredLanguage:
                null == preferredLanguage
                    ? _value.preferredLanguage
                    : preferredLanguage // ignore: cast_nullable_to_non_nullable
                        as String,
            notificationsEnabled:
                null == notificationsEnabled
                    ? _value.notificationsEnabled
                    : notificationsEnabled // ignore: cast_nullable_to_non_nullable
                        as bool,
            emailNotificationsEnabled:
                null == emailNotificationsEnabled
                    ? _value.emailNotificationsEnabled
                    : emailNotificationsEnabled // ignore: cast_nullable_to_non_nullable
                        as bool,
            totalEnrollments:
                null == totalEnrollments
                    ? _value.totalEnrollments
                    : totalEnrollments // ignore: cast_nullable_to_non_nullable
                        as int,
            completedCourses:
                null == completedCourses
                    ? _value.completedCourses
                    : completedCourses // ignore: cast_nullable_to_non_nullable
                        as int,
            certificatesEarned:
                null == certificatesEarned
                    ? _value.certificatesEarned
                    : certificatesEarned // ignore: cast_nullable_to_non_nullable
                        as int,
            totalPoints:
                null == totalPoints
                    ? _value.totalPoints
                    : totalPoints // ignore: cast_nullable_to_non_nullable
                        as int,
            lastLoginAt:
                freezed == lastLoginAt
                    ? _value.lastLoginAt
                    : lastLoginAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
    _$ProfileModelImpl value,
    $Res Function(_$ProfileModelImpl) then,
  ) = __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String email,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? phone,
    String? bio,
    UserRole role,
    @JsonKey(name: 'email_verified') bool emailVerified,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
    String? address,
    String? city,
    String? province,
    @JsonKey(name: 'postal_code') String? postalCode,
    String? country,
    @JsonKey(name: 'preferred_language') String preferredLanguage,
    @JsonKey(name: 'notifications_enabled') bool notificationsEnabled,
    @JsonKey(name: 'email_notifications_enabled')
    bool emailNotificationsEnabled,
    @JsonKey(name: 'total_enrollments') int totalEnrollments,
    @JsonKey(name: 'completed_courses') int completedCourses,
    @JsonKey(name: 'certificates_earned') int certificatesEarned,
    @JsonKey(name: 'total_points') int totalPoints,
    @JsonKey(name: 'last_login_at') DateTime? lastLoginAt,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
    _$ProfileModelImpl _value,
    $Res Function(_$ProfileModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
    Object? avatarUrl = freezed,
    Object? phone = freezed,
    Object? bio = freezed,
    Object? role = null,
    Object? emailVerified = null,
    Object? isActive = null,
    Object? dateOfBirth = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? province = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
    Object? preferredLanguage = null,
    Object? notificationsEnabled = null,
    Object? emailNotificationsEnabled = null,
    Object? totalEnrollments = null,
    Object? completedCourses = null,
    Object? certificatesEarned = null,
    Object? totalPoints = null,
    Object? lastLoginAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$ProfileModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        fullName:
            null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                    as String,
        avatarUrl:
            freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
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
        role:
            null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                    as UserRole,
        emailVerified:
            null == emailVerified
                ? _value.emailVerified
                : emailVerified // ignore: cast_nullable_to_non_nullable
                    as bool,
        isActive:
            null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                    as bool,
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
        preferredLanguage:
            null == preferredLanguage
                ? _value.preferredLanguage
                : preferredLanguage // ignore: cast_nullable_to_non_nullable
                    as String,
        notificationsEnabled:
            null == notificationsEnabled
                ? _value.notificationsEnabled
                : notificationsEnabled // ignore: cast_nullable_to_non_nullable
                    as bool,
        emailNotificationsEnabled:
            null == emailNotificationsEnabled
                ? _value.emailNotificationsEnabled
                : emailNotificationsEnabled // ignore: cast_nullable_to_non_nullable
                    as bool,
        totalEnrollments:
            null == totalEnrollments
                ? _value.totalEnrollments
                : totalEnrollments // ignore: cast_nullable_to_non_nullable
                    as int,
        completedCourses:
            null == completedCourses
                ? _value.completedCourses
                : completedCourses // ignore: cast_nullable_to_non_nullable
                    as int,
        certificatesEarned:
            null == certificatesEarned
                ? _value.certificatesEarned
                : certificatesEarned // ignore: cast_nullable_to_non_nullable
                    as int,
        totalPoints:
            null == totalPoints
                ? _value.totalPoints
                : totalPoints // ignore: cast_nullable_to_non_nullable
                    as int,
        lastLoginAt:
            freezed == lastLoginAt
                ? _value.lastLoginAt
                : lastLoginAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileModelImpl extends _ProfileModel {
  const _$ProfileModelImpl({
    required this.id,
    required this.email,
    @JsonKey(name: 'full_name') required this.fullName,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
    this.phone,
    this.bio,
    required this.role,
    @JsonKey(name: 'email_verified') this.emailVerified = false,
    @JsonKey(name: 'is_active') this.isActive = true,
    @JsonKey(name: 'date_of_birth') this.dateOfBirth,
    this.address,
    this.city,
    this.province,
    @JsonKey(name: 'postal_code') this.postalCode,
    this.country,
    @JsonKey(name: 'preferred_language') this.preferredLanguage = 'fr',
    @JsonKey(name: 'notifications_enabled') this.notificationsEnabled = false,
    @JsonKey(name: 'email_notifications_enabled')
    this.emailNotificationsEnabled = false,
    @JsonKey(name: 'total_enrollments') this.totalEnrollments = 0,
    @JsonKey(name: 'completed_courses') this.completedCourses = 0,
    @JsonKey(name: 'certificates_earned') this.certificatesEarned = 0,
    @JsonKey(name: 'total_points') this.totalPoints = 0,
    @JsonKey(name: 'last_login_at') this.lastLoginAt,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  }) : super._();

  factory _$ProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  final String? phone;
  @override
  final String? bio;
  @override
  final UserRole role;
  @override
  @JsonKey(name: 'email_verified')
  final bool emailVerified;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'date_of_birth')
  final DateTime? dateOfBirth;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? province;
  @override
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @override
  final String? country;
  @override
  @JsonKey(name: 'preferred_language')
  final String preferredLanguage;
  @override
  @JsonKey(name: 'notifications_enabled')
  final bool notificationsEnabled;
  @override
  @JsonKey(name: 'email_notifications_enabled')
  final bool emailNotificationsEnabled;
  @override
  @JsonKey(name: 'total_enrollments')
  final int totalEnrollments;
  @override
  @JsonKey(name: 'completed_courses')
  final int completedCourses;
  @override
  @JsonKey(name: 'certificates_earned')
  final int certificatesEarned;
  @override
  @JsonKey(name: 'total_points')
  final int totalPoints;
  @override
  @JsonKey(name: 'last_login_at')
  final DateTime? lastLoginAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ProfileModel(id: $id, email: $email, fullName: $fullName, avatarUrl: $avatarUrl, phone: $phone, bio: $bio, role: $role, emailVerified: $emailVerified, isActive: $isActive, dateOfBirth: $dateOfBirth, address: $address, city: $city, province: $province, postalCode: $postalCode, country: $country, preferredLanguage: $preferredLanguage, notificationsEnabled: $notificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, totalEnrollments: $totalEnrollments, completedCourses: $completedCourses, certificatesEarned: $certificatesEarned, totalPoints: $totalPoints, lastLoginAt: $lastLoginAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.preferredLanguage, preferredLanguage) ||
                other.preferredLanguage == preferredLanguage) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(
                  other.emailNotificationsEnabled,
                  emailNotificationsEnabled,
                ) ||
                other.emailNotificationsEnabled == emailNotificationsEnabled) &&
            (identical(other.totalEnrollments, totalEnrollments) ||
                other.totalEnrollments == totalEnrollments) &&
            (identical(other.completedCourses, completedCourses) ||
                other.completedCourses == completedCourses) &&
            (identical(other.certificatesEarned, certificatesEarned) ||
                other.certificatesEarned == certificatesEarned) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    email,
    fullName,
    avatarUrl,
    phone,
    bio,
    role,
    emailVerified,
    isActive,
    dateOfBirth,
    address,
    city,
    province,
    postalCode,
    country,
    preferredLanguage,
    notificationsEnabled,
    emailNotificationsEnabled,
    totalEnrollments,
    completedCourses,
    certificatesEarned,
    totalPoints,
    lastLoginAt,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelImplToJson(this);
  }
}

abstract class _ProfileModel extends ProfileModel {
  const factory _ProfileModel({
    required final String id,
    required final String email,
    @JsonKey(name: 'full_name') required final String fullName,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    final String? phone,
    final String? bio,
    required final UserRole role,
    @JsonKey(name: 'email_verified') final bool emailVerified,
    @JsonKey(name: 'is_active') final bool isActive,
    @JsonKey(name: 'date_of_birth') final DateTime? dateOfBirth,
    final String? address,
    final String? city,
    final String? province,
    @JsonKey(name: 'postal_code') final String? postalCode,
    final String? country,
    @JsonKey(name: 'preferred_language') final String preferredLanguage,
    @JsonKey(name: 'notifications_enabled') final bool notificationsEnabled,
    @JsonKey(name: 'email_notifications_enabled')
    final bool emailNotificationsEnabled,
    @JsonKey(name: 'total_enrollments') final int totalEnrollments,
    @JsonKey(name: 'completed_courses') final int completedCourses,
    @JsonKey(name: 'certificates_earned') final int certificatesEarned,
    @JsonKey(name: 'total_points') final int totalPoints,
    @JsonKey(name: 'last_login_at') final DateTime? lastLoginAt,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$ProfileModelImpl;
  const _ProfileModel._() : super._();

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$ProfileModelImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  String? get phone;
  @override
  String? get bio;
  @override
  UserRole get role;
  @override
  @JsonKey(name: 'email_verified')
  bool get emailVerified;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'date_of_birth')
  DateTime? get dateOfBirth;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get province;
  @override
  @JsonKey(name: 'postal_code')
  String? get postalCode;
  @override
  String? get country;
  @override
  @JsonKey(name: 'preferred_language')
  String get preferredLanguage;
  @override
  @JsonKey(name: 'notifications_enabled')
  bool get notificationsEnabled;
  @override
  @JsonKey(name: 'email_notifications_enabled')
  bool get emailNotificationsEnabled;
  @override
  @JsonKey(name: 'total_enrollments')
  int get totalEnrollments;
  @override
  @JsonKey(name: 'completed_courses')
  int get completedCourses;
  @override
  @JsonKey(name: 'certificates_earned')
  int get certificatesEarned;
  @override
  @JsonKey(name: 'total_points')
  int get totalPoints;
  @override
  @JsonKey(name: 'last_login_at')
  DateTime? get lastLoginAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
