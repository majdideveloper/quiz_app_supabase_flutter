// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QuizEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String courseId) loadCourseQuizzes,
    required TResult Function(String quizId) loadQuiz,
    required TResult Function() startQuiz,
    required TResult Function(String questionId, List<String> selectedAnswerIds)
    answerQuestion,
    required TResult Function() navigateToPreviousQuestion,
    required TResult Function() navigateToNextQuestion,
    required TResult Function() timerTick,
    required TResult Function() submitQuiz,
    required TResult Function(String resultId) loadQuizResult,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String courseId)? loadCourseQuizzes,
    TResult? Function(String quizId)? loadQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult? Function()? navigateToPreviousQuestion,
    TResult? Function()? navigateToNextQuestion,
    TResult? Function()? timerTick,
    TResult? Function()? submitQuiz,
    TResult? Function(String resultId)? loadQuizResult,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String courseId)? loadCourseQuizzes,
    TResult Function(String quizId)? loadQuiz,
    TResult Function()? startQuiz,
    TResult Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult Function()? navigateToPreviousQuestion,
    TResult Function()? navigateToNextQuestion,
    TResult Function()? timerTick,
    TResult Function()? submitQuiz,
    TResult Function(String resultId)? loadQuizResult,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCourseQuizzesEvent value) loadCourseQuizzes,
    required TResult Function(LoadQuizEvent value) loadQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(NavigateToPreviousQuestionEvent value)
    navigateToPreviousQuestion,
    required TResult Function(NavigateToNextQuestionEvent value)
    navigateToNextQuestion,
    required TResult Function(TimerTickEvent value) timerTick,
    required TResult Function(SubmitQuizEvent value) submitQuiz,
    required TResult Function(LoadQuizResultEvent value) loadQuizResult,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult? Function(LoadQuizEvent value)? loadQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult? Function(NavigateToNextQuestionEvent value)?
    navigateToNextQuestion,
    TResult? Function(TimerTickEvent value)? timerTick,
    TResult? Function(SubmitQuizEvent value)? submitQuiz,
    TResult? Function(LoadQuizResultEvent value)? loadQuizResult,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult Function(LoadQuizEvent value)? loadQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult Function(NavigateToNextQuestionEvent value)? navigateToNextQuestion,
    TResult Function(TimerTickEvent value)? timerTick,
    TResult Function(SubmitQuizEvent value)? submitQuiz,
    TResult Function(LoadQuizResultEvent value)? loadQuizResult,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizEventCopyWith<$Res> {
  factory $QuizEventCopyWith(QuizEvent value, $Res Function(QuizEvent) then) =
      _$QuizEventCopyWithImpl<$Res, QuizEvent>;
}

/// @nodoc
class _$QuizEventCopyWithImpl<$Res, $Val extends QuizEvent>
    implements $QuizEventCopyWith<$Res> {
  _$QuizEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadCourseQuizzesEventImplCopyWith<$Res> {
  factory _$$LoadCourseQuizzesEventImplCopyWith(
    _$LoadCourseQuizzesEventImpl value,
    $Res Function(_$LoadCourseQuizzesEventImpl) then,
  ) = __$$LoadCourseQuizzesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String courseId});
}

