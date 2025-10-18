import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:common/common.dart';

import 'quiz_event.dart';
import 'quiz_state.dart';
import '../models/question_with_answers.dart';

/// Quiz BLoC
///
/// Manages quiz state including:
/// - Quiz loading and initialization
/// - Timer management
/// - Answer tracking
/// - Quiz submission
@injectable
class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final SubmitQuizUseCase _submitQuizUseCase;
  final QuizRepository _quizRepository;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  Timer? _timer;

  QuizBloc(
    this._submitQuizUseCase,
    this._quizRepository,
    this._getCurrentUserUseCase,
  ) : super(const QuizState.initial()) {
    on<LoadQuizEvent>(_onLoadQuiz);
    on<StartQuizEvent>(_onStartQuiz);
    on<AnswerQuestionEvent>(_onAnswerQuestion);
    on<NavigateToPreviousQuestionEvent>(_onNavigateToPreviousQuestion);
    on<NavigateToNextQuestionEvent>(_onNavigateToNextQuestion);
    on<TimerTickEvent>(_onTimerTick);
    on<SubmitQuizEvent>(_onSubmitQuiz);
    on<LoadQuizResultEvent>(_onLoadQuizResult);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  // ==========================================================================
  // EVENT HANDLERS
  // ==========================================================================

  /// Handles quiz load request
  Future<void> _onLoadQuiz(
    LoadQuizEvent event,
    Emitter<QuizState> emit,
  ) async {
    emit(const QuizState.loading());

    // Get quiz by ID
    final quizResult = await _quizRepository.getQuizById(event.quizId);

    await quizResult.fold(
      (failure) async => emit(QuizState.error(message: failure.message)),
      (quiz) async {
        // Get questions for the quiz
        final questionsResult = await _quizRepository.getQuizQuestions(quiz.id);

        await questionsResult.fold(
          (failure) async => emit(QuizState.error(message: failure.message)),
          (questions) async {
            // Get answers for each question
            final questionsWithAnswers = <QuestionWithAnswers>[];

            for (final question in questions) {
              final answersResult = await _quizRepository.getQuestionAnswers(question.id);

              await answersResult.fold(
                (failure) {
                  emit(QuizState.error(message: failure.message));
                },
                (answers) {
                  questionsWithAnswers.add(
                    QuestionWithAnswers(
                      question: question,
                      answers: answers,
                    ),
                  );
                },
              );
            }

            // Only emit quizLoaded if we successfully got all questions and answers
            if (questionsWithAnswers.length == questions.length) {
              emit(QuizState.quizLoaded(
                quiz: quiz,
                questions: questionsWithAnswers,
              ));
            }
          },
        );
      },
    );
  }

  /// Handles quiz start request
  void _onStartQuiz(
    StartQuizEvent event,
    Emitter<QuizState> emit,
  ) {
    state.whenOrNull(
      quizLoaded: (quiz, questions) {
        final startTime = DateTime.now();

        emit(QuizState.quizInProgress(
          quiz: quiz,
          questions: questions,
          answers: {},
          currentQuestionIndex: 0,
          startTime: startTime,
          timeRemaining: quiz.timeLimit,
        ));

        // Start timer if quiz has time limit
        if (quiz.timeLimit != null && quiz.timeLimit! > 0) {
          _startTimer(quiz.timeLimit!);
        }
      },
    );
  }

  /// Handles answer question request
  void _onAnswerQuestion(
    AnswerQuestionEvent event,
    Emitter<QuizState> emit,
  ) {
    state.whenOrNull(
      quizInProgress: (quiz, questions, answers, currentIndex, startTime, timeRemaining) {
        final newAnswers = Map<String, List<String>>.from(answers);
        newAnswers[event.questionId] = event.selectedAnswerIds;

        emit(QuizState.quizInProgress(
          quiz: quiz,
          questions: questions,
          answers: newAnswers,
          currentQuestionIndex: currentIndex,
          startTime: startTime,
          timeRemaining: timeRemaining,
        ));
      },
    );
  }

  /// Handles navigate to previous question request
  void _onNavigateToPreviousQuestion(
    NavigateToPreviousQuestionEvent event,
    Emitter<QuizState> emit,
  ) {
    state.whenOrNull(
      quizInProgress: (quiz, questions, answers, currentIndex, startTime, timeRemaining) {
        if (currentIndex > 0) {
          emit(QuizState.quizInProgress(
            quiz: quiz,
            questions: questions,
            answers: answers,
            currentQuestionIndex: currentIndex - 1,
            startTime: startTime,
            timeRemaining: timeRemaining,
          ));
        }
      },
    );
  }

  /// Handles navigate to next question request
  void _onNavigateToNextQuestion(
    NavigateToNextQuestionEvent event,
    Emitter<QuizState> emit,
  ) {
    state.whenOrNull(
      quizInProgress: (quiz, questions, answers, currentIndex, startTime, timeRemaining) {
        if (currentIndex < questions.length - 1) {
          emit(QuizState.quizInProgress(
            quiz: quiz,
            questions: questions,
            answers: answers,
            currentQuestionIndex: currentIndex + 1,
            startTime: startTime,
            timeRemaining: timeRemaining,
          ));
        }
      },
    );
  }

  /// Handles timer tick request
  void _onTimerTick(
    TimerTickEvent event,
    Emitter<QuizState> emit,
  ) {
    state.whenOrNull(
      quizInProgress: (quiz, questions, answers, currentIndex, startTime, timeRemaining) {
        if (timeRemaining == null || timeRemaining <= 0) {
          _timer?.cancel();
          add(const QuizEvent.submitQuiz());
          return;
        }

        emit(QuizState.quizInProgress(
          quiz: quiz,
          questions: questions,
          answers: answers,
          currentQuestionIndex: currentIndex,
          startTime: startTime,
          timeRemaining: timeRemaining - 1,
        ));
      },
    );
  }

  /// Handles quiz submit request
  Future<void> _onSubmitQuiz(
    SubmitQuizEvent event,
    Emitter<QuizState> emit,
  ) async {
    await state.whenOrNull(
      quizInProgress: (quiz, questions, answers, currentIndex, startTime, timeRemaining) async {
        _timer?.cancel();

        emit(const QuizState.loading());

        // Get current user
        final userResult = await _getCurrentUserUseCase.call();

        await userResult.fold(
          (failure) async => emit(QuizState.error(message: failure.message)),
          (user) async {
            // Calculate time spent
            final timeSpent = DateTime.now().difference(startTime).inSeconds;

            // Submit quiz
            final result = await _submitQuizUseCase(
              SubmitQuizParams(
                quizId: quiz.id,
                userId: user.id,
                answers: answers,
                timeSpent: timeSpent,
                startedAt: startTime,
              ),
            );

            result.fold(
              (failure) => emit(QuizState.error(message: failure.message)),
              (quizResult) {
                emit(QuizState.quizSubmitted(
                  result: quizResult,
                  quiz: quiz,
                  questions: questions,
                  userAnswers: answers,
                ));
              },
            );
          },
        );
      },
    );
  }

  /// Handles load quiz result request
  Future<void> _onLoadQuizResult(
    LoadQuizResultEvent event,
    Emitter<QuizState> emit,
  ) async {
    emit(const QuizState.loading());

    // TODO: Implement loading existing quiz result
    // This would require a new use case to get a specific result
    emit(const QuizState.error(
      message: 'Loading quiz results not yet implemented',
    ));
  }

  // ==========================================================================
  // HELPER METHODS
  // ==========================================================================

  /// Start countdown timer
  void _startTimer(int totalSeconds) {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(const QuizEvent.timerTick());
    });
  }
}
