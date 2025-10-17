// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return _QuestionModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_id')
  String get quizId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_text')
  String get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_type')
  QuestionType get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_index')
  int get orderIndex => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this QuestionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
    QuestionModel value,
    $Res Function(QuestionModel) then,
  ) = _$QuestionModelCopyWithImpl<$Res, QuestionModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'quiz_id') String quizId,
    @JsonKey(name: 'question_text') String questionText,
    @JsonKey(name: 'question_type') QuestionType questionType,
    @JsonKey(name: 'order_index') int orderIndex,
    int points,
    String? explanation,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res, $Val extends QuestionModel>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionModel
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
abstract class _$$QuestionModelImplCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$$QuestionModelImplCopyWith(
    _$QuestionModelImpl value,
    $Res Function(_$QuestionModelImpl) then,
  ) = __$$QuestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'quiz_id') String quizId,
    @JsonKey(name: 'question_text') String questionText,
    @JsonKey(name: 'question_type') QuestionType questionType,
    @JsonKey(name: 'order_index') int orderIndex,
    int points,
    String? explanation,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$QuestionModelImplCopyWithImpl<$Res>
    extends _$QuestionModelCopyWithImpl<$Res, _$QuestionModelImpl>
    implements _$$QuestionModelImplCopyWith<$Res> {
  __$$QuestionModelImplCopyWithImpl(
    _$QuestionModelImpl _value,
    $Res Function(_$QuestionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuestionModel
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
      _$QuestionModelImpl(
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
@JsonSerializable()
class _$QuestionModelImpl extends _QuestionModel {
  const _$QuestionModelImpl({
    required this.id,
    @JsonKey(name: 'quiz_id') required this.quizId,
    @JsonKey(name: 'question_text') required this.questionText,
    @JsonKey(name: 'question_type') required this.questionType,
    @JsonKey(name: 'order_index') required this.orderIndex,
    this.points = 1,
    this.explanation,
    @JsonKey(name: 'image_url') this.imageUrl,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  }) : super._();

  factory _$QuestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'quiz_id')
  final String quizId;
  @override
  @JsonKey(name: 'question_text')
  final String questionText;
  @override
  @JsonKey(name: 'question_type')
  final QuestionType questionType;
  @override
  @JsonKey(name: 'order_index')
  final int orderIndex;
  @override
  @JsonKey()
  final int points;
  @override
  final String? explanation;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'QuestionModel(id: $id, quizId: $quizId, questionText: $questionText, questionType: $questionType, orderIndex: $orderIndex, points: $points, explanation: $explanation, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionModelImplCopyWith<_$QuestionModelImpl> get copyWith =>
      __$$QuestionModelImplCopyWithImpl<_$QuestionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionModelImplToJson(this);
  }
}

abstract class _QuestionModel extends QuestionModel {
  const factory _QuestionModel({
    required final String id,
    @JsonKey(name: 'quiz_id') required final String quizId,
    @JsonKey(name: 'question_text') required final String questionText,
    @JsonKey(name: 'question_type') required final QuestionType questionType,
    @JsonKey(name: 'order_index') required final int orderIndex,
    final int points,
    final String? explanation,
    @JsonKey(name: 'image_url') final String? imageUrl,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$QuestionModelImpl;
  const _QuestionModel._() : super._();

  factory _QuestionModel.fromJson(Map<String, dynamic> json) =
      _$QuestionModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'quiz_id')
  String get quizId;
  @override
  @JsonKey(name: 'question_text')
  String get questionText;
  @override
  @JsonKey(name: 'question_type')
  QuestionType get questionType;
  @override
  @JsonKey(name: 'order_index')
  int get orderIndex;
  @override
  int get points;
  @override
  String? get explanation;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionModelImplCopyWith<_$QuestionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
