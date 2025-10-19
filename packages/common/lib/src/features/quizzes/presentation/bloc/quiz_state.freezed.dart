// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QuizState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<QuizEntity> quizzes) quizzesLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
    )
    quizLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )
    quizInProgress,
    required TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )
    quizSubmitted,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult? Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult? Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult? Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizInitial value) initial,
    required TResult Function(QuizLoading value) loading,
    required TResult Function(QuizzesLoaded value) quizzesLoaded,
    required TResult Function(QuizLoaded value) quizLoaded,
    required TResult Function(QuizInProgress value) quizInProgress,
    required TResult Function(QuizSubmitted value) quizSubmitted,
    required TResult Function(QuizError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizInitial value)? initial,
    TResult? Function(QuizLoading value)? loading,
    TResult? Function(QuizzesLoaded value)? quizzesLoaded,
    TResult? Function(QuizLoaded value)? quizLoaded,
    TResult? Function(QuizInProgress value)? quizInProgress,
    TResult? Function(QuizSubmitted value)? quizSubmitted,
    TResult? Function(QuizError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizInitial value)? initial,
    TResult Function(QuizLoading value)? loading,
    TResult Function(QuizzesLoaded value)? quizzesLoaded,
    TResult Function(QuizLoaded value)? quizLoaded,
    TResult Function(QuizInProgress value)? quizInProgress,
    TResult Function(QuizSubmitted value)? quizSubmitted,
    TResult Function(QuizError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStateCopyWith<$Res> {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) then) =
      _$QuizStateCopyWithImpl<$Res, QuizState>;
}

