// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LessonEntity {
  String get id => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  String? get videoThumbnailUrl => throw _privateConstructorUsedError;
  int? get videoDuration => throw _privateConstructorUsedError;
  int get orderIndex => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  List<String> get resources => throw _privateConstructorUsedError;
  bool get isPreview => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of LessonEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonEntityCopyWith<LessonEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonEntityCopyWith<$Res> {
  factory $LessonEntityCopyWith(
    LessonEntity value,
    $Res Function(LessonEntity) then,
  ) = _$LessonEntityCopyWithImpl<$Res, LessonEntity>;
  @useResult
  $Res call({
    String id,
    String courseId,
    String title,
    String description,
    String content,
    String? videoUrl,
    String? videoThumbnailUrl,
    int? videoDuration,
    int orderIndex,
    int duration,
    List<String> resources,
    bool isPreview,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$LessonEntityCopyWithImpl<$Res, $Val extends LessonEntity>
    implements $LessonEntityCopyWith<$Res> {
  _$LessonEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? title = null,
    Object? description = null,
    Object? content = null,
    Object? videoUrl = freezed,
    Object? videoThumbnailUrl = freezed,
    Object? videoDuration = freezed,
    Object? orderIndex = null,
    Object? duration = null,
    Object? resources = null,
    Object? isPreview = null,
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
            courseId:
                null == courseId
                    ? _value.courseId
                    : courseId // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
            videoUrl:
                freezed == videoUrl
                    ? _value.videoUrl
                    : videoUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            videoThumbnailUrl:
                freezed == videoThumbnailUrl
                    ? _value.videoThumbnailUrl
                    : videoThumbnailUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            videoDuration:
                freezed == videoDuration
                    ? _value.videoDuration
                    : videoDuration // ignore: cast_nullable_to_non_nullable
                        as int?,
            orderIndex:
                null == orderIndex
                    ? _value.orderIndex
                    : orderIndex // ignore: cast_nullable_to_non_nullable
                        as int,
            duration:
                null == duration
                    ? _value.duration
                    : duration // ignore: cast_nullable_to_non_nullable
                        as int,
            resources:
                null == resources
                    ? _value.resources
                    : resources // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            isPreview:
                null == isPreview
                    ? _value.isPreview
                    : isPreview // ignore: cast_nullable_to_non_nullable
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
abstract class _$$LessonEntityImplCopyWith<$Res>
    implements $LessonEntityCopyWith<$Res> {
  factory _$$LessonEntityImplCopyWith(
    _$LessonEntityImpl value,
    $Res Function(_$LessonEntityImpl) then,
  ) = __$$LessonEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String courseId,
    String title,
    String description,
    String content,
    String? videoUrl,
    String? videoThumbnailUrl,
    int? videoDuration,
    int orderIndex,
    int duration,
    List<String> resources,
    bool isPreview,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$LessonEntityImplCopyWithImpl<$Res>
    extends _$LessonEntityCopyWithImpl<$Res, _$LessonEntityImpl>
    implements _$$LessonEntityImplCopyWith<$Res> {
  __$$LessonEntityImplCopyWithImpl(
    _$LessonEntityImpl _value,
    $Res Function(_$LessonEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LessonEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? title = null,
    Object? description = null,
    Object? content = null,
    Object? videoUrl = freezed,
    Object? videoThumbnailUrl = freezed,
    Object? videoDuration = freezed,
    Object? orderIndex = null,
    Object? duration = null,
    Object? resources = null,
    Object? isPreview = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$LessonEntityImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        courseId:
            null == courseId
                ? _value.courseId
                : courseId // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
        videoUrl:
            freezed == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        videoThumbnailUrl:
            freezed == videoThumbnailUrl
                ? _value.videoThumbnailUrl
                : videoThumbnailUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        videoDuration:
            freezed == videoDuration
                ? _value.videoDuration
                : videoDuration // ignore: cast_nullable_to_non_nullable
                    as int?,
        orderIndex:
            null == orderIndex
                ? _value.orderIndex
                : orderIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        duration:
            null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                    as int,
        resources:
            null == resources
                ? _value._resources
                : resources // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        isPreview:
            null == isPreview
                ? _value.isPreview
                : isPreview // ignore: cast_nullable_to_non_nullable
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

class _$LessonEntityImpl extends _LessonEntity {
  const _$LessonEntityImpl({
    required this.id,
    required this.courseId,
    required this.title,
    required this.description,
    required this.content,
    this.videoUrl,
    this.videoThumbnailUrl,
    this.videoDuration,
    required this.orderIndex,
    required this.duration,
    final List<String> resources = const [],
    this.isPreview = false,
    required this.createdAt,
    required this.updatedAt,
  }) : _resources = resources,
       super._();

  @override
  final String id;
  @override
  final String courseId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String content;
  @override
  final String? videoUrl;
  @override
  final String? videoThumbnailUrl;
  @override
  final int? videoDuration;
  @override
  final int orderIndex;
  @override
  final int duration;
  final List<String> _resources;
  @override
  @JsonKey()
  List<String> get resources {
    if (_resources is EqualUnmodifiableListView) return _resources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resources);
  }

  @override
  @JsonKey()
  final bool isPreview;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'LessonEntity(id: $id, courseId: $courseId, title: $title, description: $description, content: $content, videoUrl: $videoUrl, videoThumbnailUrl: $videoThumbnailUrl, videoDuration: $videoDuration, orderIndex: $orderIndex, duration: $duration, resources: $resources, isPreview: $isPreview, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.videoThumbnailUrl, videoThumbnailUrl) ||
                other.videoThumbnailUrl == videoThumbnailUrl) &&
            (identical(other.videoDuration, videoDuration) ||
                other.videoDuration == videoDuration) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(
              other._resources,
              _resources,
            ) &&
            (identical(other.isPreview, isPreview) ||
                other.isPreview == isPreview) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    courseId,
    title,
    description,
    content,
    videoUrl,
    videoThumbnailUrl,
    videoDuration,
    orderIndex,
    duration,
    const DeepCollectionEquality().hash(_resources),
    isPreview,
    createdAt,
    updatedAt,
  );

  /// Create a copy of LessonEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonEntityImplCopyWith<_$LessonEntityImpl> get copyWith =>
      __$$LessonEntityImplCopyWithImpl<_$LessonEntityImpl>(this, _$identity);
}

abstract class _LessonEntity extends LessonEntity {
  const factory _LessonEntity({
    required final String id,
    required final String courseId,
    required final String title,
    required final String description,
    required final String content,
    final String? videoUrl,
    final String? videoThumbnailUrl,
    final int? videoDuration,
    required final int orderIndex,
    required final int duration,
    final List<String> resources,
    final bool isPreview,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$LessonEntityImpl;
  const _LessonEntity._() : super._();

  @override
  String get id;
  @override
  String get courseId;
  @override
  String get title;
  @override
  String get description;
  @override
  String get content;
  @override
  String? get videoUrl;
  @override
  String? get videoThumbnailUrl;
  @override
  int? get videoDuration;
  @override
  int get orderIndex;
  @override
  int get duration;
  @override
  List<String> get resources;
  @override
  bool get isPreview;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of LessonEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonEntityImplCopyWith<_$LessonEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
