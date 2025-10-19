// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LessonModel _$LessonModelFromJson(Map<String, dynamic> json) {
  return _LessonModel.fromJson(json);
}

/// @nodoc
mixin _$LessonModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_id')
  String get courseId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'video_url')
  String? get videoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'video_thumbnail_url')
  String? get videoThumbnailUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'video_duration')
  int? get videoDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_index')
  int get orderIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  int? get duration => throw _privateConstructorUsedError;
  List<String> get resources => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_preview')
  bool get isPreview => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this LessonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonModelCopyWith<LessonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonModelCopyWith<$Res> {
  factory $LessonModelCopyWith(
    LessonModel value,
    $Res Function(LessonModel) then,
  ) = _$LessonModelCopyWithImpl<$Res, LessonModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'course_id') String courseId,
    String title,
    String description,
    String content,
    @JsonKey(name: 'video_url') String? videoUrl,
    @JsonKey(name: 'video_thumbnail_url') String? videoThumbnailUrl,
    @JsonKey(name: 'video_duration') int? videoDuration,
    @JsonKey(name: 'order_index') int orderIndex,
    @JsonKey(name: 'duration_minutes') int? duration,
    List<String> resources,
    @JsonKey(name: 'is_preview') bool isPreview,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class _$LessonModelCopyWithImpl<$Res, $Val extends LessonModel>
    implements $LessonModelCopyWith<$Res> {
  _$LessonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonModel
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
    Object? duration = freezed,
    Object? resources = null,
    Object? isPreview = null,
    Object? createdAt = null,
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
                freezed == duration
                    ? _value.duration
                    : duration // ignore: cast_nullable_to_non_nullable
                        as int?,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LessonModelImplCopyWith<$Res>
    implements $LessonModelCopyWith<$Res> {
  factory _$$LessonModelImplCopyWith(
    _$LessonModelImpl value,
    $Res Function(_$LessonModelImpl) then,
  ) = __$$LessonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'course_id') String courseId,
    String title,
    String description,
    String content,
    @JsonKey(name: 'video_url') String? videoUrl,
    @JsonKey(name: 'video_thumbnail_url') String? videoThumbnailUrl,
    @JsonKey(name: 'video_duration') int? videoDuration,
    @JsonKey(name: 'order_index') int orderIndex,
    @JsonKey(name: 'duration_minutes') int? duration,
    List<String> resources,
    @JsonKey(name: 'is_preview') bool isPreview,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class __$$LessonModelImplCopyWithImpl<$Res>
    extends _$LessonModelCopyWithImpl<$Res, _$LessonModelImpl>
    implements _$$LessonModelImplCopyWith<$Res> {
  __$$LessonModelImplCopyWithImpl(
    _$LessonModelImpl _value,
    $Res Function(_$LessonModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LessonModel
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
    Object? duration = freezed,
    Object? resources = null,
    Object? isPreview = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$LessonModelImpl(
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
            freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                    as int?,
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonModelImpl extends _LessonModel {
  const _$LessonModelImpl({
    required this.id,
    @JsonKey(name: 'course_id') required this.courseId,
    required this.title,
    required this.description,
    this.content = '',
    @JsonKey(name: 'video_url') this.videoUrl,
    @JsonKey(name: 'video_thumbnail_url') this.videoThumbnailUrl,
    @JsonKey(name: 'video_duration') this.videoDuration,
    @JsonKey(name: 'order_index') required this.orderIndex,
    @JsonKey(name: 'duration_minutes') this.duration,
    final List<String> resources = const [],
    @JsonKey(name: 'is_preview') this.isPreview = false,
    @JsonKey(name: 'created_at') required this.createdAt,
  }) : _resources = resources,
       super._();

  factory _$LessonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'course_id')
  final String courseId;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey(name: 'video_url')
  final String? videoUrl;
  @override
  @JsonKey(name: 'video_thumbnail_url')
  final String? videoThumbnailUrl;
  @override
  @JsonKey(name: 'video_duration')
  final int? videoDuration;
  @override
  @JsonKey(name: 'order_index')
  final int orderIndex;
  @override
  @JsonKey(name: 'duration_minutes')
  final int? duration;
  final List<String> _resources;
  @override
  @JsonKey()
  List<String> get resources {
    if (_resources is EqualUnmodifiableListView) return _resources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resources);
  }

  @override
  @JsonKey(name: 'is_preview')
  final bool isPreview;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'LessonModel(id: $id, courseId: $courseId, title: $title, description: $description, content: $content, videoUrl: $videoUrl, videoThumbnailUrl: $videoThumbnailUrl, videoDuration: $videoDuration, orderIndex: $orderIndex, duration: $duration, resources: $resources, isPreview: $isPreview, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonModelImpl &&
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
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
  );

  /// Create a copy of LessonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonModelImplCopyWith<_$LessonModelImpl> get copyWith =>
      __$$LessonModelImplCopyWithImpl<_$LessonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonModelImplToJson(this);
  }
}

abstract class _LessonModel extends LessonModel {
  const factory _LessonModel({
    required final String id,
    @JsonKey(name: 'course_id') required final String courseId,
    required final String title,
    required final String description,
    final String content,
    @JsonKey(name: 'video_url') final String? videoUrl,
    @JsonKey(name: 'video_thumbnail_url') final String? videoThumbnailUrl,
    @JsonKey(name: 'video_duration') final int? videoDuration,
    @JsonKey(name: 'order_index') required final int orderIndex,
    @JsonKey(name: 'duration_minutes') final int? duration,
    final List<String> resources,
    @JsonKey(name: 'is_preview') final bool isPreview,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
  }) = _$LessonModelImpl;
  const _LessonModel._() : super._();

  factory _LessonModel.fromJson(Map<String, dynamic> json) =
      _$LessonModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'course_id')
  String get courseId;
  @override
  String get title;
  @override
  String get description;
  @override
  String get content;
  @override
  @JsonKey(name: 'video_url')
  String? get videoUrl;
  @override
  @JsonKey(name: 'video_thumbnail_url')
  String? get videoThumbnailUrl;
  @override
  @JsonKey(name: 'video_duration')
  int? get videoDuration;
  @override
  @JsonKey(name: 'order_index')
  int get orderIndex;
  @override
  @JsonKey(name: 'duration_minutes')
  int? get duration;
  @override
  List<String> get resources;
  @override
  @JsonKey(name: 'is_preview')
  bool get isPreview;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of LessonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonModelImplCopyWith<_$LessonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