/// @nodoc
class _$QuizStateCopyWithImpl<$Res, $Val extends QuizState>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$QuizInitialImplCopyWith<$Res> {
  factory _$$QuizInitialImplCopyWith(
    _$QuizInitialImpl value,
    $Res Function(_$QuizInitialImpl) then,
  ) = __$$QuizInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuizInitialImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizInitialImpl>
    implements _$$QuizInitialImplCopyWith<$Res> {
  __$$QuizInitialImplCopyWithImpl(
    _$QuizInitialImpl _value,
    $Res Function(_$QuizInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$QuizInitialImpl implements QuizInitial {
  const _$QuizInitialImpl();

  @override
  String toString() {
    return 'QuizState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$QuizInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<QuizEntity> quizzes) quizzesLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
    )
    quizLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )
    quizInProgress,
    required TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )
    quizSubmitted,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult? Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult? Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult? Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizInitial value) initial,
    required TResult Function(QuizLoading value) loading,
    required TResult Function(QuizzesLoaded value) quizzesLoaded,
    required TResult Function(QuizLoaded value) quizLoaded,
    required TResult Function(QuizInProgress value) quizInProgress,
    required TResult Function(QuizSubmitted value) quizSubmitted,
    required TResult Function(QuizError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizInitial value)? initial,
    TResult? Function(QuizLoading value)? loading,
    TResult? Function(QuizzesLoaded value)? quizzesLoaded,
    TResult? Function(QuizLoaded value)? quizLoaded,
    TResult? Function(QuizInProgress value)? quizInProgress,
    TResult? Function(QuizSubmitted value)? quizSubmitted,
    TResult? Function(QuizError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizInitial value)? initial,
    TResult Function(QuizLoading value)? loading,
    TResult Function(QuizzesLoaded value)? quizzesLoaded,
    TResult Function(QuizLoaded value)? quizLoaded,
    TResult Function(QuizInProgress value)? quizInProgress,
    TResult Function(QuizSubmitted value)? quizSubmitted,
    TResult Function(QuizError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class QuizInitial implements QuizState {
  const factory QuizInitial() = _$QuizInitialImpl;
}

/// @nodoc
abstract class _$$QuizLoadingImplCopyWith<$Res> {
  factory _$$QuizLoadingImplCopyWith(
    _$QuizLoadingImpl value,
    $Res Function(_$QuizLoadingImpl) then,
  ) = __$$QuizLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuizLoadingImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizLoadingImpl>
    implements _$$QuizLoadingImplCopyWith<$Res> {
  __$$QuizLoadingImplCopyWithImpl(
    _$QuizLoadingImpl _value,
    $Res Function(_$QuizLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$QuizLoadingImpl implements QuizLoading {
  const _$QuizLoadingImpl();

  @override
  String toString() {
    return 'QuizState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$QuizLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<QuizEntity> quizzes) quizzesLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
    )
    quizLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )
    quizInProgress,
    required TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )
    quizSubmitted,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult? Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult? Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult? Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizInitial value) initial,
    required TResult Function(QuizLoading value) loading,
    required TResult Function(QuizzesLoaded value) quizzesLoaded,
    required TResult Function(QuizLoaded value) quizLoaded,
    required TResult Function(QuizInProgress value) quizInProgress,
    required TResult Function(QuizSubmitted value) quizSubmitted,
    required TResult Function(QuizError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizInitial value)? initial,
    TResult? Function(QuizLoading value)? loading,
    TResult? Function(QuizzesLoaded value)? quizzesLoaded,
    TResult? Function(QuizLoaded value)? quizLoaded,
    TResult? Function(QuizInProgress value)? quizInProgress,
    TResult? Function(QuizSubmitted value)? quizSubmitted,
    TResult? Function(QuizError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizInitial value)? initial,
    TResult Function(QuizLoading value)? loading,
    TResult Function(QuizzesLoaded value)? quizzesLoaded,
    TResult Function(QuizLoaded value)? quizLoaded,
    TResult Function(QuizInProgress value)? quizInProgress,
    TResult Function(QuizSubmitted value)? quizSubmitted,
    TResult Function(QuizError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class QuizLoading implements QuizState {
  const factory QuizLoading() = _$QuizLoadingImpl;
}

/// @nodoc
abstract class _$$QuizzesLoadedImplCopyWith<$Res> {
  factory _$$QuizzesLoadedImplCopyWith(
    _$QuizzesLoadedImpl value,
    $Res Function(_$QuizzesLoadedImpl) then,
  ) = __$$QuizzesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<QuizEntity> quizzes});
}

/// @nodoc
class __$$QuizzesLoadedImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizzesLoadedImpl>
    implements _$$QuizzesLoadedImplCopyWith<$Res> {
  __$$QuizzesLoadedImplCopyWithImpl(
    _$QuizzesLoadedImpl _value,
    $Res Function(_$QuizzesLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? quizzes = null}) {
    return _then(
      _$QuizzesLoadedImpl(
        quizzes:
            null == quizzes
                ? _value._quizzes
                : quizzes // ignore: cast_nullable_to_non_nullable
                    as List<QuizEntity>,
      ),
    );
  }
}

/// @nodoc

class _$QuizzesLoadedImpl implements QuizzesLoaded {
  const _$QuizzesLoadedImpl({required final List<QuizEntity> quizzes})
    : _quizzes = quizzes;

  final List<QuizEntity> _quizzes;
  @override
  List<QuizEntity> get quizzes {
    if (_quizzes is EqualUnmodifiableListView) return _quizzes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizzes);
  }

  @override
  String toString() {
    return 'QuizState.quizzesLoaded(quizzes: $quizzes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizzesLoadedImpl &&
            const DeepCollectionEquality().equals(other._quizzes, _quizzes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_quizzes));

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizzesLoadedImplCopyWith<_$QuizzesLoadedImpl> get copyWith =>
      __$$QuizzesLoadedImplCopyWithImpl<_$QuizzesLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<QuizEntity> quizzes) quizzesLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
    )
    quizLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )
    quizInProgress,
    required TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )
    quizSubmitted,
    required TResult Function(String message) error,
  }) {
    return quizzesLoaded(quizzes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult? Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult? Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult? Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult? Function(String message)? error,
  }) {
    return quizzesLoaded?.call(quizzes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (quizzesLoaded != null) {
      return quizzesLoaded(quizzes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizInitial value) initial,
    required TResult Function(QuizLoading value) loading,
    required TResult Function(QuizzesLoaded value) quizzesLoaded,
    required TResult Function(QuizLoaded value) quizLoaded,
    required TResult Function(QuizInProgress value) quizInProgress,
    required TResult Function(QuizSubmitted value) quizSubmitted,
    required TResult Function(QuizError value) error,
  }) {
    return quizzesLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizInitial value)? initial,
    TResult? Function(QuizLoading value)? loading,
    TResult? Function(QuizzesLoaded value)? quizzesLoaded,
    TResult? Function(QuizLoaded value)? quizLoaded,
    TResult? Function(QuizInProgress value)? quizInProgress,
    TResult? Function(QuizSubmitted value)? quizSubmitted,
    TResult? Function(QuizError value)? error,
  }) {
    return quizzesLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizInitial value)? initial,
    TResult Function(QuizLoading value)? loading,
    TResult Function(QuizzesLoaded value)? quizzesLoaded,
    TResult Function(QuizLoaded value)? quizLoaded,
    TResult Function(QuizInProgress value)? quizInProgress,
    TResult Function(QuizSubmitted value)? quizSubmitted,
    TResult Function(QuizError value)? error,
    required TResult orElse(),
  }) {
    if (quizzesLoaded != null) {
      return quizzesLoaded(this);
    }
    return orElse();
  }
}

