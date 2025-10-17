// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AnswerEntity {
  String get id => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  String get answerText => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  int get orderIndex => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of AnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerEntityCopyWith<AnswerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerEntityCopyWith<$Res> {
  factory $AnswerEntityCopyWith(
    AnswerEntity value,
    $Res Function(AnswerEntity) then,
  ) = _$AnswerEntityCopyWithImpl<$Res, AnswerEntity>;
  @useResult
  $Res call({
    String id,
    String questionId,
    String answerText,
    bool isCorrect,
    int orderIndex,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$AnswerEntityCopyWithImpl<$Res, $Val extends AnswerEntity>
    implements $AnswerEntityCopyWith<$Res> {
  _$AnswerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = null,
    Object? answerText = null,
    Object? isCorrect = null,
    Object? orderIndex = null,
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
            questionId:
                null == questionId
                    ? _value.questionId
                    : questionId // ignore: cast_nullable_to_non_nullable
                        as String,
            answerText:
                null == answerText
                    ? _value.answerText
                    : answerText // ignore: cast_nullable_to_non_nullable
                        as String,
            isCorrect:
                null == isCorrect
                    ? _value.isCorrect
                    : isCorrect // ignore: cast_nullable_to_non_nullable
                        as bool,
            orderIndex:
                null == orderIndex
                    ? _value.orderIndex
                    : orderIndex // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AnswerEntityImplCopyWith<$Res>
    implements $AnswerEntityCopyWith<$Res> {
  factory _$$AnswerEntityImplCopyWith(
    _$AnswerEntityImpl value,
    $Res Function(_$AnswerEntityImpl) then,
  ) = __$$AnswerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String questionId,
    String answerText,
    bool isCorrect,
    int orderIndex,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$AnswerEntityImplCopyWithImpl<$Res>
    extends _$AnswerEntityCopyWithImpl<$Res, _$AnswerEntityImpl>
    implements _$$AnswerEntityImplCopyWith<$Res> {
  __$$AnswerEntityImplCopyWithImpl(
    _$AnswerEntityImpl _value,
    $Res Function(_$AnswerEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = null,
    Object? answerText = null,
    Object? isCorrect = null,
    Object? orderIndex = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$AnswerEntityImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        questionId:
            null == questionId
                ? _value.questionId
                : questionId // ignore: cast_nullable_to_non_nullable
                    as String,
        answerText:
            null == answerText
                ? _value.answerText
                : answerText // ignore: cast_nullable_to_non_nullable
                    as String,
        isCorrect:
            null == isCorrect
                ? _value.isCorrect
                : isCorrect // ignore: cast_nullable_to_non_nullable
                    as bool,
        orderIndex:
            null == orderIndex
                ? _value.orderIndex
                : orderIndex // ignore: cast_nullable_to_non_nullable
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

class _$AnswerEntityImpl extends _AnswerEntity {
  const _$AnswerEntityImpl({
    required this.id,
    required this.questionId,
    required this.answerText,
    required this.isCorrect,
    required this.orderIndex,
    required this.createdAt,
    required this.updatedAt,
  }) : super._();

  @override
  final String id;
  @override
  final String questionId;
  @override
  final String answerText;
  @override
  final bool isCorrect;
  @override
  final int orderIndex;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'AnswerEntity(id: $id, questionId: $questionId, answerText: $answerText, isCorrect: $isCorrect, orderIndex: $orderIndex, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    questionId,
    answerText,
    isCorrect,
    orderIndex,
    createdAt,
    updatedAt,
  );

  /// Create a copy of AnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerEntityImplCopyWith<_$AnswerEntityImpl> get copyWith =>
      __$$AnswerEntityImplCopyWithImpl<_$AnswerEntityImpl>(this, _$identity);
}

abstract class _AnswerEntity extends AnswerEntity {
  const factory _AnswerEntity({
    required final String id,
    required final String questionId,
    required final String answerText,
    required final bool isCorrect,
    required final int orderIndex,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$AnswerEntityImpl;
  const _AnswerEntity._() : super._();

  @override
  String get id;
  @override
  String get questionId;
  @override
  String get answerText;
  @override
  bool get isCorrect;
  @override
  int get orderIndex;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of AnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerEntityImplCopyWith<_$AnswerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