/// @nodoc
class __$$LoadCourseQuizzesEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$LoadCourseQuizzesEventImpl>
    implements _$$LoadCourseQuizzesEventImplCopyWith<$Res> {
  __$$LoadCourseQuizzesEventImplCopyWithImpl(
    _$LoadCourseQuizzesEventImpl _value,
    $Res Function(_$LoadCourseQuizzesEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? courseId = null}) {
    return _then(
      _$LoadCourseQuizzesEventImpl(
        null == courseId
            ? _value.courseId
            : courseId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadCourseQuizzesEventImpl implements LoadCourseQuizzesEvent {
  const _$LoadCourseQuizzesEventImpl(this.courseId);

  @override
  final String courseId;

  @override
  String toString() {
    return 'QuizEvent.loadCourseQuizzes(courseId: $courseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadCourseQuizzesEventImpl &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId);

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadCourseQuizzesEventImplCopyWith<_$LoadCourseQuizzesEventImpl>
  get copyWith =>
      __$$LoadCourseQuizzesEventImplCopyWithImpl<_$LoadCourseQuizzesEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String courseId) loadCourseQuizzes,
    required TResult Function(String quizId) loadQuiz,
    required TResult Function() startQuiz,
    required TResult Function(String questionId, List<String> selectedAnswerIds)
    answerQuestion,
    required TResult Function() navigateToPreviousQuestion,
    required TResult Function() navigateToNextQuestion,
    required TResult Function() timerTick,
    required TResult Function() submitQuiz,
    required TResult Function(String resultId) loadQuizResult,
  }) {
    return loadCourseQuizzes(courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String courseId)? loadCourseQuizzes,
    TResult? Function(String quizId)? loadQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult? Function()? navigateToPreviousQuestion,
    TResult? Function()? navigateToNextQuestion,
    TResult? Function()? timerTick,
    TResult? Function()? submitQuiz,
    TResult? Function(String resultId)? loadQuizResult,
  }) {
    return loadCourseQuizzes?.call(courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String courseId)? loadCourseQuizzes,
    TResult Function(String quizId)? loadQuiz,
    TResult Function()? startQuiz,
    TResult Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult Function()? navigateToPreviousQuestion,
    TResult Function()? navigateToNextQuestion,
    TResult Function()? timerTick,
    TResult Function()? submitQuiz,
    TResult Function(String resultId)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (loadCourseQuizzes != null) {
      return loadCourseQuizzes(courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCourseQuizzesEvent value) loadCourseQuizzes,
    required TResult Function(LoadQuizEvent value) loadQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(NavigateToPreviousQuestionEvent value)
    navigateToPreviousQuestion,
    required TResult Function(NavigateToNextQuestionEvent value)
    navigateToNextQuestion,
    required TResult Function(TimerTickEvent value) timerTick,
    required TResult Function(SubmitQuizEvent value) submitQuiz,
    required TResult Function(LoadQuizResultEvent value) loadQuizResult,
  }) {
    return loadCourseQuizzes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult? Function(LoadQuizEvent value)? loadQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult? Function(NavigateToNextQuestionEvent value)?
    navigateToNextQuestion,
    TResult? Function(TimerTickEvent value)? timerTick,
    TResult? Function(SubmitQuizEvent value)? submitQuiz,
    TResult? Function(LoadQuizResultEvent value)? loadQuizResult,
  }) {
    return loadCourseQuizzes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult Function(LoadQuizEvent value)? loadQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult Function(NavigateToNextQuestionEvent value)? navigateToNextQuestion,
    TResult Function(TimerTickEvent value)? timerTick,
    TResult Function(SubmitQuizEvent value)? submitQuiz,
    TResult Function(LoadQuizResultEvent value)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (loadCourseQuizzes != null) {
      return loadCourseQuizzes(this);
    }
    return orElse();
  }
}

abstract class LoadCourseQuizzesEvent implements QuizEvent {
  const factory LoadCourseQuizzesEvent(final String courseId) =
      _$LoadCourseQuizzesEventImpl;

  String get courseId;

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadCourseQuizzesEventImplCopyWith<_$LoadCourseQuizzesEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadQuizEventImplCopyWith<$Res> {
  factory _$$LoadQuizEventImplCopyWith(
    _$LoadQuizEventImpl value,
    $Res Function(_$LoadQuizEventImpl) then,
  ) = __$$LoadQuizEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String quizId});
}