abstract class QuizzesLoaded implements QuizState {
  const factory QuizzesLoaded({required final List<QuizEntity> quizzes}) =
      _$QuizzesLoadedImpl;

  List<QuizEntity> get quizzes;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizzesLoadedImplCopyWith<_$QuizzesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuizLoadedImplCopyWith<$Res> {
  factory _$$QuizLoadedImplCopyWith(
    _$QuizLoadedImpl value,
    $Res Function(_$QuizLoadedImpl) then,
  ) = __$$QuizLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QuizEntity quiz, List<QuestionWithAnswers> questions});

  $QuizEntityCopyWith<$Res> get quiz;
}

/// @nodoc
class __$$QuizLoadedImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizLoadedImpl>
    implements _$$QuizLoadedImplCopyWith<$Res> {
  __$$QuizLoadedImplCopyWithImpl(
    _$QuizLoadedImpl _value,
    $Res Function(_$QuizLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? quiz = null, Object? questions = null}) {
    return _then(
      _$QuizLoadedImpl(
        quiz:
            null == quiz
                ? _value.quiz
                : quiz // ignore: cast_nullable_to_non_nullable
                    as QuizEntity,
        questions:
            null == questions
                ? _value._questions
                : questions // ignore: cast_nullable_to_non_nullable
                    as List<QuestionWithAnswers>,
      ),
    );
  }

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizEntityCopyWith<$Res> get quiz {
    return $QuizEntityCopyWith<$Res>(_value.quiz, (value) {
      return _then(_value.copyWith(quiz: value));
    });
  }
}

/// @nodoc

class _$QuizLoadedImpl implements QuizLoaded {
  const _$QuizLoadedImpl({
    required this.quiz,
    required final List<QuestionWithAnswers> questions,
  }) : _questions = questions;

