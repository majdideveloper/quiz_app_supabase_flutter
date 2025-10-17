// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) {
  return _QuizModel.fromJson(json);
}

/// @nodoc
mixin _$QuizModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_id')
  String get courseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_id')
  String? get lessonId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_type')
  QuizType get quizType => throw _privateConstructorUsedError;
  @JsonKey(name: 'passing_score')
  int get passingScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_limit')
  int? get timeLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'questions_count')
  int get questionsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_attempts')
  int? get maxAttempts => throw _privateConstructorUsedError;
  @JsonKey(name: 'shuffle_questions')
  bool get shuffleQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'shuffle_answers')
  bool get shuffleAnswers => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_correct_answers')
  bool get showCorrectAnswers => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this QuizModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizModelCopyWith<QuizModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizModelCopyWith<$Res> {
  factory $QuizModelCopyWith(QuizModel value, $Res Function(QuizModel) then) =
      _$QuizModelCopyWithImpl<$Res, QuizModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'course_id') String courseId,
    @JsonKey(name: 'lesson_id') String? lessonId,
    String title,
    String description,
    @JsonKey(name: 'quiz_type') QuizType quizType,
    @JsonKey(name: 'passing_score') int passingScore,
    @JsonKey(name: 'time_limit') int? timeLimit,
    @JsonKey(name: 'questions_count') int questionsCount,
    @JsonKey(name: 'max_attempts') int? maxAttempts,
    @JsonKey(name: 'shuffle_questions') bool shuffleQuestions,
    @JsonKey(name: 'shuffle_answers') bool shuffleAnswers,
    @JsonKey(name: 'show_correct_answers') bool showCorrectAnswers,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$QuizModelCopyWithImpl<$Res, $Val extends QuizModel>
    implements $QuizModelCopyWith<$Res> {
  _$QuizModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? lessonId = freezed,
    Object? title = null,
    Object? description = null,
    Object? quizType = null,
    Object? passingScore = null,
    Object? timeLimit = freezed,
    Object? questionsCount = null,
    Object? maxAttempts = freezed,
    Object? shuffleQuestions = null,
    Object? shuffleAnswers = null,
    Object? showCorrectAnswers = null,
    Object? isActive = null,
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
            lessonId:
                freezed == lessonId
                    ? _value.lessonId
                    : lessonId // ignore: cast_nullable_to_non_nullable
                        as String?,
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
            quizType:
                null == quizType
                    ? _value.quizType
                    : quizType // ignore: cast_nullable_to_non_nullable
                        as QuizType,
            passingScore:
                null == passingScore
                    ? _value.passingScore
                    : passingScore // ignore: cast_nullable_to_non_nullable
                        as int,
            timeLimit:
                freezed == timeLimit
                    ? _value.timeLimit
                    : timeLimit // ignore: cast_nullable_to_non_nullable
                        as int?,
            questionsCount:
                null == questionsCount
                    ? _value.questionsCount
                    : questionsCount // ignore: cast_nullable_to_non_nullable
                        as int,
            maxAttempts:
                freezed == maxAttempts
                    ? _value.maxAttempts
                    : maxAttempts // ignore: cast_nullable_to_non_nullable
                        as int?,
            shuffleQuestions:
                null == shuffleQuestions
                    ? _value.shuffleQuestions
                    : shuffleQuestions // ignore: cast_nullable_to_non_nullable
                        as bool,
            shuffleAnswers:
                null == shuffleAnswers
                    ? _value.shuffleAnswers
                    : shuffleAnswers // ignore: cast_nullable_to_non_nullable
                        as bool,
            showCorrectAnswers:
                null == showCorrectAnswers
                    ? _value.showCorrectAnswers
                    : showCorrectAnswers // ignore: cast_nullable_to_non_nullable
                        as bool,
            isActive:
                null == isActive
                    ? _value.isActive
                    : isActive // ignore: cast_nullable_to_non_nullable
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
abstract class _$$QuizModelImplCopyWith<$Res>
    implements $QuizModelCopyWith<$Res> {
  factory _$$QuizModelImplCopyWith(
    _$QuizModelImpl value,
    $Res Function(_$QuizModelImpl) then,
  ) = __$$QuizModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'course_id') String courseId,
    @JsonKey(name: 'lesson_id') String? lessonId,
    String title,
    String description,
    @JsonKey(name: 'quiz_type') QuizType quizType,
    @JsonKey(name: 'passing_score') int passingScore,
    @JsonKey(name: 'time_limit') int? timeLimit,
    @JsonKey(name: 'questions_count') int questionsCount,
    @JsonKey(name: 'max_attempts') int? maxAttempts,
    @JsonKey(name: 'shuffle_questions') bool shuffleQuestions,
    @JsonKey(name: 'shuffle_answers') bool shuffleAnswers,
    @JsonKey(name: 'show_correct_answers') bool showCorrectAnswers,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$QuizModelImplCopyWithImpl<$Res>
    extends _$QuizModelCopyWithImpl<$Res, _$QuizModelImpl>
    implements _$$QuizModelImplCopyWith<$Res> {
  __$$QuizModelImplCopyWithImpl(
    _$QuizModelImpl _value,
    $Res Function(_$QuizModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? lessonId = freezed,
    Object? title = null,
    Object? description = null,
    Object? quizType = null,
    Object? passingScore = null,
    Object? timeLimit = freezed,
    Object? questionsCount = null,
    Object? maxAttempts = freezed,
    Object? shuffleQuestions = null,
    Object? shuffleAnswers = null,
    Object? showCorrectAnswers = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$QuizModelImpl(
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
        lessonId:
            freezed == lessonId
                ? _value.lessonId
                : lessonId // ignore: cast_nullable_to_non_nullable
                    as String?,
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
        quizType:
            null == quizType
                ? _value.quizType
                : quizType // ignore: cast_nullable_to_non_nullable
                    as QuizType,
        passingScore:
            null == passingScore
                ? _value.passingScore
                : passingScore // ignore: cast_nullable_to_non_nullable
                    as int,
        timeLimit:
            freezed == timeLimit
                ? _value.timeLimit
                : timeLimit // ignore: cast_nullable_to_non_nullable
                    as int?,
        questionsCount:
            null == questionsCount
                ? _value.questionsCount
                : questionsCount // ignore: cast_nullable_to_non_nullable
                    as int,
        maxAttempts:
            freezed == maxAttempts
                ? _value.maxAttempts
                : maxAttempts // ignore: cast_nullable_to_non_nullable
                    as int?,
        shuffleQuestions:
            null == shuffleQuestions
                ? _value.shuffleQuestions
                : shuffleQuestions // ignore: cast_nullable_to_non_nullable
                    as bool,
        shuffleAnswers:
            null == shuffleAnswers
                ? _value.shuffleAnswers
                : shuffleAnswers // ignore: cast_nullable_to_non_nullable
                    as bool,
        showCorrectAnswers:
            null == showCorrectAnswers
                ? _value.showCorrectAnswers
                : showCorrectAnswers // ignore: cast_nullable_to_non_nullable
                    as bool,
        isActive:
            null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
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
class _$QuizModelImpl extends _QuizModel {
  const _$QuizModelImpl({
    required this.id,
    @JsonKey(name: 'course_id') required this.courseId,
    @JsonKey(name: 'lesson_id') this.lessonId,
    required this.title,
    required this.description,
    @JsonKey(name: 'quiz_type') required this.quizType,
    @JsonKey(name: 'passing_score') required this.passingScore,
    @JsonKey(name: 'time_limit') this.timeLimit,
    @JsonKey(name: 'questions_count') required this.questionsCount,
    @JsonKey(name: 'max_attempts') this.maxAttempts,
    @JsonKey(name: 'shuffle_questions') this.shuffleQuestions = true,
    @JsonKey(name: 'shuffle_answers') this.shuffleAnswers = true,
    @JsonKey(name: 'show_correct_answers') this.showCorrectAnswers = true,
    @JsonKey(name: 'is_active') this.isActive = true,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  }) : super._();

  factory _$QuizModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'course_id')
  final String courseId;
  @override
  @JsonKey(name: 'lesson_id')
  final String? lessonId;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: 'quiz_type')
  final QuizType quizType;
  @override
  @JsonKey(name: 'passing_score')
  final int passingScore;
  @override
  @JsonKey(name: 'time_limit')
  final int? timeLimit;
  @override
  @JsonKey(name: 'questions_count')
  final int questionsCount;
  @override
  @JsonKey(name: 'max_attempts')
  final int? maxAttempts;
  @override
  @JsonKey(name: 'shuffle_questions')
  final bool shuffleQuestions;
  @override
  @JsonKey(name: 'shuffle_answers')
  final bool shuffleAnswers;
  @override
  @JsonKey(name: 'show_correct_answers')
  final bool showCorrectAnswers;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'QuizModel(id: $id, courseId: $courseId, lessonId: $lessonId, title: $title, description: $description, quizType: $quizType, passingScore: $passingScore, timeLimit: $timeLimit, questionsCount: $questionsCount, maxAttempts: $maxAttempts, shuffleQuestions: $shuffleQuestions, shuffleAnswers: $shuffleAnswers, showCorrectAnswers: $showCorrectAnswers, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quizType, quizType) ||
                other.quizType == quizType) &&
            (identical(other.passingScore, passingScore) ||
                other.passingScore == passingScore) &&
            (identical(other.timeLimit, timeLimit) ||
                other.timeLimit == timeLimit) &&
            (identical(other.questionsCount, questionsCount) ||
                other.questionsCount == questionsCount) &&
            (identical(other.maxAttempts, maxAttempts) ||
                other.maxAttempts == maxAttempts) &&
            (identical(other.shuffleQuestions, shuffleQuestions) ||
                other.shuffleQuestions == shuffleQuestions) &&
            (identical(other.shuffleAnswers, shuffleAnswers) ||
                other.shuffleAnswers == shuffleAnswers) &&
            (identical(other.showCorrectAnswers, showCorrectAnswers) ||
                other.showCorrectAnswers == showCorrectAnswers) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
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
    courseId,
    lessonId,
    title,
    description,
    quizType,
    passingScore,
    timeLimit,
    questionsCount,
    maxAttempts,
    shuffleQuestions,
    shuffleAnswers,
    showCorrectAnswers,
    isActive,
    createdAt,
    updatedAt,
  );

  /// Create a copy of QuizModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizModelImplCopyWith<_$QuizModelImpl> get copyWith =>
      __$$QuizModelImplCopyWithImpl<_$QuizModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizModelImplToJson(this);
  }
}

