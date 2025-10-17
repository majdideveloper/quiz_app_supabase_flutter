// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enrollment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EnrollmentModel _$EnrollmentModelFromJson(Map<String, dynamic> json) {
  return _EnrollmentModel.fromJson(json);
}

/// @nodoc
mixin _$EnrollmentModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_id')
  String get courseId => throw _privateConstructorUsedError;
  EnrollmentStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrolled_at')
  DateTime get enrolledAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'dropped_at')
  DateTime? get droppedAt => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_lessons')
  int get completedLessons => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_lessons')
  int get totalLessons => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_spent')
  int get timeSpent => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_accessed_at')
  DateTime? get lastAccessedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this EnrollmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnrollmentModelCopyWith<EnrollmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollmentModelCopyWith<$Res> {
  factory $EnrollmentModelCopyWith(
    EnrollmentModel value,
    $Res Function(EnrollmentModel) then,
  ) = _$EnrollmentModelCopyWithImpl<$Res, EnrollmentModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'course_id') String courseId,
    EnrollmentStatus status,
    @JsonKey(name: 'enrolled_at') DateTime enrolledAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'dropped_at') DateTime? droppedAt,
    int progress,
    @JsonKey(name: 'completed_lessons') int completedLessons,
    @JsonKey(name: 'total_lessons') int totalLessons,
    @JsonKey(name: 'time_spent') int timeSpent,
    @JsonKey(name: 'last_accessed_at') DateTime? lastAccessedAt,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$EnrollmentModelCopyWithImpl<$Res, $Val extends EnrollmentModel>
    implements $EnrollmentModelCopyWith<$Res> {
  _$EnrollmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnrollmentModel
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
abstract class _$$EnrollmentModelImplCopyWith<$Res>
    implements $EnrollmentModelCopyWith<$Res> {
  factory _$$EnrollmentModelImplCopyWith(
    _$EnrollmentModelImpl value,
    $Res Function(_$EnrollmentModelImpl) then,
  ) = __$$EnrollmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'course_id') String courseId,
    EnrollmentStatus status,
    @JsonKey(name: 'enrolled_at') DateTime enrolledAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'dropped_at') DateTime? droppedAt,
    int progress,
    @JsonKey(name: 'completed_lessons') int completedLessons,
    @JsonKey(name: 'total_lessons') int totalLessons,
    @JsonKey(name: 'time_spent') int timeSpent,
    @JsonKey(name: 'last_accessed_at') DateTime? lastAccessedAt,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$EnrollmentModelImplCopyWithImpl<$Res>
    extends _$EnrollmentModelCopyWithImpl<$Res, _$EnrollmentModelImpl>
    implements _$$EnrollmentModelImplCopyWith<$Res> {
  __$$EnrollmentModelImplCopyWithImpl(
    _$EnrollmentModelImpl _value,
    $Res Function(_$EnrollmentModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EnrollmentModel
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
      _$EnrollmentModelImpl(
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
@JsonSerializable()
class _$EnrollmentModelImpl extends _EnrollmentModel {
  const _$EnrollmentModelImpl({
    required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'course_id') required this.courseId,
    required this.status,
    @JsonKey(name: 'enrolled_at') required this.enrolledAt,
    @JsonKey(name: 'completed_at') this.completedAt,
    @JsonKey(name: 'dropped_at') this.droppedAt,
    this.progress = 0,
    @JsonKey(name: 'completed_lessons') this.completedLessons = 0,
    @JsonKey(name: 'total_lessons') required this.totalLessons,
    @JsonKey(name: 'time_spent') this.timeSpent = 0,
    @JsonKey(name: 'last_accessed_at') this.lastAccessedAt,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  }) : super._();

  factory _$EnrollmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrollmentModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'course_id')
  final String courseId;
  @override
  final EnrollmentStatus status;
  @override
  @JsonKey(name: 'enrolled_at')
  final DateTime enrolledAt;
  @override
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;
  @override
  @JsonKey(name: 'dropped_at')
  final DateTime? droppedAt;
  @override
  @JsonKey()
  final int progress;
  @override
  @JsonKey(name: 'completed_lessons')
  final int completedLessons;
  @override
  @JsonKey(name: 'total_lessons')
  final int totalLessons;
  @override
  @JsonKey(name: 'time_spent')
  final int timeSpent;
  @override
  @JsonKey(name: 'last_accessed_at')
  final DateTime? lastAccessedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'EnrollmentModel(id: $id, userId: $userId, courseId: $courseId, status: $status, enrolledAt: $enrolledAt, completedAt: $completedAt, droppedAt: $droppedAt, progress: $progress, completedLessons: $completedLessons, totalLessons: $totalLessons, timeSpent: $timeSpent, lastAccessedAt: $lastAccessedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollmentModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of EnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollmentModelImplCopyWith<_$EnrollmentModelImpl> get copyWith =>
      __$$EnrollmentModelImplCopyWithImpl<_$EnrollmentModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EnrollmentModelImplToJson(this);
  }
}

abstract class _EnrollmentModel extends EnrollmentModel {
  const factory _EnrollmentModel({
    required final String id,
    @JsonKey(name: 'user_id') required final String userId,
    @JsonKey(name: 'course_id') required final String courseId,
    required final EnrollmentStatus status,
    @JsonKey(name: 'enrolled_at') required final DateTime enrolledAt,
    @JsonKey(name: 'completed_at') final DateTime? completedAt,
    @JsonKey(name: 'dropped_at') final DateTime? droppedAt,
    final int progress,
    @JsonKey(name: 'completed_lessons') final int completedLessons,
    @JsonKey(name: 'total_lessons') required final int totalLessons,
    @JsonKey(name: 'time_spent') final int timeSpent,
    @JsonKey(name: 'last_accessed_at') final DateTime? lastAccessedAt,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$EnrollmentModelImpl;
  const _EnrollmentModel._() : super._();

  factory _EnrollmentModel.fromJson(Map<String, dynamic> json) =
      _$EnrollmentModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'course_id')
  String get courseId;
  @override
  EnrollmentStatus get status;
  @override
  @JsonKey(name: 'enrolled_at')
  DateTime get enrolledAt;
  @override
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt;
  @override
  @JsonKey(name: 'dropped_at')
  DateTime? get droppedAt;
  @override
  int get progress;
  @override
  @JsonKey(name: 'completed_lessons')
  int get completedLessons;
  @override
  @JsonKey(name: 'total_lessons')
  int get totalLessons;
  @override
  @JsonKey(name: 'time_spent')
  int get timeSpent;
  @override
  @JsonKey(name: 'last_accessed_at')
  DateTime? get lastAccessedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of EnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrollmentModelImplCopyWith<_$EnrollmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