  @override
  final QuizEntity quiz;
  final List<QuestionWithAnswers> _questions;
  @override
  List<QuestionWithAnswers> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'QuizState.quizLoaded(quiz: $quiz, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizLoadedImpl &&
            (identical(other.quiz, quiz) || other.quiz == quiz) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    quiz,
    const DeepCollectionEquality().hash(_questions),
  );

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizLoadedImplCopyWith<_$QuizLoadedImpl> get copyWith =>
      __$$QuizLoadedImplCopyWithImpl<_$QuizLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<QuizEntity> quizzes) quizzesLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
    )
    quizLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )
    quizInProgress,
    required TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )
    quizSubmitted,
    required TResult Function(String message) error,
  }) {
    return quizLoaded(quiz, questions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult? Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult? Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult? Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult? Function(String message)? error,
  }) {
    return quizLoaded?.call(quiz, questions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (quizLoaded != null) {
      return quizLoaded(quiz, questions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizInitial value) initial,
    required TResult Function(QuizLoading value) loading,
    required TResult Function(QuizzesLoaded value) quizzesLoaded,
    required TResult Function(QuizLoaded value) quizLoaded,
    required TResult Function(QuizInProgress value) quizInProgress,
    required TResult Function(QuizSubmitted value) quizSubmitted,
    required TResult Function(QuizError value) error,
  }) {
    return quizLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizInitial value)? initial,
    TResult? Function(QuizLoading value)? loading,
    TResult? Function(QuizzesLoaded value)? quizzesLoaded,
    TResult? Function(QuizLoaded value)? quizLoaded,
    TResult? Function(QuizInProgress value)? quizInProgress,
    TResult? Function(QuizSubmitted value)? quizSubmitted,
    TResult? Function(QuizError value)? error,
  }) {
    return quizLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizInitial value)? initial,
    TResult Function(QuizLoading value)? loading,
    TResult Function(QuizzesLoaded value)? quizzesLoaded,
    TResult Function(QuizLoaded value)? quizLoaded,
    TResult Function(QuizInProgress value)? quizInProgress,
    TResult Function(QuizSubmitted value)? quizSubmitted,
    TResult Function(QuizError value)? error,
    required TResult orElse(),
  }) {
    if (quizLoaded != null) {
      return quizLoaded(this);
    }
    return orElse();
  }
}

abstract class QuizLoaded implements QuizState {
  const factory QuizLoaded({
    required final QuizEntity quiz,
    required final List<QuestionWithAnswers> questions,
  }) = _$QuizLoadedImpl;

  QuizEntity get quiz;
  List<QuestionWithAnswers> get questions;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizLoadedImplCopyWith<_$QuizLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuizInProgressImplCopyWith<$Res> {
  factory _$$QuizInProgressImplCopyWith(
    _$QuizInProgressImpl value,
    $Res Function(_$QuizInProgressImpl) then,
  ) = __$$QuizInProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    QuizEntity quiz,
    List<QuestionWithAnswers> questions,
    Map<String, List<String>> answers,
    int currentQuestionIndex,
    DateTime startTime,
    int? timeRemaining,
  });

  $QuizEntityCopyWith<$Res> get quiz;
}

