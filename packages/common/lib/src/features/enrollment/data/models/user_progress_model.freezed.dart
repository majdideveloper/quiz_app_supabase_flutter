// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserProgressModel _$UserProgressModelFromJson(Map<String, dynamic> json) {
  return _UserProgressModel.fromJson(json);
}

/// @nodoc
mixin _$UserProgressModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id')
  String get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_id')
  String get lessonId => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_spent')
  int get timeSpent => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_accessed_at')
  DateTime? get lastAccessedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'video_progress')
  int get videoProgress => throw _privateConstructorUsedError;
  @JsonKey(name: 'video_completed')
  bool get videoCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserProgressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProgressModelCopyWith<UserProgressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProgressModelCopyWith<$Res> {
  factory $UserProgressModelCopyWith(
    UserProgressModel value,
    $Res Function(UserProgressModel) then,
  ) = _$UserProgressModelCopyWithImpl<$Res, UserProgressModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'enrollment_id') String enrollmentId,
    @JsonKey(name: 'lesson_id') String lessonId,
    bool completed,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'time_spent') int timeSpent,
    @JsonKey(name: 'last_accessed_at') DateTime? lastAccessedAt,
    @JsonKey(name: 'video_progress') int videoProgress,
    @JsonKey(name: 'video_completed') bool videoCompleted,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$UserProgressModelCopyWithImpl<$Res, $Val extends UserProgressModel>
    implements $UserProgressModelCopyWith<$Res> {
  _$UserProgressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? enrollmentId = null,
    Object? lessonId = null,
    Object? completed = null,
    Object? completedAt = freezed,
    Object? timeSpent = null,
    Object? lastAccessedAt = freezed,
    Object? videoProgress = null,
    Object? videoCompleted = null,
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
            enrollmentId:
                null == enrollmentId
                    ? _value.enrollmentId
                    : enrollmentId // ignore: cast_nullable_to_non_nullable
                        as String,
            lessonId:
                null == lessonId
                    ? _value.lessonId
                    : lessonId // ignore: cast_nullable_to_non_nullable
                        as String,
            completed:
                null == completed
                    ? _value.completed
                    : completed // ignore: cast_nullable_to_non_nullable
                        as bool,
            completedAt:
                freezed == completedAt
                    ? _value.completedAt
                    : completedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
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
            videoProgress:
                null == videoProgress
                    ? _value.videoProgress
                    : videoProgress // ignore: cast_nullable_to_non_nullable
                        as int,
            videoCompleted:
                null == videoCompleted
                    ? _value.videoCompleted
                    : videoCompleted // ignore: cast_nullable_to_non_nullable
                        as bool,
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
abstract class _$$UserProgressModelImplCopyWith<$Res>
    implements $UserProgressModelCopyWith<$Res> {
  factory _$$UserProgressModelImplCopyWith(
    _$UserProgressModelImpl value,
    $Res Function(_$UserProgressModelImpl) then,
  ) = __$$UserProgressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'enrollment_id') String enrollmentId,
    @JsonKey(name: 'lesson_id') String lessonId,
    bool completed,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'time_spent') int timeSpent,
    @JsonKey(name: 'last_accessed_at') DateTime? lastAccessedAt,
    @JsonKey(name: 'video_progress') int videoProgress,
    @JsonKey(name: 'video_completed') bool videoCompleted,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$UserProgressModelImplCopyWithImpl<$Res>
    extends _$UserProgressModelCopyWithImpl<$Res, _$UserProgressModelImpl>
    implements _$$UserProgressModelImplCopyWith<$Res> {
  __$$UserProgressModelImplCopyWithImpl(
    _$UserProgressModelImpl _value,
    $Res Function(_$UserProgressModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? enrollmentId = null,
    Object? lessonId = null,
    Object? completed = null,
    Object? completedAt = freezed,
    Object? timeSpent = null,
    Object? lastAccessedAt = freezed,
    Object? videoProgress = null,
    Object? videoCompleted = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$UserProgressModelImpl(
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
        enrollmentId:
            null == enrollmentId
                ? _value.enrollmentId
                : enrollmentId // ignore: cast_nullable_to_non_nullable
                    as String,
        lessonId:
            null == lessonId
                ? _value.lessonId
                : lessonId // ignore: cast_nullable_to_non_nullable
                    as String,
        completed:
            null == completed
                ? _value.completed
                : completed // ignore: cast_nullable_to_non_nullable
                    as bool,
        completedAt:
            freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
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
        videoProgress:
            null == videoProgress
                ? _value.videoProgress
                : videoProgress // ignore: cast_nullable_to_non_nullable
                    as int,
        videoCompleted:
            null == videoCompleted
                ? _value.videoCompleted
                : videoCompleted // ignore: cast_nullable_to_non_nullable
                    as bool,
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
class _$UserProgressModelImpl extends _UserProgressModel {
  const _$UserProgressModelImpl({
    required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'enrollment_id') required this.enrollmentId,
    @JsonKey(name: 'lesson_id') required this.lessonId,
    required this.completed,
    @JsonKey(name: 'completed_at') this.completedAt,
    @JsonKey(name: 'time_spent') this.timeSpent = 0,
    @JsonKey(name: 'last_accessed_at') this.lastAccessedAt,
    @JsonKey(name: 'video_progress') this.videoProgress = 0,
    @JsonKey(name: 'video_completed') this.videoCompleted = false,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  }) : super._();

  factory _$UserProgressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProgressModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'enrollment_id')
  final String enrollmentId;
  @override
  @JsonKey(name: 'lesson_id')
  final String lessonId;
  @override
  final bool completed;
  @override
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;
  @override
  @JsonKey(name: 'time_spent')
  final int timeSpent;
  @override
  @JsonKey(name: 'last_accessed_at')
  final DateTime? lastAccessedAt;
  @override
  @JsonKey(name: 'video_progress')
  final int videoProgress;
  @override
  @JsonKey(name: 'video_completed')
  final bool videoCompleted;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserProgressModel(id: $id, userId: $userId, enrollmentId: $enrollmentId, lessonId: $lessonId, completed: $completed, completedAt: $completedAt, timeSpent: $timeSpent, lastAccessedAt: $lastAccessedAt, videoProgress: $videoProgress, videoCompleted: $videoCompleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProgressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent) &&
            (identical(other.lastAccessedAt, lastAccessedAt) ||
                other.lastAccessedAt == lastAccessedAt) &&
            (identical(other.videoProgress, videoProgress) ||
                other.videoProgress == videoProgress) &&
            (identical(other.videoCompleted, videoCompleted) ||
                other.videoCompleted == videoCompleted) &&
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
    enrollmentId,
    lessonId,
    completed,
    completedAt,
    timeSpent,
    lastAccessedAt,
    videoProgress,
    videoCompleted,
    createdAt,
    updatedAt,
  );

  /// Create a copy of UserProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProgressModelImplCopyWith<_$UserProgressModelImpl> get copyWith =>
      __$$UserProgressModelImplCopyWithImpl<_$UserProgressModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProgressModelImplToJson(this);
  }
}

