import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_event.freezed.dart';

/// Quiz events
@freezed
class QuizEvent with _$QuizEvent {
  /// Load quizzes for a course
  const factory QuizEvent.loadCourseQuizzes(String courseId) = LoadCourseQuizzesEvent;

  /// Load quiz by ID
  const factory QuizEvent.loadQuiz(String quizId) = LoadQuizEvent;

  /// Start quiz
  const factory QuizEvent.startQuiz() = StartQuizEvent;

  /// Answer question
  const factory QuizEvent.answerQuestion({
    required String questionId,
    required List<String> selectedAnswerIds,
  }) = AnswerQuestionEvent;

  /// Navigate to previous question
  const factory QuizEvent.navigateToPreviousQuestion() = NavigateToPreviousQuestionEvent;

  /// Navigate to next question
  const factory QuizEvent.navigateToNextQuestion() = NavigateToNextQuestionEvent;

  /// Timer tick (updates remaining time)
  const factory QuizEvent.timerTick() = TimerTickEvent;

  /// Submit quiz
  const factory QuizEvent.submitQuiz() = SubmitQuizEvent;

  /// Load quiz result
  const factory QuizEvent.loadQuizResult(String resultId) = LoadQuizResultEvent;
}