/// @nodoc
class __$$QuizInProgressImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizInProgressImpl>
    implements _$$QuizInProgressImplCopyWith<$Res> {
  __$$QuizInProgressImplCopyWithImpl(
    _$QuizInProgressImpl _value,
    $Res Function(_$QuizInProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quiz = null,
    Object? questions = null,
    Object? answers = null,
    Object? currentQuestionIndex = null,
    Object? startTime = null,
    Object? timeRemaining = freezed,
  }) {
    return _then(
      _$QuizInProgressImpl(
        quiz:
            null == quiz
                ? _value.quiz
                : quiz // ignore: cast_nullable_to_non_nullable
                    as QuizEntity,
        questions:
            null == questions
                ? _value._questions
                : questions // ignore: cast_nullable_to_non_nullable
                    as List<QuestionWithAnswers>,
        answers:
            null == answers
                ? _value._answers
                : answers // ignore: cast_nullable_to_non_nullable
                    as Map<String, List<String>>,
        currentQuestionIndex:
            null == currentQuestionIndex
                ? _value.currentQuestionIndex
                : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        startTime:
            null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        timeRemaining:
            freezed == timeRemaining
                ? _value.timeRemaining
                : timeRemaining // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizEntityCopyWith<$Res> get quiz {
    return $QuizEntityCopyWith<$Res>(_value.quiz, (value) {
      return _then(_value.copyWith(quiz: value));
    });
  }
}

/// @nodoc

class _$QuizInProgressImpl implements QuizInProgress {
  const _$QuizInProgressImpl({
    required this.quiz,
    required final List<QuestionWithAnswers> questions,
    required final Map<String, List<String>> answers,
    required this.currentQuestionIndex,
    required this.startTime,
    this.timeRemaining,
  }) : _questions = questions,
       _answers = answers;

  @override
  final QuizEntity quiz;
  final List<QuestionWithAnswers> _questions;
  @override
  List<QuestionWithAnswers> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  final Map<String, List<String>> _answers;
  @override
  Map<String, List<String>> get answers {
    if (_answers is EqualUnmodifiableMapView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

  @override
  final int currentQuestionIndex;
  @override
  final DateTime startTime;
  @override
  final int? timeRemaining;

  @override
  String toString() {
    return 'QuizState.quizInProgress(quiz: $quiz, questions: $questions, answers: $answers, currentQuestionIndex: $currentQuestionIndex, startTime: $startTime, timeRemaining: $timeRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizInProgressImpl &&
            (identical(other.quiz, quiz) || other.quiz == quiz) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
            ) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.timeRemaining, timeRemaining) ||
                other.timeRemaining == timeRemaining));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    quiz,
    const DeepCollectionEquality().hash(_questions),
    const DeepCollectionEquality().hash(_answers),
    currentQuestionIndex,
    startTime,
    timeRemaining,
  );

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizInProgressImplCopyWith<_$QuizInProgressImpl> get copyWith =>
      __$$QuizInProgressImplCopyWithImpl<_$QuizInProgressImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<QuizEntity> quizzes) quizzesLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
    )
    quizLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )
    quizInProgress,
    required TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )
    quizSubmitted,
    required TResult Function(String message) error,
  }) {
    return quizInProgress(
      quiz,
      questions,
      answers,
      currentQuestionIndex,
      startTime,
      timeRemaining,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult? Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult? Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult? Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult? Function(String message)? error,
  }) {
    return quizInProgress?.call(
      quiz,
      questions,
      answers,
      currentQuestionIndex,
      startTime,
      timeRemaining,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (quizInProgress != null) {
      return quizInProgress(
        quiz,
        questions,
        answers,
        currentQuestionIndex,
        startTime,
        timeRemaining,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizInitial value) initial,
    required TResult Function(QuizLoading value) loading,
    required TResult Function(QuizzesLoaded value) quizzesLoaded,
    required TResult Function(QuizLoaded value) quizLoaded,
    required TResult Function(QuizInProgress value) quizInProgress,
    required TResult Function(QuizSubmitted value) quizSubmitted,
    required TResult Function(QuizError value) error,
  }) {
    return quizInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizInitial value)? initial,
    TResult? Function(QuizLoading value)? loading,
    TResult? Function(QuizzesLoaded value)? quizzesLoaded,
    TResult? Function(QuizLoaded value)? quizLoaded,
    TResult? Function(QuizInProgress value)? quizInProgress,
    TResult? Function(QuizSubmitted value)? quizSubmitted,
    TResult? Function(QuizError value)? error,
  }) {
    return quizInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizInitial value)? initial,
    TResult Function(QuizLoading value)? loading,
    TResult Function(QuizzesLoaded value)? quizzesLoaded,
    TResult Function(QuizLoaded value)? quizLoaded,
    TResult Function(QuizInProgress value)? quizInProgress,
    TResult Function(QuizSubmitted value)? quizSubmitted,
    TResult Function(QuizError value)? error,
    required TResult orElse(),
  }) {
    if (quizInProgress != null) {
      return quizInProgress(this);
    }
    return orElse();
  }
}

abstract class QuizInProgress implements QuizState {
  const factory QuizInProgress({
    required final QuizEntity quiz,
    required final List<QuestionWithAnswers> questions,
    required final Map<String, List<String>> answers,
    required final int currentQuestionIndex,
    required final DateTime startTime,
    final int? timeRemaining,
  }) = _$QuizInProgressImpl;

  QuizEntity get quiz;
  List<QuestionWithAnswers> get questions;
  Map<String, List<String>> get answers;
  int get currentQuestionIndex;
  DateTime get startTime;
  int? get timeRemaining;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizInProgressImplCopyWith<_$QuizInProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuizSubmittedImplCopyWith<$Res> {
  factory _$$QuizSubmittedImplCopyWith(
    _$QuizSubmittedImpl value,
    $Res Function(_$QuizSubmittedImpl) then,
  ) = __$$QuizSubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    QuizResultEntity result,
    QuizEntity quiz,
    List<QuestionWithAnswers> questions,
    Map<String, List<String>> userAnswers,
  });

  $QuizResultEntityCopyWith<$Res> get result;
  $QuizEntityCopyWith<$Res> get quiz;
}