/// @nodoc
class __$$LoadQuizEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$LoadQuizEventImpl>
    implements _$$LoadQuizEventImplCopyWith<$Res> {
  __$$LoadQuizEventImplCopyWithImpl(
    _$LoadQuizEventImpl _value,
    $Res Function(_$LoadQuizEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? quizId = null}) {
    return _then(
      _$LoadQuizEventImpl(
        null == quizId
            ? _value.quizId
            : quizId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadQuizEventImpl implements LoadQuizEvent {
  const _$LoadQuizEventImpl(this.quizId);

  @override
  final String quizId;

  @override
  String toString() {
    return 'QuizEvent.loadQuiz(quizId: $quizId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadQuizEventImpl &&
            (identical(other.quizId, quizId) || other.quizId == quizId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quizId);

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadQuizEventImplCopyWith<_$LoadQuizEventImpl> get copyWith =>
      __$$LoadQuizEventImplCopyWithImpl<_$LoadQuizEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String courseId) loadCourseQuizzes,
    required TResult Function(String quizId) loadQuiz,
    required TResult Function() startQuiz,
    required TResult Function(String questionId, List<String> selectedAnswerIds)
    answerQuestion,
    required TResult Function() navigateToPreviousQuestion,
    required TResult Function() navigateToNextQuestion,
    required TResult Function() timerTick,
    required TResult Function() submitQuiz,
    required TResult Function(String resultId) loadQuizResult,
  }) {
    return loadQuiz(quizId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String courseId)? loadCourseQuizzes,
    TResult? Function(String quizId)? loadQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult? Function()? navigateToPreviousQuestion,
    TResult? Function()? navigateToNextQuestion,
    TResult? Function()? timerTick,
    TResult? Function()? submitQuiz,
    TResult? Function(String resultId)? loadQuizResult,
  }) {
    return loadQuiz?.call(quizId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String courseId)? loadCourseQuizzes,
    TResult Function(String quizId)? loadQuiz,
    TResult Function()? startQuiz,
    TResult Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult Function()? navigateToPreviousQuestion,
    TResult Function()? navigateToNextQuestion,
    TResult Function()? timerTick,
    TResult Function()? submitQuiz,
    TResult Function(String resultId)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (loadQuiz != null) {
      return loadQuiz(quizId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCourseQuizzesEvent value) loadCourseQuizzes,
    required TResult Function(LoadQuizEvent value) loadQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(NavigateToPreviousQuestionEvent value)
    navigateToPreviousQuestion,
    required TResult Function(NavigateToNextQuestionEvent value)
    navigateToNextQuestion,
    required TResult Function(TimerTickEvent value) timerTick,
    required TResult Function(SubmitQuizEvent value) submitQuiz,
    required TResult Function(LoadQuizResultEvent value) loadQuizResult,
  }) {
    return loadQuiz(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult? Function(LoadQuizEvent value)? loadQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult? Function(NavigateToNextQuestionEvent value)?
    navigateToNextQuestion,
    TResult? Function(TimerTickEvent value)? timerTick,
    TResult? Function(SubmitQuizEvent value)? submitQuiz,
    TResult? Function(LoadQuizResultEvent value)? loadQuizResult,
  }) {
    return loadQuiz?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult Function(LoadQuizEvent value)? loadQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult Function(NavigateToNextQuestionEvent value)? navigateToNextQuestion,
    TResult Function(TimerTickEvent value)? timerTick,
    TResult Function(SubmitQuizEvent value)? submitQuiz,
    TResult Function(LoadQuizResultEvent value)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (loadQuiz != null) {
      return loadQuiz(this);
    }
    return orElse();
  }
}

abstract class LoadQuizEvent implements QuizEvent {
  const factory LoadQuizEvent(final String quizId) = _$LoadQuizEventImpl;

  String get quizId;

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadQuizEventImplCopyWith<_$LoadQuizEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartQuizEventImplCopyWith<$Res> {
  factory _$$StartQuizEventImplCopyWith(
    _$StartQuizEventImpl value,
    $Res Function(_$StartQuizEventImpl) then,
  ) = __$$StartQuizEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartQuizEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$StartQuizEventImpl>
    implements _$$StartQuizEventImplCopyWith<$Res> {
  __$$StartQuizEventImplCopyWithImpl(
    _$StartQuizEventImpl _value,
    $Res Function(_$StartQuizEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartQuizEventImpl implements StartQuizEvent {
  const _$StartQuizEventImpl();

  @override
  String toString() {
    return 'QuizEvent.startQuiz()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartQuizEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String courseId) loadCourseQuizzes,
    required TResult Function(String quizId) loadQuiz,
    required TResult Function() startQuiz,
    required TResult Function(String questionId, List<String> selectedAnswerIds)
    answerQuestion,
    required TResult Function() navigateToPreviousQuestion,
    required TResult Function() navigateToNextQuestion,
    required TResult Function() timerTick,
    required TResult Function() submitQuiz,
    required TResult Function(String resultId) loadQuizResult,
  }) {
    return startQuiz();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String courseId)? loadCourseQuizzes,
    TResult? Function(String quizId)? loadQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult? Function()? navigateToPreviousQuestion,
    TResult? Function()? navigateToNextQuestion,
    TResult? Function()? timerTick,
    TResult? Function()? submitQuiz,
    TResult? Function(String resultId)? loadQuizResult,
  }) {
    return startQuiz?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String courseId)? loadCourseQuizzes,
    TResult Function(String quizId)? loadQuiz,
    TResult Function()? startQuiz,
    TResult Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult Function()? navigateToPreviousQuestion,
    TResult Function()? navigateToNextQuestion,
    TResult Function()? timerTick,
    TResult Function()? submitQuiz,
    TResult Function(String resultId)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (startQuiz != null) {
      return startQuiz();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCourseQuizzesEvent value) loadCourseQuizzes,
    required TResult Function(LoadQuizEvent value) loadQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(NavigateToPreviousQuestionEvent value)
    navigateToPreviousQuestion,
    required TResult Function(NavigateToNextQuestionEvent value)
    navigateToNextQuestion,
    required TResult Function(TimerTickEvent value) timerTick,
    required TResult Function(SubmitQuizEvent value) submitQuiz,
    required TResult Function(LoadQuizResultEvent value) loadQuizResult,
  }) {
    return startQuiz(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult? Function(LoadQuizEvent value)? loadQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult? Function(NavigateToNextQuestionEvent value)?
    navigateToNextQuestion,
    TResult? Function(TimerTickEvent value)? timerTick,
    TResult? Function(SubmitQuizEvent value)? submitQuiz,
    TResult? Function(LoadQuizResultEvent value)? loadQuizResult,
  }) {
    return startQuiz?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult Function(LoadQuizEvent value)? loadQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult Function(NavigateToNextQuestionEvent value)? navigateToNextQuestion,
    TResult Function(TimerTickEvent value)? timerTick,
    TResult Function(SubmitQuizEvent value)? submitQuiz,
    TResult Function(LoadQuizResultEvent value)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (startQuiz != null) {
      return startQuiz(this);
    }
    return orElse();
  }
}

abstract class StartQuizEvent implements QuizEvent {
  const factory StartQuizEvent() = _$StartQuizEventImpl;
}

/// @nodoc
abstract class _$$AnswerQuestionEventImplCopyWith<$Res> {
  factory _$$AnswerQuestionEventImplCopyWith(
    _$AnswerQuestionEventImpl value,
    $Res Function(_$AnswerQuestionEventImpl) then,
  ) = __$$AnswerQuestionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String questionId, List<String> selectedAnswerIds});
}

