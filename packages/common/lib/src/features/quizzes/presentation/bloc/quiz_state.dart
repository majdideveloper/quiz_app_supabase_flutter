import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common/common.dart';

import '../models/question_with_answers.dart';

part 'quiz_state.freezed.dart';

/// Quiz states
@freezed
class QuizState with _$QuizState {
  /// Initial state
  const factory QuizState.initial() = QuizInitial;

  /// Loading state
  const factory QuizState.loading() = QuizLoading;

  /// Quizzes loaded for a course
  const factory QuizState.quizzesLoaded({
    required List<QuizEntity> quizzes,
  }) = QuizzesLoaded;

  /// Quiz loaded and ready to start
  const factory QuizState.quizLoaded({
    required QuizEntity quiz,
    required List<QuestionWithAnswers> questions,
  }) = QuizLoaded;

  /// Quiz in progress
  const factory QuizState.quizInProgress({
    required QuizEntity quiz,
    required List<QuestionWithAnswers> questions,
    required Map<String, List<String>> answers,
    required int currentQuestionIndex,
    required DateTime startTime,
    int? timeRemaining, // in seconds
  }) = QuizInProgress;

  /// Quiz submitted
  const factory QuizState.quizSubmitted({
    required QuizResultEntity result,
    required QuizEntity quiz,
    required List<QuestionWithAnswers> questions,
    required Map<String, List<String>> userAnswers,
  }) = QuizSubmitted;

  /// Error state
  const factory QuizState.error({
    required String message,
  }) = QuizError;
}
