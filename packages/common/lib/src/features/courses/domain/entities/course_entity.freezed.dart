// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CourseEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  CourseCategory get category => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String get instructorId => throw _privateConstructorUsedError;
  String get instructorName => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  CourseLevel get level => throw _privateConstructorUsedError;
  bool get isPublished => throw _privateConstructorUsedError;
  int get enrollmentCount => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get ratingCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of CourseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseEntityCopyWith<CourseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseEntityCopyWith<$Res> {
  factory $CourseEntityCopyWith(
    CourseEntity value,
    $Res Function(CourseEntity) then,
  ) = _$CourseEntityCopyWithImpl<$Res, CourseEntity>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    CourseCategory category,
    String? thumbnailUrl,
    String instructorId,
    String instructorName,
    double price,
    int duration,
    CourseLevel level,
    bool isPublished,
    int enrollmentCount,
    double rating,
    int ratingCount,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$CourseEntityCopyWithImpl<$Res, $Val extends CourseEntity>
    implements $CourseEntityCopyWith<$Res> {
  _$CourseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? thumbnailUrl = freezed,
    Object? instructorId = null,
    Object? instructorName = null,
    Object? price = null,
    Object? duration = null,
    Object? level = null,
    Object? isPublished = null,
    Object? enrollmentCount = null,
    Object? rating = null,
    Object? ratingCount = null,
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
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as CourseCategory,
            thumbnailUrl:
                freezed == thumbnailUrl
                    ? _value.thumbnailUrl
                    : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            instructorId:
                null == instructorId
                    ? _value.instructorId
                    : instructorId // ignore: cast_nullable_to_non_nullable
                        as String,
            instructorName:
                null == instructorName
                    ? _value.instructorName
                    : instructorName // ignore: cast_nullable_to_non_nullable
                        as String,
            price:
                null == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as double,
            duration:
                null == duration
                    ? _value.duration
                    : duration // ignore: cast_nullable_to_non_nullable
                        as int,
            level:
                null == level
                    ? _value.level
                    : level // ignore: cast_nullable_to_non_nullable
                        as CourseLevel,
            isPublished:
                null == isPublished
                    ? _value.isPublished
                    : isPublished // ignore: cast_nullable_to_non_nullable
                        as bool,
            enrollmentCount:
                null == enrollmentCount
                    ? _value.enrollmentCount
                    : enrollmentCount // ignore: cast_nullable_to_non_nullable
                        as int,
            rating:
                null == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as double,
            ratingCount:
                null == ratingCount
                    ? _value.ratingCount
                    : ratingCount // ignore: cast_nullable_to_non_nullable
                        as int,
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
abstract class _$$CourseEntityImplCopyWith<$Res>
    implements $CourseEntityCopyWith<$Res> {
  factory _$$CourseEntityImplCopyWith(
    _$CourseEntityImpl value,
    $Res Function(_$CourseEntityImpl) then,
  ) = __$$CourseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    CourseCategory category,
    String? thumbnailUrl,
    String instructorId,
    String instructorName,
    double price,
    int duration,
    CourseLevel level,
    bool isPublished,
    int enrollmentCount,
    double rating,
    int ratingCount,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$CourseEntityImplCopyWithImpl<$Res>
    extends _$CourseEntityCopyWithImpl<$Res, _$CourseEntityImpl>
    implements _$$CourseEntityImplCopyWith<$Res> {
  __$$CourseEntityImplCopyWithImpl(
    _$CourseEntityImpl _value,
    $Res Function(_$CourseEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? thumbnailUrl = freezed,
    Object? instructorId = null,
    Object? instructorName = null,
    Object? price = null,
    Object? duration = null,
    Object? level = null,
    Object? isPublished = null,
    Object? enrollmentCount = null,
    Object? rating = null,
    Object? ratingCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$CourseEntityImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
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
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as CourseCategory,
        thumbnailUrl:
            freezed == thumbnailUrl
                ? _value.thumbnailUrl
                : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        instructorId:
            null == instructorId
                ? _value.instructorId
                : instructorId // ignore: cast_nullable_to_non_nullable
                    as String,
        instructorName:
            null == instructorName
                ? _value.instructorName
                : instructorName // ignore: cast_nullable_to_non_nullable
                    as String,
        price:
            null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as double,
        duration:
            null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                    as int,
        level:
            null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                    as CourseLevel,
        isPublished:
            null == isPublished
                ? _value.isPublished
                : isPublished // ignore: cast_nullable_to_non_nullable
                    as bool,
        enrollmentCount:
            null == enrollmentCount
                ? _value.enrollmentCount
                : enrollmentCount // ignore: cast_nullable_to_non_nullable
                    as int,
        rating:
            null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as double,
        ratingCount:
            null == ratingCount
                ? _value.ratingCount
                : ratingCount // ignore: cast_nullable_to_non_nullable
                    as int,
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

class _$CourseEntityImpl extends _CourseEntity {
  const _$CourseEntityImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.thumbnailUrl,
    required this.instructorId,
    required this.instructorName,
    required this.price,
    required this.duration,
    required this.level,
    required this.isPublished,
    this.enrollmentCount = 0,
    this.rating = 0.0,
    this.ratingCount = 0,
    required this.createdAt,
    required this.updatedAt,
  }) : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final CourseCategory category;
  @override
  final String? thumbnailUrl;
  @override
  final String instructorId;
  @override
  final String instructorName;
  @override
  final double price;
  @override
  final int duration;
  @override
  final CourseLevel level;
  @override
  final bool isPublished;
  @override
  @JsonKey()
  final int enrollmentCount;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int ratingCount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CourseEntity(id: $id, title: $title, description: $description, category: $category, thumbnailUrl: $thumbnailUrl, instructorId: $instructorId, instructorName: $instructorName, price: $price, duration: $duration, level: $level, isPublished: $isPublished, enrollmentCount: $enrollmentCount, rating: $rating, ratingCount: $ratingCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.instructorId, instructorId) ||
                other.instructorId == instructorId) &&
            (identical(other.instructorName, instructorName) ||
                other.instructorName == instructorName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.enrollmentCount, enrollmentCount) ||
                other.enrollmentCount == enrollmentCount) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    category,
    thumbnailUrl,
    instructorId,
    instructorName,
    price,
    duration,
    level,
    isPublished,
    enrollmentCount,
    rating,
    ratingCount,
    createdAt,
    updatedAt,
  );

  /// Create a copy of CourseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseEntityImplCopyWith<_$CourseEntityImpl> get copyWith =>
      __$$CourseEntityImplCopyWithImpl<_$CourseEntityImpl>(this, _$identity);
}

abstract class _CourseEntity extends CourseEntity {
  const factory _CourseEntity({
    required final String id,
    required final String title,
    required final String description,
    required final CourseCategory category,
    final String? thumbnailUrl,
    required final String instructorId,
    required final String instructorName,
    required final double price,
    required final int duration,
    required final CourseLevel level,
    required final bool isPublished,
    final int enrollmentCount,
    final double rating,
    final int ratingCount,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$CourseEntityImpl;
  const _CourseEntity._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  CourseCategory get category;
  @override
  String? get thumbnailUrl;
  @override
  String get instructorId;
  @override
  String get instructorName;
  @override
  double get price;
  @override
  int get duration;
  @override
  CourseLevel get level;
  @override
  bool get isPublished;
  @override
  int get enrollmentCount;
  @override
  double get rating;
  @override
  int get ratingCount;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of CourseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseEntityImplCopyWith<_$CourseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
