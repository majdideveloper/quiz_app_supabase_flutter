// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QuizEntity {
  String get id => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String? get lessonId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  QuizType get quizType => throw _privateConstructorUsedError;
  int get passingScore => throw _privateConstructorUsedError;
  int? get timeLimit => throw _privateConstructorUsedError;
  int get questionsCount => throw _privateConstructorUsedError;
  int? get maxAttempts => throw _privateConstructorUsedError;
  int get orderIndex => throw _privateConstructorUsedError;
  bool get isRequired => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of QuizEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizEntityCopyWith<QuizEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizEntityCopyWith<$Res> {
  factory $QuizEntityCopyWith(
    QuizEntity value,
    $Res Function(QuizEntity) then,
  ) = _$QuizEntityCopyWithImpl<$Res, QuizEntity>;
  @useResult
  $Res call({
    String id,
    String courseId,
    String? lessonId,
    String title,
    String description,
    QuizType quizType,
    int passingScore,
    int? timeLimit,
    int questionsCount,
    int? maxAttempts,
    int orderIndex,
    bool isRequired,
    DateTime createdAt,
  });
}

/// @nodoc
class _$QuizEntityCopyWithImpl<$Res, $Val extends QuizEntity>
    implements $QuizEntityCopyWith<$Res> {
  _$QuizEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizEntity
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
abstract class _$$QuizEntityImplCopyWith<$Res>
    implements $QuizEntityCopyWith<$Res> {
  factory _$$QuizEntityImplCopyWith(
    _$QuizEntityImpl value,
    $Res Function(_$QuizEntityImpl) then,
  ) = __$$QuizEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String courseId,
    String? lessonId,
    String title,
    String description,
    QuizType quizType,
    int passingScore,
    int? timeLimit,
    int questionsCount,
    int? maxAttempts,
    int orderIndex,
    bool isRequired,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$QuizEntityImplCopyWithImpl<$Res>
    extends _$QuizEntityCopyWithImpl<$Res, _$QuizEntityImpl>
    implements _$$QuizEntityImplCopyWith<$Res> {
  __$$QuizEntityImplCopyWithImpl(
    _$QuizEntityImpl _value,
    $Res Function(_$QuizEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizEntity
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
    Object? orderIndex = null,
    Object? isRequired = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$QuizEntityImpl(
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

class _$QuizEntityImpl extends _QuizEntity {
  const _$QuizEntityImpl({
    required this.id,
    required this.courseId,
    this.lessonId,
    required this.title,
    this.description = '',
    this.quizType = QuizType.lesson,
    this.passingScore = 70,
    this.timeLimit,
    this.questionsCount = 0,
    this.maxAttempts,
    this.orderIndex = 0,
    this.isRequired = true,
    required this.createdAt,
  }) : super._();

  @override
  final String id;
  @override
  final String courseId;
  @override
  final String? lessonId;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final QuizType quizType;
  @override
  @JsonKey()
  final int passingScore;
  @override
  final int? timeLimit;
  @override
  @JsonKey()
  final int questionsCount;
  @override
  final int? maxAttempts;
  @override
  @JsonKey()
  final int orderIndex;
  @override
  @JsonKey()
  final bool isRequired;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'QuizEntity(id: $id, courseId: $courseId, lessonId: $lessonId, title: $title, description: $description, quizType: $quizType, passingScore: $passingScore, timeLimit: $timeLimit, questionsCount: $questionsCount, maxAttempts: $maxAttempts, orderIndex: $orderIndex, isRequired: $isRequired, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizEntityImpl &&
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
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

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
    orderIndex,
    isRequired,
    createdAt,
  );

  /// Create a copy of QuizEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizEntityImplCopyWith<_$QuizEntityImpl> get copyWith =>
      __$$QuizEntityImplCopyWithImpl<_$QuizEntityImpl>(this, _$identity);
}

abstract class _QuizEntity extends QuizEntity {
  const factory _QuizEntity({
    required final String id,
    required final String courseId,
    final String? lessonId,
    required final String title,
    final String description,
    final QuizType quizType,
    final int passingScore,
    final int? timeLimit,
    final int questionsCount,
    final int? maxAttempts,
    final int orderIndex,
    final bool isRequired,
    required final DateTime createdAt,
  }) = _$QuizEntityImpl;
  const _QuizEntity._() : super._();

  @override
  String get id;
  @override
  String get courseId;
  @override
  String? get lessonId;
  @override
  String get title;
  @override
  String get description;
  @override
  QuizType get quizType;
  @override
  int get passingScore;
  @override
  int? get timeLimit;
  @override
  int get questionsCount;
  @override
  int? get maxAttempts;
  @override
  int get orderIndex;
  @override
  bool get isRequired;
  @override
  DateTime get createdAt;

  /// Create a copy of QuizEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizEntityImplCopyWith<_$QuizEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