/// @nodoc
class __$$AnswerQuestionEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$AnswerQuestionEventImpl>
    implements _$$AnswerQuestionEventImplCopyWith<$Res> {
  __$$AnswerQuestionEventImplCopyWithImpl(
    _$AnswerQuestionEventImpl _value,
    $Res Function(_$AnswerQuestionEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? questionId = null, Object? selectedAnswerIds = null}) {
    return _then(
      _$AnswerQuestionEventImpl(
        questionId:
            null == questionId
                ? _value.questionId
                : questionId // ignore: cast_nullable_to_non_nullable
                    as String,
        selectedAnswerIds:
            null == selectedAnswerIds
                ? _value._selectedAnswerIds
                : selectedAnswerIds // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$AnswerQuestionEventImpl implements AnswerQuestionEvent {
  const _$AnswerQuestionEventImpl({
    required this.questionId,
    required final List<String> selectedAnswerIds,
  }) : _selectedAnswerIds = selectedAnswerIds;

  @override
  final String questionId;
  final List<String> _selectedAnswerIds;
  @override
  List<String> get selectedAnswerIds {
    if (_selectedAnswerIds is EqualUnmodifiableListView)
      return _selectedAnswerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedAnswerIds);
  }

  @override
  String toString() {
    return 'QuizEvent.answerQuestion(questionId: $questionId, selectedAnswerIds: $selectedAnswerIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerQuestionEventImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            const DeepCollectionEquality().equals(
              other._selectedAnswerIds,
              _selectedAnswerIds,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    questionId,
    const DeepCollectionEquality().hash(_selectedAnswerIds),
  );

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerQuestionEventImplCopyWith<_$AnswerQuestionEventImpl> get copyWith =>
      __$$AnswerQuestionEventImplCopyWithImpl<_$AnswerQuestionEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String courseId) loadCourseQuizzes,
    required TResult Function(String quizId) loadQuiz,
    required TResult Function() startQuiz,
    required TResult Function(String questionId, List<String> selectedAnswerIds)
    answerQuestion,
    required TResult Function() navigateToPreviousQuestion,
    required TResult Function() navigateToNextQuestion,
    required TResult Function() timerTick,
    required TResult Function() submitQuiz,
    required TResult Function(String resultId) loadQuizResult,
  }) {
    return answerQuestion(questionId, selectedAnswerIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String courseId)? loadCourseQuizzes,
    TResult? Function(String quizId)? loadQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult? Function()? navigateToPreviousQuestion,
    TResult? Function()? navigateToNextQuestion,
    TResult? Function()? timerTick,
    TResult? Function()? submitQuiz,
    TResult? Function(String resultId)? loadQuizResult,
  }) {
    return answerQuestion?.call(questionId, selectedAnswerIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String courseId)? loadCourseQuizzes,
    TResult Function(String quizId)? loadQuiz,
    TResult Function()? startQuiz,
    TResult Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult Function()? navigateToPreviousQuestion,
    TResult Function()? navigateToNextQuestion,
    TResult Function()? timerTick,
    TResult Function()? submitQuiz,
    TResult Function(String resultId)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (answerQuestion != null) {
      return answerQuestion(questionId, selectedAnswerIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCourseQuizzesEvent value) loadCourseQuizzes,
    required TResult Function(LoadQuizEvent value) loadQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(NavigateToPreviousQuestionEvent value)
    navigateToPreviousQuestion,
    required TResult Function(NavigateToNextQuestionEvent value)
    navigateToNextQuestion,
    required TResult Function(TimerTickEvent value) timerTick,
    required TResult Function(SubmitQuizEvent value) submitQuiz,
    required TResult Function(LoadQuizResultEvent value) loadQuizResult,
  }) {
    return answerQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult? Function(LoadQuizEvent value)? loadQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult? Function(NavigateToNextQuestionEvent value)?
    navigateToNextQuestion,
    TResult? Function(TimerTickEvent value)? timerTick,
    TResult? Function(SubmitQuizEvent value)? submitQuiz,
    TResult? Function(LoadQuizResultEvent value)? loadQuizResult,
  }) {
    return answerQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult Function(LoadQuizEvent value)? loadQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult Function(NavigateToNextQuestionEvent value)? navigateToNextQuestion,
    TResult Function(TimerTickEvent value)? timerTick,
    TResult Function(SubmitQuizEvent value)? submitQuiz,
    TResult Function(LoadQuizResultEvent value)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (answerQuestion != null) {
      return answerQuestion(this);
    }
    return orElse();
  }
}

