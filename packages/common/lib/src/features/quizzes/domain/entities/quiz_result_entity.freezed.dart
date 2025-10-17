// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QuizResultEntity {
  String get id => throw _privateConstructorUsedError;
  String get quizId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  int get totalQuestions => throw _privateConstructorUsedError;
  int get correctAnswers => throw _privateConstructorUsedError;
  int get incorrectAnswers => throw _privateConstructorUsedError;
  int get timeSpent => throw _privateConstructorUsedError;
  bool get passed => throw _privateConstructorUsedError;
  int get attemptNumber => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime get submittedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of QuizResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizResultEntityCopyWith<QuizResultEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResultEntityCopyWith<$Res> {
  factory $QuizResultEntityCopyWith(
    QuizResultEntity value,
    $Res Function(QuizResultEntity) then,
  ) = _$QuizResultEntityCopyWithImpl<$Res, QuizResultEntity>;
  @useResult
  $Res call({
    String id,
    String quizId,
    String userId,
    double score,
    int totalQuestions,
    int correctAnswers,
    int incorrectAnswers,
    int timeSpent,
    bool passed,
    int attemptNumber,
    DateTime startedAt,
    DateTime submittedAt,
    DateTime createdAt,
  });
}

/// @nodoc
class _$QuizResultEntityCopyWithImpl<$Res, $Val extends QuizResultEntity>
    implements $QuizResultEntityCopyWith<$Res> {
  _$QuizResultEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quizId = null,
    Object? userId = null,
    Object? score = null,
    Object? totalQuestions = null,
    Object? correctAnswers = null,
    Object? incorrectAnswers = null,
    Object? timeSpent = null,
    Object? passed = null,
    Object? attemptNumber = null,
    Object? startedAt = null,
    Object? submittedAt = null,
    Object? createdAt = null,
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
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            score:
                null == score
                    ? _value.score
                    : score // ignore: cast_nullable_to_non_nullable
                        as double,
            totalQuestions:
                null == totalQuestions
                    ? _value.totalQuestions
                    : totalQuestions // ignore: cast_nullable_to_non_nullable
                        as int,
            correctAnswers:
                null == correctAnswers
                    ? _value.correctAnswers
                    : correctAnswers // ignore: cast_nullable_to_non_nullable
                        as int,
            incorrectAnswers:
                null == incorrectAnswers
                    ? _value.incorrectAnswers
                    : incorrectAnswers // ignore: cast_nullable_to_non_nullable
                        as int,
            timeSpent:
                null == timeSpent
                    ? _value.timeSpent
                    : timeSpent // ignore: cast_nullable_to_non_nullable
                        as int,
            passed:
                null == passed
                    ? _value.passed
                    : passed // ignore: cast_nullable_to_non_nullable
                        as bool,
            attemptNumber:
                null == attemptNumber
                    ? _value.attemptNumber
                    : attemptNumber // ignore: cast_nullable_to_non_nullable
                        as int,
            startedAt:
                null == startedAt
                    ? _value.startedAt
                    : startedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            submittedAt:
                null == submittedAt
                    ? _value.submittedAt
                    : submittedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
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
abstract class _$$QuizResultEntityImplCopyWith<$Res>
    implements $QuizResultEntityCopyWith<$Res> {
  factory _$$QuizResultEntityImplCopyWith(
    _$QuizResultEntityImpl value,
    $Res Function(_$QuizResultEntityImpl) then,
  ) = __$$QuizResultEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String quizId,
    String userId,
    double score,
    int totalQuestions,
    int correctAnswers,
    int incorrectAnswers,
    int timeSpent,
    bool passed,
    int attemptNumber,
    DateTime startedAt,
    DateTime submittedAt,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$QuizResultEntityImplCopyWithImpl<$Res>
    extends _$QuizResultEntityCopyWithImpl<$Res, _$QuizResultEntityImpl>
    implements _$$QuizResultEntityImplCopyWith<$Res> {
  __$$QuizResultEntityImplCopyWithImpl(
    _$QuizResultEntityImpl _value,
    $Res Function(_$QuizResultEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quizId = null,
    Object? userId = null,
    Object? score = null,
    Object? totalQuestions = null,
    Object? correctAnswers = null,
    Object? incorrectAnswers = null,
    Object? timeSpent = null,
    Object? passed = null,
    Object? attemptNumber = null,
    Object? startedAt = null,
    Object? submittedAt = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$QuizResultEntityImpl(
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
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        score:
            null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                    as double,
        totalQuestions:
            null == totalQuestions
                ? _value.totalQuestions
                : totalQuestions // ignore: cast_nullable_to_non_nullable
                    as int,
        correctAnswers:
            null == correctAnswers
                ? _value.correctAnswers
                : correctAnswers // ignore: cast_nullable_to_non_nullable
                    as int,
        incorrectAnswers:
            null == incorrectAnswers
                ? _value.incorrectAnswers
                : incorrectAnswers // ignore: cast_nullable_to_non_nullable
                    as int,
        timeSpent:
            null == timeSpent
                ? _value.timeSpent
                : timeSpent // ignore: cast_nullable_to_non_nullable
                    as int,
        passed:
            null == passed
                ? _value.passed
                : passed // ignore: cast_nullable_to_non_nullable
                    as bool,
        attemptNumber:
            null == attemptNumber
                ? _value.attemptNumber
                : attemptNumber // ignore: cast_nullable_to_non_nullable
                    as int,
        startedAt:
            null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        submittedAt:
            null == submittedAt
                ? _value.submittedAt
                : submittedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
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

class _$QuizResultEntityImpl extends _QuizResultEntity {
  const _$QuizResultEntityImpl({
    required this.id,
    required this.quizId,
    required this.userId,
    required this.score,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.timeSpent,
    required this.passed,
    required this.attemptNumber,
    required this.startedAt,
    required this.submittedAt,
    required this.createdAt,
  }) : super._();

  @override
  final String id;
  @override
  final String quizId;
  @override
  final String userId;
  @override
  final double score;
  @override
  final int totalQuestions;
  @override
  final int correctAnswers;
  @override
  final int incorrectAnswers;
  @override
  final int timeSpent;
  @override
  final bool passed;
  @override
  final int attemptNumber;
  @override
  final DateTime startedAt;
  @override
  final DateTime submittedAt;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'QuizResultEntity(id: $id, quizId: $quizId, userId: $userId, score: $score, totalQuestions: $totalQuestions, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, timeSpent: $timeSpent, passed: $passed, attemptNumber: $attemptNumber, startedAt: $startedAt, submittedAt: $submittedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResultEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.incorrectAnswers, incorrectAnswers) ||
                other.incorrectAnswers == incorrectAnswers) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent) &&
            (identical(other.passed, passed) || other.passed == passed) &&
            (identical(other.attemptNumber, attemptNumber) ||
                other.attemptNumber == attemptNumber) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    quizId,
    userId,
    score,
    totalQuestions,
    correctAnswers,
    incorrectAnswers,
    timeSpent,
    passed,
    attemptNumber,
    startedAt,
    submittedAt,
    createdAt,
  );

  /// Create a copy of QuizResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResultEntityImplCopyWith<_$QuizResultEntityImpl> get copyWith =>
      __$$QuizResultEntityImplCopyWithImpl<_$QuizResultEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _QuizResultEntity extends QuizResultEntity {
  const factory _QuizResultEntity({
    required final String id,
    required final String quizId,
    required final String userId,
    required final double score,
    required final int totalQuestions,
    required final int correctAnswers,
    required final int incorrectAnswers,
    required final int timeSpent,
    required final bool passed,
    required final int attemptNumber,
    required final DateTime startedAt,
    required final DateTime submittedAt,
    required final DateTime createdAt,
  }) = _$QuizResultEntityImpl;
  const _QuizResultEntity._() : super._();

  @override
  String get id;
  @override
  String get quizId;
  @override
  String get userId;
  @override
  double get score;
  @override
  int get totalQuestions;
  @override
  int get correctAnswers;
  @override
  int get incorrectAnswers;
  @override
  int get timeSpent;
  @override
  bool get passed;
  @override
  int get attemptNumber;
  @override
  DateTime get startedAt;
  @override
  DateTime get submittedAt;
  @override
  DateTime get createdAt;

  /// Create a copy of QuizResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizResultEntityImplCopyWith<_$QuizResultEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
