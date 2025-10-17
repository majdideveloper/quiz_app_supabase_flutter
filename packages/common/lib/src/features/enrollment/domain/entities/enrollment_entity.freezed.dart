// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enrollment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$EnrollmentEntity {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  EnrollmentStatus get status => throw _privateConstructorUsedError;
  DateTime get enrolledAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime? get droppedAt => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  int get completedLessons => throw _privateConstructorUsedError;
  int get totalLessons => throw _privateConstructorUsedError;
  int get timeSpent => throw _privateConstructorUsedError;
  DateTime? get lastAccessedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of EnrollmentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnrollmentEntityCopyWith<EnrollmentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollmentEntityCopyWith<$Res> {
  factory $EnrollmentEntityCopyWith(
    EnrollmentEntity value,
    $Res Function(EnrollmentEntity) then,
  ) = _$EnrollmentEntityCopyWithImpl<$Res, EnrollmentEntity>;
  @useResult
  $Res call({
    String id,
    String userId,
    String courseId,
    EnrollmentStatus status,
    DateTime enrolledAt,
    DateTime? completedAt,
    DateTime? droppedAt,
    int progress,
    int completedLessons,
    int totalLessons,
    int timeSpent,
    DateTime? lastAccessedAt,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$EnrollmentEntityCopyWithImpl<$Res, $Val extends EnrollmentEntity>
    implements $EnrollmentEntityCopyWith<$Res> {
  _$EnrollmentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnrollmentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? courseId = null,
    Object? status = null,
    Object? enrolledAt = null,
    Object? completedAt = freezed,
    Object? droppedAt = freezed,
    Object? progress = null,
    Object? completedLessons = null,
    Object? totalLessons = null,
    Object? timeSpent = null,
    Object? lastAccessedAt = freezed,
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
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            courseId:
                null == courseId
                    ? _value.courseId
                    : courseId // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as EnrollmentStatus,
            enrolledAt:
                null == enrolledAt
                    ? _value.enrolledAt
                    : enrolledAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            completedAt:
                freezed == completedAt
                    ? _value.completedAt
                    : completedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            droppedAt:
                freezed == droppedAt
                    ? _value.droppedAt
                    : droppedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            progress:
                null == progress
                    ? _value.progress
                    : progress // ignore: cast_nullable_to_non_nullable
                        as int,
            completedLessons:
                null == completedLessons
                    ? _value.completedLessons
                    : completedLessons // ignore: cast_nullable_to_non_nullable
                        as int,
            totalLessons:
                null == totalLessons
                    ? _value.totalLessons
                    : totalLessons // ignore: cast_nullable_to_non_nullable
                        as int,
            timeSpent:
                null == timeSpent
                    ? _value.timeSpent
                    : timeSpent // ignore: cast_nullable_to_non_nullable
                        as int,
            lastAccessedAt:
                freezed == lastAccessedAt
                    ? _value.lastAccessedAt
                    : lastAccessedAt // ignore: cast_nullable_to_non_nullable
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
abstract class _$$EnrollmentEntityImplCopyWith<$Res>
    implements $EnrollmentEntityCopyWith<$Res> {
  factory _$$EnrollmentEntityImplCopyWith(
    _$EnrollmentEntityImpl value,
    $Res Function(_$EnrollmentEntityImpl) then,
  ) = __$$EnrollmentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String courseId,
    EnrollmentStatus status,
    DateTime enrolledAt,
    DateTime? completedAt,
    DateTime? droppedAt,
    int progress,
    int completedLessons,
    int totalLessons,
    int timeSpent,
    DateTime? lastAccessedAt,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$EnrollmentEntityImplCopyWithImpl<$Res>
    extends _$EnrollmentEntityCopyWithImpl<$Res, _$EnrollmentEntityImpl>
    implements _$$EnrollmentEntityImplCopyWith<$Res> {
  __$$EnrollmentEntityImplCopyWithImpl(
    _$EnrollmentEntityImpl _value,
    $Res Function(_$EnrollmentEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EnrollmentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? courseId = null,
    Object? status = null,
    Object? enrolledAt = null,
    Object? completedAt = freezed,
    Object? droppedAt = freezed,
    Object? progress = null,
    Object? completedLessons = null,
    Object? totalLessons = null,
    Object? timeSpent = null,
    Object? lastAccessedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$EnrollmentEntityImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        courseId:
            null == courseId
                ? _value.courseId
                : courseId // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as EnrollmentStatus,
        enrolledAt:
            null == enrolledAt
                ? _value.enrolledAt
                : enrolledAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        completedAt:
            freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        droppedAt:
            freezed == droppedAt
                ? _value.droppedAt
                : droppedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        progress:
            null == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                    as int,
        completedLessons:
            null == completedLessons
                ? _value.completedLessons
                : completedLessons // ignore: cast_nullable_to_non_nullable
                    as int,
        totalLessons:
            null == totalLessons
                ? _value.totalLessons
                : totalLessons // ignore: cast_nullable_to_non_nullable
                    as int,
        timeSpent:
            null == timeSpent
                ? _value.timeSpent
                : timeSpent // ignore: cast_nullable_to_non_nullable
                    as int,
        lastAccessedAt:
            freezed == lastAccessedAt
                ? _value.lastAccessedAt
                : lastAccessedAt // ignore: cast_nullable_to_non_nullable
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

class _$EnrollmentEntityImpl extends _EnrollmentEntity {
  const _$EnrollmentEntityImpl({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.status,
    required this.enrolledAt,
    this.completedAt,
    this.droppedAt,
    this.progress = 0,
    this.completedLessons = 0,
    required this.totalLessons,
    this.timeSpent = 0,
    this.lastAccessedAt,
    required this.createdAt,
    required this.updatedAt,
  }) : super._();

  @override
  final String id;
  @override
  final String userId;
  @override
  final String courseId;
  @override
  final EnrollmentStatus status;
  @override
  final DateTime enrolledAt;
  @override
  final DateTime? completedAt;
  @override
  final DateTime? droppedAt;
  @override
  @JsonKey()
  final int progress;
  @override
  @JsonKey()
  final int completedLessons;
  @override
  final int totalLessons;
  @override
  @JsonKey()
  final int timeSpent;
  @override
  final DateTime? lastAccessedAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'EnrollmentEntity(id: $id, userId: $userId, courseId: $courseId, status: $status, enrolledAt: $enrolledAt, completedAt: $completedAt, droppedAt: $droppedAt, progress: $progress, completedLessons: $completedLessons, totalLessons: $totalLessons, timeSpent: $timeSpent, lastAccessedAt: $lastAccessedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollmentEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.enrolledAt, enrolledAt) ||
                other.enrolledAt == enrolledAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.droppedAt, droppedAt) ||
                other.droppedAt == droppedAt) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.completedLessons, completedLessons) ||
                other.completedLessons == completedLessons) &&
            (identical(other.totalLessons, totalLessons) ||
                other.totalLessons == totalLessons) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent) &&
            (identical(other.lastAccessedAt, lastAccessedAt) ||
                other.lastAccessedAt == lastAccessedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    courseId,
    status,
    enrolledAt,
    completedAt,
    droppedAt,
    progress,
    completedLessons,
    totalLessons,
    timeSpent,
    lastAccessedAt,
    createdAt,
    updatedAt,
  );

  /// Create a copy of EnrollmentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollmentEntityImplCopyWith<_$EnrollmentEntityImpl> get copyWith =>
      __$$EnrollmentEntityImplCopyWithImpl<_$EnrollmentEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _EnrollmentEntity extends EnrollmentEntity {
  const factory _EnrollmentEntity({
    required final String id,
    required final String userId,
    required final String courseId,
    required final EnrollmentStatus status,
    required final DateTime enrolledAt,
    final DateTime? completedAt,
    final DateTime? droppedAt,
    final int progress,
    final int completedLessons,
    required final int totalLessons,
    final int timeSpent,
    final DateTime? lastAccessedAt,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$EnrollmentEntityImpl;
  const _EnrollmentEntity._() : super._();

  @override
  String get id;
  @override
  String get userId;
  @override
  String get courseId;
  @override
  EnrollmentStatus get status;
  @override
  DateTime get enrolledAt;
  @override
  DateTime? get completedAt;
  @override
  DateTime? get droppedAt;
  @override
  int get progress;
  @override
  int get completedLessons;
  @override
  int get totalLessons;
  @override
  int get timeSpent;
  @override
  DateTime? get lastAccessedAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of EnrollmentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrollmentEntityImplCopyWith<_$EnrollmentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