abstract class AnswerQuestionEvent implements QuizEvent {
  const factory AnswerQuestionEvent({
    required final String questionId,
    required final List<String> selectedAnswerIds,
  }) = _$AnswerQuestionEventImpl;

  String get questionId;
  List<String> get selectedAnswerIds;

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerQuestionEventImplCopyWith<_$AnswerQuestionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NavigateToPreviousQuestionEventImplCopyWith<$Res> {
  factory _$$NavigateToPreviousQuestionEventImplCopyWith(
    _$NavigateToPreviousQuestionEventImpl value,
    $Res Function(_$NavigateToPreviousQuestionEventImpl) then,
  ) = __$$NavigateToPreviousQuestionEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NavigateToPreviousQuestionEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$NavigateToPreviousQuestionEventImpl>
    implements _$$NavigateToPreviousQuestionEventImplCopyWith<$Res> {
  __$$NavigateToPreviousQuestionEventImplCopyWithImpl(
    _$NavigateToPreviousQuestionEventImpl _value,
    $Res Function(_$NavigateToPreviousQuestionEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NavigateToPreviousQuestionEventImpl
    implements NavigateToPreviousQuestionEvent {
  const _$NavigateToPreviousQuestionEventImpl();

  @override
  String toString() {
    return 'QuizEvent.navigateToPreviousQuestion()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigateToPreviousQuestionEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String courseId) loadCourseQuizzes,
    required TResult Function(String quizId) loadQuiz,
    required TResult Function() startQuiz,
    required TResult Function(String questionId, List<String> selectedAnswerIds)
    answerQuestion,
    required TResult Function() navigateToPreviousQuestion,
    required TResult Function() navigateToNextQuestion,
    required TResult Function() timerTick,
    required TResult Function() submitQuiz,
    required TResult Function(String resultId) loadQuizResult,
  }) {
    return navigateToPreviousQuestion();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String courseId)? loadCourseQuizzes,
    TResult? Function(String quizId)? loadQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult? Function()? navigateToPreviousQuestion,
    TResult? Function()? navigateToNextQuestion,
    TResult? Function()? timerTick,
    TResult? Function()? submitQuiz,
    TResult? Function(String resultId)? loadQuizResult,
  }) {
    return navigateToPreviousQuestion?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String courseId)? loadCourseQuizzes,
    TResult Function(String quizId)? loadQuiz,
    TResult Function()? startQuiz,
    TResult Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult Function()? navigateToPreviousQuestion,
    TResult Function()? navigateToNextQuestion,
    TResult Function()? timerTick,
    TResult Function()? submitQuiz,
    TResult Function(String resultId)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (navigateToPreviousQuestion != null) {
      return navigateToPreviousQuestion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCourseQuizzesEvent value) loadCourseQuizzes,
    required TResult Function(LoadQuizEvent value) loadQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(NavigateToPreviousQuestionEvent value)
    navigateToPreviousQuestion,
    required TResult Function(NavigateToNextQuestionEvent value)
    navigateToNextQuestion,
    required TResult Function(TimerTickEvent value) timerTick,
    required TResult Function(SubmitQuizEvent value) submitQuiz,
    required TResult Function(LoadQuizResultEvent value) loadQuizResult,
  }) {
    return navigateToPreviousQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult? Function(LoadQuizEvent value)? loadQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult? Function(NavigateToNextQuestionEvent value)?
    navigateToNextQuestion,
    TResult? Function(TimerTickEvent value)? timerTick,
    TResult? Function(SubmitQuizEvent value)? submitQuiz,
    TResult? Function(LoadQuizResultEvent value)? loadQuizResult,
  }) {
    return navigateToPreviousQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult Function(LoadQuizEvent value)? loadQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult Function(NavigateToNextQuestionEvent value)? navigateToNextQuestion,
    TResult Function(TimerTickEvent value)? timerTick,
    TResult Function(SubmitQuizEvent value)? submitQuiz,
    TResult Function(LoadQuizResultEvent value)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (navigateToPreviousQuestion != null) {
      return navigateToPreviousQuestion(this);
    }
    return orElse();
  }
}

abstract class NavigateToPreviousQuestionEvent implements QuizEvent {
  const factory NavigateToPreviousQuestionEvent() =
      _$NavigateToPreviousQuestionEventImpl;
}