/// @nodoc
class __$$QuizSubmittedImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizSubmittedImpl>
    implements _$$QuizSubmittedImplCopyWith<$Res> {
  __$$QuizSubmittedImplCopyWithImpl(
    _$QuizSubmittedImpl _value,
    $Res Function(_$QuizSubmittedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? quiz = null,
    Object? questions = null,
    Object? userAnswers = null,
  }) {
    return _then(
      _$QuizSubmittedImpl(
        result:
            null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                    as QuizResultEntity,
        quiz:
            null == quiz
                ? _value.quiz
                : quiz // ignore: cast_nullable_to_non_nullable
                    as QuizEntity,
        questions:
            null == questions
                ? _value._questions
                : questions // ignore: cast_nullable_to_non_nullable
                    as List<QuestionWithAnswers>,
        userAnswers:
            null == userAnswers
                ? _value._userAnswers
                : userAnswers // ignore: cast_nullable_to_non_nullable
                    as Map<String, List<String>>,
      ),
    );
  }

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizResultEntityCopyWith<$Res> get result {
    return $QuizResultEntityCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizEntityCopyWith<$Res> get quiz {
    return $QuizEntityCopyWith<$Res>(_value.quiz, (value) {
      return _then(_value.copyWith(quiz: value));
    });
  }
}

/// @nodoc

class _$QuizSubmittedImpl implements QuizSubmitted {
  const _$QuizSubmittedImpl({
    required this.result,
    required this.quiz,
    required final List<QuestionWithAnswers> questions,
    required final Map<String, List<String>> userAnswers,
  }) : _questions = questions,
       _userAnswers = userAnswers;

  @override
  final QuizResultEntity result;
  @override
  final QuizEntity quiz;
  final List<QuestionWithAnswers> _questions;
  @override
  List<QuestionWithAnswers> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  final Map<String, List<String>> _userAnswers;
  @override
  Map<String, List<String>> get userAnswers {
    if (_userAnswers is EqualUnmodifiableMapView) return _userAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_userAnswers);
  }

  @override
  String toString() {
    return 'QuizState.quizSubmitted(result: $result, quiz: $quiz, questions: $questions, userAnswers: $userAnswers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizSubmittedImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.quiz, quiz) || other.quiz == quiz) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
            ) &&
            const DeepCollectionEquality().equals(
              other._userAnswers,
              _userAnswers,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    result,
    quiz,
    const DeepCollectionEquality().hash(_questions),
    const DeepCollectionEquality().hash(_userAnswers),
  );

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizSubmittedImplCopyWith<_$QuizSubmittedImpl> get copyWith =>
      __$$QuizSubmittedImplCopyWithImpl<_$QuizSubmittedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<QuizEntity> quizzes) quizzesLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
    )
    quizLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )
    quizInProgress,
    required TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )
    quizSubmitted,
    required TResult Function(String message) error,
  }) {
    return quizSubmitted(result, quiz, questions, userAnswers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult? Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult? Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult? Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult? Function(String message)? error,
  }) {
    return quizSubmitted?.call(result, quiz, questions, userAnswers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (quizSubmitted != null) {
      return quizSubmitted(result, quiz, questions, userAnswers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizInitial value) initial,
    required TResult Function(QuizLoading value) loading,
    required TResult Function(QuizzesLoaded value) quizzesLoaded,
    required TResult Function(QuizLoaded value) quizLoaded,
    required TResult Function(QuizInProgress value) quizInProgress,
    required TResult Function(QuizSubmitted value) quizSubmitted,
    required TResult Function(QuizError value) error,
  }) {
    return quizSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizInitial value)? initial,
    TResult? Function(QuizLoading value)? loading,
    TResult? Function(QuizzesLoaded value)? quizzesLoaded,
    TResult? Function(QuizLoaded value)? quizLoaded,
    TResult? Function(QuizInProgress value)? quizInProgress,
    TResult? Function(QuizSubmitted value)? quizSubmitted,
    TResult? Function(QuizError value)? error,
  }) {
    return quizSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizInitial value)? initial,
    TResult Function(QuizLoading value)? loading,
    TResult Function(QuizzesLoaded value)? quizzesLoaded,
    TResult Function(QuizLoaded value)? quizLoaded,
    TResult Function(QuizInProgress value)? quizInProgress,
    TResult Function(QuizSubmitted value)? quizSubmitted,
    TResult Function(QuizError value)? error,
    required TResult orElse(),
  }) {
    if (quizSubmitted != null) {
      return quizSubmitted(this);
    }
    return orElse();
  }
}