abstract class _QuizModel extends QuizModel {
  const factory _QuizModel({
    required final String id,
    @JsonKey(name: 'course_id') required final String courseId,
    @JsonKey(name: 'lesson_id') final String? lessonId,
    required final String title,
    required final String description,
    @JsonKey(name: 'quiz_type') required final QuizType quizType,
    @JsonKey(name: 'passing_score') required final int passingScore,
    @JsonKey(name: 'time_limit') final int? timeLimit,
    @JsonKey(name: 'questions_count') required final int questionsCount,
    @JsonKey(name: 'max_attempts') final int? maxAttempts,
    @JsonKey(name: 'shuffle_questions') final bool shuffleQuestions,
    @JsonKey(name: 'shuffle_answers') final bool shuffleAnswers,
    @JsonKey(name: 'show_correct_answers') final bool showCorrectAnswers,
    @JsonKey(name: 'is_active') final bool isActive,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$QuizModelImpl;
  const _QuizModel._() : super._();

  factory _QuizModel.fromJson(Map<String, dynamic> json) =
      _$QuizModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'course_id')
  String get courseId;
  @override
  @JsonKey(name: 'lesson_id')
  String? get lessonId;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'quiz_type')
  QuizType get quizType;
  @override
  @JsonKey(name: 'passing_score')
  int get passingScore;
  @override
  @JsonKey(name: 'time_limit')
  int? get timeLimit;
  @override
  @JsonKey(name: 'questions_count')
  int get questionsCount;
  @override
  @JsonKey(name: 'max_attempts')
  int? get maxAttempts;
  @override
  @JsonKey(name: 'shuffle_questions')
  bool get shuffleQuestions;
  @override
  @JsonKey(name: 'shuffle_answers')
  bool get shuffleAnswers;
  @override
  @JsonKey(name: 'show_correct_answers')
  bool get showCorrectAnswers;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of QuizModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizModelImplCopyWith<_$QuizModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