/// @nodoc
abstract class _$$NavigateToNextQuestionEventImplCopyWith<$Res> {
  factory _$$NavigateToNextQuestionEventImplCopyWith(
    _$NavigateToNextQuestionEventImpl value,
    $Res Function(_$NavigateToNextQuestionEventImpl) then,
  ) = __$$NavigateToNextQuestionEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NavigateToNextQuestionEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$NavigateToNextQuestionEventImpl>
    implements _$$NavigateToNextQuestionEventImplCopyWith<$Res> {
  __$$NavigateToNextQuestionEventImplCopyWithImpl(
    _$NavigateToNextQuestionEventImpl _value,
    $Res Function(_$NavigateToNextQuestionEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NavigateToNextQuestionEventImpl implements NavigateToNextQuestionEvent {
  const _$NavigateToNextQuestionEventImpl();

  @override
  String toString() {
    return 'QuizEvent.navigateToNextQuestion()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigateToNextQuestionEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String courseId) loadCourseQuizzes,
    required TResult Function(String quizId) loadQuiz,
    required TResult Function() startQuiz,
    required TResult Function(String questionId, List<String> selectedAnswerIds)
    answerQuestion,
    required TResult Function() navigateToPreviousQuestion,
    required TResult Function() navigateToNextQuestion,
    required TResult Function() timerTick,
    required TResult Function() submitQuiz,
    required TResult Function(String resultId) loadQuizResult,
  }) {
    return navigateToNextQuestion();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String courseId)? loadCourseQuizzes,
    TResult? Function(String quizId)? loadQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult? Function()? navigateToPreviousQuestion,
    TResult? Function()? navigateToNextQuestion,
    TResult? Function()? timerTick,
    TResult? Function()? submitQuiz,
    TResult? Function(String resultId)? loadQuizResult,
  }) {
    return navigateToNextQuestion?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String courseId)? loadCourseQuizzes,
    TResult Function(String quizId)? loadQuiz,
    TResult Function()? startQuiz,
    TResult Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult Function()? navigateToPreviousQuestion,
    TResult Function()? navigateToNextQuestion,
    TResult Function()? timerTick,
    TResult Function()? submitQuiz,
    TResult Function(String resultId)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (navigateToNextQuestion != null) {
      return navigateToNextQuestion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCourseQuizzesEvent value) loadCourseQuizzes,
    required TResult Function(LoadQuizEvent value) loadQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(NavigateToPreviousQuestionEvent value)
    navigateToPreviousQuestion,
    required TResult Function(NavigateToNextQuestionEvent value)
    navigateToNextQuestion,
    required TResult Function(TimerTickEvent value) timerTick,
    required TResult Function(SubmitQuizEvent value) submitQuiz,
    required TResult Function(LoadQuizResultEvent value) loadQuizResult,
  }) {
    return navigateToNextQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult? Function(LoadQuizEvent value)? loadQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult? Function(NavigateToNextQuestionEvent value)?
    navigateToNextQuestion,
    TResult? Function(TimerTickEvent value)? timerTick,
    TResult? Function(SubmitQuizEvent value)? submitQuiz,
    TResult? Function(LoadQuizResultEvent value)? loadQuizResult,
  }) {
    return navigateToNextQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult Function(LoadQuizEvent value)? loadQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult Function(NavigateToNextQuestionEvent value)? navigateToNextQuestion,
    TResult Function(TimerTickEvent value)? timerTick,
    TResult Function(SubmitQuizEvent value)? submitQuiz,
    TResult Function(LoadQuizResultEvent value)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (navigateToNextQuestion != null) {
      return navigateToNextQuestion(this);
    }
    return orElse();
  }
}

abstract class NavigateToNextQuestionEvent implements QuizEvent {
  const factory NavigateToNextQuestionEvent() =
      _$NavigateToNextQuestionEventImpl;
}

/// @nodoc
abstract class _$$TimerTickEventImplCopyWith<$Res> {
  factory _$$TimerTickEventImplCopyWith(
    _$TimerTickEventImpl value,
    $Res Function(_$TimerTickEventImpl) then,
  ) = __$$TimerTickEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerTickEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$TimerTickEventImpl>
    implements _$$TimerTickEventImplCopyWith<$Res> {
  __$$TimerTickEventImplCopyWithImpl(
    _$TimerTickEventImpl _value,
    $Res Function(_$TimerTickEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerTickEventImpl implements TimerTickEvent {
  const _$TimerTickEventImpl();

  @override
  String toString() {
    return 'QuizEvent.timerTick()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerTickEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String courseId) loadCourseQuizzes,
    required TResult Function(String quizId) loadQuiz,
    required TResult Function() startQuiz,
    required TResult Function(String questionId, List<String> selectedAnswerIds)
    answerQuestion,
    required TResult Function() navigateToPreviousQuestion,
    required TResult Function() navigateToNextQuestion,
    required TResult Function() timerTick,
    required TResult Function() submitQuiz,
    required TResult Function(String resultId) loadQuizResult,
  }) {
    return timerTick();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String courseId)? loadCourseQuizzes,
    TResult? Function(String quizId)? loadQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult? Function()? navigateToPreviousQuestion,
    TResult? Function()? navigateToNextQuestion,
    TResult? Function()? timerTick,
    TResult? Function()? submitQuiz,
    TResult? Function(String resultId)? loadQuizResult,
  }) {
    return timerTick?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String courseId)? loadCourseQuizzes,
    TResult Function(String quizId)? loadQuiz,
    TResult Function()? startQuiz,
    TResult Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult Function()? navigateToPreviousQuestion,
    TResult Function()? navigateToNextQuestion,
    TResult Function()? timerTick,
    TResult Function()? submitQuiz,
    TResult Function(String resultId)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (timerTick != null) {
      return timerTick();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCourseQuizzesEvent value) loadCourseQuizzes,
    required TResult Function(LoadQuizEvent value) loadQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(NavigateToPreviousQuestionEvent value)
    navigateToPreviousQuestion,
    required TResult Function(NavigateToNextQuestionEvent value)
    navigateToNextQuestion,
    required TResult Function(TimerTickEvent value) timerTick,
    required TResult Function(SubmitQuizEvent value) submitQuiz,
    required TResult Function(LoadQuizResultEvent value) loadQuizResult,
  }) {
    return timerTick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult? Function(LoadQuizEvent value)? loadQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult? Function(NavigateToNextQuestionEvent value)?
    navigateToNextQuestion,
    TResult? Function(TimerTickEvent value)? timerTick,
    TResult? Function(SubmitQuizEvent value)? submitQuiz,
    TResult? Function(LoadQuizResultEvent value)? loadQuizResult,
  }) {
    return timerTick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult Function(LoadQuizEvent value)? loadQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult Function(NavigateToNextQuestionEvent value)? navigateToNextQuestion,
    TResult Function(TimerTickEvent value)? timerTick,
    TResult Function(SubmitQuizEvent value)? submitQuiz,
    TResult Function(LoadQuizResultEvent value)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (timerTick != null) {
      return timerTick(this);
    }
    return orElse();
  }
}