abstract class QuizSubmitted implements QuizState {
  const factory QuizSubmitted({
    required final QuizResultEntity result,
    required final QuizEntity quiz,
    required final List<QuestionWithAnswers> questions,
    required final Map<String, List<String>> userAnswers,
  }) = _$QuizSubmittedImpl;

  QuizResultEntity get result;
  QuizEntity get quiz;
  List<QuestionWithAnswers> get questions;
  Map<String, List<String>> get userAnswers;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizSubmittedImplCopyWith<_$QuizSubmittedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuizErrorImplCopyWith<$Res> {
  factory _$$QuizErrorImplCopyWith(
    _$QuizErrorImpl value,
    $Res Function(_$QuizErrorImpl) then,
  ) = __$$QuizErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$QuizErrorImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizErrorImpl>
    implements _$$QuizErrorImplCopyWith<$Res> {
  __$$QuizErrorImplCopyWithImpl(
    _$QuizErrorImpl _value,
    $Res Function(_$QuizErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$QuizErrorImpl(
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$QuizErrorImpl implements QuizError {
  const _$QuizErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'QuizState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizErrorImplCopyWith<_$QuizErrorImpl> get copyWith =>
      __$$QuizErrorImplCopyWithImpl<_$QuizErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<QuizEntity> quizzes) quizzesLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
    )
    quizLoaded,
    required TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )
    quizInProgress,
    required TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )
    quizSubmitted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult? Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult? Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult? Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<QuizEntity> quizzes)? quizzesLoaded,
    TResult Function(QuizEntity quiz, List<QuestionWithAnswers> questions)?
    quizLoaded,
    TResult Function(
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> answers,
      int currentQuestionIndex,
      DateTime startTime,
      int? timeRemaining,
    )?
    quizInProgress,
    TResult Function(
      QuizResultEntity result,
      QuizEntity quiz,
      List<QuestionWithAnswers> questions,
      Map<String, List<String>> userAnswers,
    )?
    quizSubmitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizInitial value) initial,
    required TResult Function(QuizLoading value) loading,
    required TResult Function(QuizzesLoaded value) quizzesLoaded,
    required TResult Function(QuizLoaded value) quizLoaded,
    required TResult Function(QuizInProgress value) quizInProgress,
    required TResult Function(QuizSubmitted value) quizSubmitted,
    required TResult Function(QuizError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizInitial value)? initial,
    TResult? Function(QuizLoading value)? loading,
    TResult? Function(QuizzesLoaded value)? quizzesLoaded,
    TResult? Function(QuizLoaded value)? quizLoaded,
    TResult? Function(QuizInProgress value)? quizInProgress,
    TResult? Function(QuizSubmitted value)? quizSubmitted,
    TResult? Function(QuizError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizInitial value)? initial,
    TResult Function(QuizLoading value)? loading,
    TResult Function(QuizzesLoaded value)? quizzesLoaded,
    TResult Function(QuizLoaded value)? quizLoaded,
    TResult Function(QuizInProgress value)? quizInProgress,
    TResult Function(QuizSubmitted value)? quizSubmitted,
    TResult Function(QuizError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class QuizError implements QuizState {
  const factory QuizError({required final String message}) = _$QuizErrorImpl;

  String get message;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizErrorImplCopyWith<_$QuizErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