abstract class _UserProgressModel extends UserProgressModel {
  const factory _UserProgressModel({
    required final String id,
    @JsonKey(name: 'user_id') required final String userId,
    @JsonKey(name: 'enrollment_id') required final String enrollmentId,
    @JsonKey(name: 'lesson_id') required final String lessonId,
    required final bool completed,
    @JsonKey(name: 'completed_at') final DateTime? completedAt,
    @JsonKey(name: 'time_spent') final int timeSpent,
    @JsonKey(name: 'last_accessed_at') final DateTime? lastAccessedAt,
    @JsonKey(name: 'video_progress') final int videoProgress,
    @JsonKey(name: 'video_completed') final bool videoCompleted,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$UserProgressModelImpl;
  const _UserProgressModel._() : super._();

  factory _UserProgressModel.fromJson(Map<String, dynamic> json) =
      _$UserProgressModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'enrollment_id')
  String get enrollmentId;
  @override
  @JsonKey(name: 'lesson_id')
  String get lessonId;
  @override
  bool get completed;
  @override
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt;
  @override
  @JsonKey(name: 'time_spent')
  int get timeSpent;
  @override
  @JsonKey(name: 'last_accessed_at')
  DateTime? get lastAccessedAt;
  @override
  @JsonKey(name: 'video_progress')
  int get videoProgress;
  @override
  @JsonKey(name: 'video_completed')
  bool get videoCompleted;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of UserProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProgressModelImplCopyWith<_$UserProgressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