abstract class TimerTickEvent implements QuizEvent {
  const factory TimerTickEvent() = _$TimerTickEventImpl;
}

/// @nodoc
abstract class _$$SubmitQuizEventImplCopyWith<$Res> {
  factory _$$SubmitQuizEventImplCopyWith(
    _$SubmitQuizEventImpl value,
    $Res Function(_$SubmitQuizEventImpl) then,
  ) = __$$SubmitQuizEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitQuizEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$SubmitQuizEventImpl>
    implements _$$SubmitQuizEventImplCopyWith<$Res> {
  __$$SubmitQuizEventImplCopyWithImpl(
    _$SubmitQuizEventImpl _value,
    $Res Function(_$SubmitQuizEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmitQuizEventImpl implements SubmitQuizEvent {
  const _$SubmitQuizEventImpl();

  @override
  String toString() {
    return 'QuizEvent.submitQuiz()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitQuizEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String courseId) loadCourseQuizzes,
    required TResult Function(String quizId) loadQuiz,
    required TResult Function() startQuiz,
    required TResult Function(String questionId, List<String> selectedAnswerIds)
    answerQuestion,
    required TResult Function() navigateToPreviousQuestion,
    required TResult Function() navigateToNextQuestion,
    required TResult Function() timerTick,
    required TResult Function() submitQuiz,
    required TResult Function(String resultId) loadQuizResult,
  }) {
    return submitQuiz();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String courseId)? loadCourseQuizzes,
    TResult? Function(String quizId)? loadQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult? Function()? navigateToPreviousQuestion,
    TResult? Function()? navigateToNextQuestion,
    TResult? Function()? timerTick,
    TResult? Function()? submitQuiz,
    TResult? Function(String resultId)? loadQuizResult,
  }) {
    return submitQuiz?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String courseId)? loadCourseQuizzes,
    TResult Function(String quizId)? loadQuiz,
    TResult Function()? startQuiz,
    TResult Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult Function()? navigateToPreviousQuestion,
    TResult Function()? navigateToNextQuestion,
    TResult Function()? timerTick,
    TResult Function()? submitQuiz,
    TResult Function(String resultId)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (submitQuiz != null) {
      return submitQuiz();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCourseQuizzesEvent value) loadCourseQuizzes,
    required TResult Function(LoadQuizEvent value) loadQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(NavigateToPreviousQuestionEvent value)
    navigateToPreviousQuestion,
    required TResult Function(NavigateToNextQuestionEvent value)
    navigateToNextQuestion,
    required TResult Function(TimerTickEvent value) timerTick,
    required TResult Function(SubmitQuizEvent value) submitQuiz,
    required TResult Function(LoadQuizResultEvent value) loadQuizResult,
  }) {
    return submitQuiz(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult? Function(LoadQuizEvent value)? loadQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult? Function(NavigateToNextQuestionEvent value)?
    navigateToNextQuestion,
    TResult? Function(TimerTickEvent value)? timerTick,
    TResult? Function(SubmitQuizEvent value)? submitQuiz,
    TResult? Function(LoadQuizResultEvent value)? loadQuizResult,
  }) {
    return submitQuiz?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult Function(LoadQuizEvent value)? loadQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult Function(NavigateToNextQuestionEvent value)? navigateToNextQuestion,
    TResult Function(TimerTickEvent value)? timerTick,
    TResult Function(SubmitQuizEvent value)? submitQuiz,
    TResult Function(LoadQuizResultEvent value)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (submitQuiz != null) {
      return submitQuiz(this);
    }
    return orElse();
  }
}

