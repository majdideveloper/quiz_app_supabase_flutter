// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QuestionEntity {
  String get id => throw _privateConstructorUsedError;
  String get quizId => throw _privateConstructorUsedError;
  String get questionText => throw _privateConstructorUsedError;
  QuestionType get questionType => throw _privateConstructorUsedError;
  int get orderIndex => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionEntityCopyWith<QuestionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionEntityCopyWith<$Res> {
  factory $QuestionEntityCopyWith(
    QuestionEntity value,
    $Res Function(QuestionEntity) then,
  ) = _$QuestionEntityCopyWithImpl<$Res, QuestionEntity>;
  @useResult
  $Res call({
    String id,
    String quizId,
    String questionText,
    QuestionType questionType,
    int orderIndex,
    int points,
    String? explanation,
    String? imageUrl,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$QuestionEntityCopyWithImpl<$Res, $Val extends QuestionEntity>
    implements $QuestionEntityCopyWith<$Res> {
  _$QuestionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quizId = null,
    Object? questionText = null,
    Object? questionType = null,
    Object? orderIndex = null,
    Object? points = null,
    Object? explanation = freezed,
    Object? imageUrl = freezed,
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
            quizId:
                null == quizId
                    ? _value.quizId
                    : quizId // ignore: cast_nullable_to_non_nullable
                        as String,
            questionText:
                null == questionText
                    ? _value.questionText
                    : questionText // ignore: cast_nullable_to_non_nullable
                        as String,
            questionType:
                null == questionType
                    ? _value.questionType
                    : questionType // ignore: cast_nullable_to_non_nullable
                        as QuestionType,
            orderIndex:
                null == orderIndex
                    ? _value.orderIndex
                    : orderIndex // ignore: cast_nullable_to_non_nullable
                        as int,
            points:
                null == points
                    ? _value.points
                    : points // ignore: cast_nullable_to_non_nullable
                        as int,
            explanation:
                freezed == explanation
                    ? _value.explanation
                    : explanation // ignore: cast_nullable_to_non_nullable
                        as String?,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
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
abstract class _$$QuestionEntityImplCopyWith<$Res>
    implements $QuestionEntityCopyWith<$Res> {
  factory _$$QuestionEntityImplCopyWith(
    _$QuestionEntityImpl value,
    $Res Function(_$QuestionEntityImpl) then,
  ) = __$$QuestionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String quizId,
    String questionText,
    QuestionType questionType,
    int orderIndex,
    int points,
    String? explanation,
    String? imageUrl,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$QuestionEntityImplCopyWithImpl<$Res>
    extends _$QuestionEntityCopyWithImpl<$Res, _$QuestionEntityImpl>
    implements _$$QuestionEntityImplCopyWith<$Res> {
  __$$QuestionEntityImplCopyWithImpl(
    _$QuestionEntityImpl _value,
    $Res Function(_$QuestionEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quizId = null,
    Object? questionText = null,
    Object? questionType = null,
    Object? orderIndex = null,
    Object? points = null,
    Object? explanation = freezed,
    Object? imageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$QuestionEntityImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        quizId:
            null == quizId
                ? _value.quizId
                : quizId // ignore: cast_nullable_to_non_nullable
                    as String,
        questionText:
            null == questionText
                ? _value.questionText
                : questionText // ignore: cast_nullable_to_non_nullable
                    as String,
        questionType:
            null == questionType
                ? _value.questionType
                : questionType // ignore: cast_nullable_to_non_nullable
                    as QuestionType,
        orderIndex:
            null == orderIndex
                ? _value.orderIndex
                : orderIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        points:
            null == points
                ? _value.points
                : points // ignore: cast_nullable_to_non_nullable
                    as int,
        explanation:
            freezed == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                    as String?,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
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

class _$QuestionEntityImpl extends _QuestionEntity {
  const _$QuestionEntityImpl({
    required this.id,
    required this.quizId,
    required this.questionText,
    required this.questionType,
    required this.orderIndex,
    this.points = 1,
    this.explanation,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  }) : super._();

  @override
  final String id;
  @override
  final String quizId;
  @override
  final String questionText;
  @override
  final QuestionType questionType;
  @override
  final int orderIndex;
  @override
  @JsonKey()
  final int points;
  @override
  final String? explanation;
  @override
  final String? imageUrl;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'QuestionEntity(id: $id, quizId: $quizId, questionText: $questionText, questionType: $questionType, orderIndex: $orderIndex, points: $points, explanation: $explanation, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    quizId,
    questionText,
    questionType,
    orderIndex,
    points,
    explanation,
    imageUrl,
    createdAt,
    updatedAt,
  );

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionEntityImplCopyWith<_$QuestionEntityImpl> get copyWith =>
      __$$QuestionEntityImplCopyWithImpl<_$QuestionEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _QuestionEntity extends QuestionEntity {
  const factory _QuestionEntity({
    required final String id,
    required final String quizId,
    required final String questionText,
    required final QuestionType questionType,
    required final int orderIndex,
    final int points,
    final String? explanation,
    final String? imageUrl,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$QuestionEntityImpl;
  const _QuestionEntity._() : super._();

  @override
  String get id;
  @override
  String get quizId;
  @override
  String get questionText;
  @override
  QuestionType get questionType;
  @override
  int get orderIndex;
  @override
  int get points;
  @override
  String? get explanation;
  @override
  String? get imageUrl;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionEntityImplCopyWith<_$QuestionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
