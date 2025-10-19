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
  @JsonKey(name: 'time_limit_minutes')
  int? get timeLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_attempts')
  int? get maxAttempts => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_index')
  int get orderIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_required')
  bool get isRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

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
    @JsonKey(name: 'time_limit_minutes') int? timeLimit,
    @JsonKey(name: 'max_attempts') int? maxAttempts,
    @JsonKey(name: 'order_index') int orderIndex,
    @JsonKey(name: 'is_required') bool isRequired,
    @JsonKey(name: 'created_at') DateTime createdAt,
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
    Object? maxAttempts = freezed,
    Object? orderIndex = null,
    Object? isRequired = null,
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
            maxAttempts:
                freezed == maxAttempts
                    ? _value.maxAttempts
                    : maxAttempts // ignore: cast_nullable_to_non_nullable
                        as int?,
            orderIndex:
                null == orderIndex
                    ? _value.orderIndex
                    : orderIndex // ignore: cast_nullable_to_non_nullable
                        as int,
            isRequired:
                null == isRequired
                    ? _value.isRequired
                    : isRequired // ignore: cast_nullable_to_non_nullable
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
    @JsonKey(name: 'time_limit_minutes') int? timeLimit,
    @JsonKey(name: 'max_attempts') int? maxAttempts,
    @JsonKey(name: 'order_index') int orderIndex,
    @JsonKey(name: 'is_required') bool isRequired,
    @JsonKey(name: 'created_at') DateTime createdAt,
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
    Object? maxAttempts = freezed,
    Object? orderIndex = null,
    Object? isRequired = null,
    Object? createdAt = null,
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
        maxAttempts:
            freezed == maxAttempts
                ? _value.maxAttempts
                : maxAttempts // ignore: cast_nullable_to_non_nullable
                    as int?,
        orderIndex:
            null == orderIndex
                ? _value.orderIndex
                : orderIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        isRequired:
            null == isRequired
                ? _value.isRequired
                : isRequired // ignore: cast_nullable_to_non_nullable
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
class _$QuizModelImpl extends _QuizModel {
  const _$QuizModelImpl({
    required this.id,
    @JsonKey(name: 'course_id') required this.courseId,
    @JsonKey(name: 'lesson_id') this.lessonId,
    required this.title,
    this.description = '',
    @JsonKey(name: 'quiz_type') this.quizType = QuizType.lesson,
    @JsonKey(name: 'passing_score') this.passingScore = 70,
    @JsonKey(name: 'time_limit_minutes') this.timeLimit,
    @JsonKey(name: 'max_attempts') this.maxAttempts,
    @JsonKey(name: 'order_index') required this.orderIndex,
    @JsonKey(name: 'is_required') this.isRequired = true,
    @JsonKey(name: 'created_at') required this.createdAt,
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
  @JsonKey()
  final String description;
  @override
  @JsonKey(name: 'quiz_type')
  final QuizType quizType;
  @override
  @JsonKey(name: 'passing_score')
  final int passingScore;
  @override
  @JsonKey(name: 'time_limit_minutes')
  final int? timeLimit;
  @override
  @JsonKey(name: 'max_attempts')
  final int? maxAttempts;
  @override
  @JsonKey(name: 'order_index')
  final int orderIndex;
  @override
  @JsonKey(name: 'is_required')
  final bool isRequired;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'QuizModel(id: $id, courseId: $courseId, lessonId: $lessonId, title: $title, description: $description, quizType: $quizType, passingScore: $passingScore, timeLimit: $timeLimit, maxAttempts: $maxAttempts, orderIndex: $orderIndex, isRequired: $isRequired, createdAt: $createdAt)';
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
            (identical(other.maxAttempts, maxAttempts) ||
                other.maxAttempts == maxAttempts) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
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
    maxAttempts,
    orderIndex,
    isRequired,
    createdAt,
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
    final String description,
    @JsonKey(name: 'quiz_type') final QuizType quizType,
    @JsonKey(name: 'passing_score') final int passingScore,
    @JsonKey(name: 'time_limit_minutes') final int? timeLimit,
    @JsonKey(name: 'max_attempts') final int? maxAttempts,
    @JsonKey(name: 'order_index') required final int orderIndex,
    @JsonKey(name: 'is_required') final bool isRequired,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
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
  @JsonKey(name: 'time_limit_minutes')
  int? get timeLimit;
  @override
  @JsonKey(name: 'max_attempts')
  int? get maxAttempts;
  @override
  @JsonKey(name: 'order_index')
  int get orderIndex;
  @override
  @JsonKey(name: 'is_required')
  bool get isRequired;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of QuizModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizModelImplCopyWith<_$QuizModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