abstract class SubmitQuizEvent implements QuizEvent {
  const factory SubmitQuizEvent() = _$SubmitQuizEventImpl;
}

/// @nodoc
abstract class _$$LoadQuizResultEventImplCopyWith<$Res> {
  factory _$$LoadQuizResultEventImplCopyWith(
    _$LoadQuizResultEventImpl value,
    $Res Function(_$LoadQuizResultEventImpl) then,
  ) = __$$LoadQuizResultEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String resultId});
}

/// @nodoc
class __$$LoadQuizResultEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$LoadQuizResultEventImpl>
    implements _$$LoadQuizResultEventImplCopyWith<$Res> {
  __$$LoadQuizResultEventImplCopyWithImpl(
    _$LoadQuizResultEventImpl _value,
    $Res Function(_$LoadQuizResultEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? resultId = null}) {
    return _then(
      _$LoadQuizResultEventImpl(
        null == resultId
            ? _value.resultId
            : resultId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadQuizResultEventImpl implements LoadQuizResultEvent {
  const _$LoadQuizResultEventImpl(this.resultId);

  @override
  final String resultId;

  @override
  String toString() {
    return 'QuizEvent.loadQuizResult(resultId: $resultId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadQuizResultEventImpl &&
            (identical(other.resultId, resultId) ||
                other.resultId == resultId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resultId);

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadQuizResultEventImplCopyWith<_$LoadQuizResultEventImpl> get copyWith =>
      __$$LoadQuizResultEventImplCopyWithImpl<_$LoadQuizResultEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String courseId) loadCourseQuizzes,
    required TResult Function(String quizId) loadQuiz,
    required TResult Function() startQuiz,
    required TResult Function(String questionId, List<String> selectedAnswerIds)
    answerQuestion,
    required TResult Function() navigateToPreviousQuestion,
    required TResult Function() navigateToNextQuestion,
    required TResult Function() timerTick,
    required TResult Function() submitQuiz,
    required TResult Function(String resultId) loadQuizResult,
  }) {
    return loadQuizResult(resultId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String courseId)? loadCourseQuizzes,
    TResult? Function(String quizId)? loadQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult? Function()? navigateToPreviousQuestion,
    TResult? Function()? navigateToNextQuestion,
    TResult? Function()? timerTick,
    TResult? Function()? submitQuiz,
    TResult? Function(String resultId)? loadQuizResult,
  }) {
    return loadQuizResult?.call(resultId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String courseId)? loadCourseQuizzes,
    TResult Function(String quizId)? loadQuiz,
    TResult Function()? startQuiz,
    TResult Function(String questionId, List<String> selectedAnswerIds)?
    answerQuestion,
    TResult Function()? navigateToPreviousQuestion,
    TResult Function()? navigateToNextQuestion,
    TResult Function()? timerTick,
    TResult Function()? submitQuiz,
    TResult Function(String resultId)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (loadQuizResult != null) {
      return loadQuizResult(resultId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCourseQuizzesEvent value) loadCourseQuizzes,
    required TResult Function(LoadQuizEvent value) loadQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(NavigateToPreviousQuestionEvent value)
    navigateToPreviousQuestion,
    required TResult Function(NavigateToNextQuestionEvent value)
    navigateToNextQuestion,
    required TResult Function(TimerTickEvent value) timerTick,
    required TResult Function(SubmitQuizEvent value) submitQuiz,
    required TResult Function(LoadQuizResultEvent value) loadQuizResult,
  }) {
    return loadQuizResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult? Function(LoadQuizEvent value)? loadQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult? Function(NavigateToNextQuestionEvent value)?
    navigateToNextQuestion,
    TResult? Function(TimerTickEvent value)? timerTick,
    TResult? Function(SubmitQuizEvent value)? submitQuiz,
    TResult? Function(LoadQuizResultEvent value)? loadQuizResult,
  }) {
    return loadQuizResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCourseQuizzesEvent value)? loadCourseQuizzes,
    TResult Function(LoadQuizEvent value)? loadQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(NavigateToPreviousQuestionEvent value)?
    navigateToPreviousQuestion,
    TResult Function(NavigateToNextQuestionEvent value)? navigateToNextQuestion,
    TResult Function(TimerTickEvent value)? timerTick,
    TResult Function(SubmitQuizEvent value)? submitQuiz,
    TResult Function(LoadQuizResultEvent value)? loadQuizResult,
    required TResult orElse(),
  }) {
    if (loadQuizResult != null) {
      return loadQuizResult(this);
    }
    return orElse();
  }
}

abstract class LoadQuizResultEvent implements QuizEvent {
  const factory LoadQuizResultEvent(final String resultId) =
      _$LoadQuizResultEventImpl;

  String get resultId;

  /// Create a copy of QuizEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadQuizResultEventImplCopyWith<_$LoadQuizResultEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
