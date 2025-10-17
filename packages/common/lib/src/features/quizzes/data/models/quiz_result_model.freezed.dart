// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuizResultModel _$QuizResultModelFromJson(Map<String, dynamic> json) {
  return _QuizResultModel.fromJson(json);
}

/// @nodoc
mixin _$QuizResultModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_id')
  String get quizId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_questions')
  int get totalQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answers')
  int get correctAnswers => throw _privateConstructorUsedError;
  @JsonKey(name: 'incorrect_answers')
  int get incorrectAnswers => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_spent')
  int get timeSpent => throw _privateConstructorUsedError;
  bool get passed => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_number')
  int get attemptNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at')
  DateTime get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'submitted_at')
  DateTime get submittedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this QuizResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizResultModelCopyWith<QuizResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResultModelCopyWith<$Res> {
  factory $QuizResultModelCopyWith(
    QuizResultModel value,
    $Res Function(QuizResultModel) then,
  ) = _$QuizResultModelCopyWithImpl<$Res, QuizResultModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'quiz_id') String quizId,
    @JsonKey(name: 'user_id') String userId,
    double score,
    @JsonKey(name: 'total_questions') int totalQuestions,
    @JsonKey(name: 'correct_answers') int correctAnswers,
    @JsonKey(name: 'incorrect_answers') int incorrectAnswers,
    @JsonKey(name: 'time_spent') int timeSpent,
    bool passed,
    @JsonKey(name: 'attempt_number') int attemptNumber,
    @JsonKey(name: 'started_at') DateTime startedAt,
    @JsonKey(name: 'submitted_at') DateTime submittedAt,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class _$QuizResultModelCopyWithImpl<$Res, $Val extends QuizResultModel>
    implements $QuizResultModelCopyWith<$Res> {
  _$QuizResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizResultModel
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
abstract class _$$QuizResultModelImplCopyWith<$Res>
    implements $QuizResultModelCopyWith<$Res> {
  factory _$$QuizResultModelImplCopyWith(
    _$QuizResultModelImpl value,
    $Res Function(_$QuizResultModelImpl) then,
  ) = __$$QuizResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'quiz_id') String quizId,
    @JsonKey(name: 'user_id') String userId,
    double score,
    @JsonKey(name: 'total_questions') int totalQuestions,
    @JsonKey(name: 'correct_answers') int correctAnswers,
    @JsonKey(name: 'incorrect_answers') int incorrectAnswers,
    @JsonKey(name: 'time_spent') int timeSpent,
    bool passed,
    @JsonKey(name: 'attempt_number') int attemptNumber,
    @JsonKey(name: 'started_at') DateTime startedAt,
    @JsonKey(name: 'submitted_at') DateTime submittedAt,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class __$$QuizResultModelImplCopyWithImpl<$Res>
    extends _$QuizResultModelCopyWithImpl<$Res, _$QuizResultModelImpl>
    implements _$$QuizResultModelImplCopyWith<$Res> {
  __$$QuizResultModelImplCopyWithImpl(
    _$QuizResultModelImpl _value,
    $Res Function(_$QuizResultModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizResultModel
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
      _$QuizResultModelImpl(
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
@JsonSerializable()
class _$QuizResultModelImpl extends _QuizResultModel {
  const _$QuizResultModelImpl({
    required this.id,
    @JsonKey(name: 'quiz_id') required this.quizId,
    @JsonKey(name: 'user_id') required this.userId,
    required this.score,
    @JsonKey(name: 'total_questions') required this.totalQuestions,
    @JsonKey(name: 'correct_answers') required this.correctAnswers,
    @JsonKey(name: 'incorrect_answers') required this.incorrectAnswers,
    @JsonKey(name: 'time_spent') required this.timeSpent,
    required this.passed,
    @JsonKey(name: 'attempt_number') required this.attemptNumber,
    @JsonKey(name: 'started_at') required this.startedAt,
    @JsonKey(name: 'submitted_at') required this.submittedAt,
    @JsonKey(name: 'created_at') required this.createdAt,
  }) : super._();

  factory _$QuizResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizResultModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'quiz_id')
  final String quizId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final double score;
  @override
  @JsonKey(name: 'total_questions')
  final int totalQuestions;
  @override
  @JsonKey(name: 'correct_answers')
  final int correctAnswers;
  @override
  @JsonKey(name: 'incorrect_answers')
  final int incorrectAnswers;
  @override
  @JsonKey(name: 'time_spent')
  final int timeSpent;
  @override
  final bool passed;
  @override
  @JsonKey(name: 'attempt_number')
  final int attemptNumber;
  @override
  @JsonKey(name: 'started_at')
  final DateTime startedAt;
  @override
  @JsonKey(name: 'submitted_at')
  final DateTime submittedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'QuizResultModel(id: $id, quizId: $quizId, userId: $userId, score: $score, totalQuestions: $totalQuestions, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, timeSpent: $timeSpent, passed: $passed, attemptNumber: $attemptNumber, startedAt: $startedAt, submittedAt: $submittedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResultModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of QuizResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResultModelImplCopyWith<_$QuizResultModelImpl> get copyWith =>
      __$$QuizResultModelImplCopyWithImpl<_$QuizResultModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizResultModelImplToJson(this);
  }
}

abstract class _QuizResultModel extends QuizResultModel {
  const factory _QuizResultModel({
    required final String id,
    @JsonKey(name: 'quiz_id') required final String quizId,
    @JsonKey(name: 'user_id') required final String userId,
    required final double score,
    @JsonKey(name: 'total_questions') required final int totalQuestions,
    @JsonKey(name: 'correct_answers') required final int correctAnswers,
    @JsonKey(name: 'incorrect_answers') required final int incorrectAnswers,
    @JsonKey(name: 'time_spent') required final int timeSpent,
    required final bool passed,
    @JsonKey(name: 'attempt_number') required final int attemptNumber,
    @JsonKey(name: 'started_at') required final DateTime startedAt,
    @JsonKey(name: 'submitted_at') required final DateTime submittedAt,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
  }) = _$QuizResultModelImpl;
  const _QuizResultModel._() : super._();

  factory _QuizResultModel.fromJson(Map<String, dynamic> json) =
      _$QuizResultModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'quiz_id')
  String get quizId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  double get score;
  @override
  @JsonKey(name: 'total_questions')
  int get totalQuestions;
  @override
  @JsonKey(name: 'correct_answers')
  int get correctAnswers;
  @override
  @JsonKey(name: 'incorrect_answers')
  int get incorrectAnswers;
  @override
  @JsonKey(name: 'time_spent')
  int get timeSpent;
  @override
  bool get passed;
  @override
  @JsonKey(name: 'attempt_number')
  int get attemptNumber;
  @override
  @JsonKey(name: 'started_at')
  DateTime get startedAt;
  @override
  @JsonKey(name: 'submitted_at')
  DateTime get submittedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of QuizResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizResultModelImplCopyWith<_$QuizResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
