import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';

import '../widgets/question_widget.dart';
import '../widgets/quiz_timer.dart';

/// Quiz page
///
/// Displays quiz with questions, timer, and handles submission
class QuizPage extends StatelessWidget {
  final String quizId;

  const QuizPage({
    super.key,
    required this.quizId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuizBloc>()
        ..add(QuizEvent.loadQuiz(quizId)),
      child: const QuizView(),
    );
  }
}

/// Quiz view with BLoC consumer
class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        // Navigate to result page when quiz is submitted
        state.whenOrNull(
          quizSubmitted: (result, quiz, questions, userAnswers) {
            // TODO: Navigate to quiz result page
            // For now, show dialog
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => _buildResultDialog(context, result),
            );
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          quizzesLoaded: (quizzes) => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          quizLoaded: (quiz, questions) =>
              _buildQuizIntro(context, quiz, questions),
          quizInProgress: (quiz, questions, answers, currentIndex, startTime, timeRemaining) =>
              _buildQuizInProgress(
            context,
            quiz,
            questions,
            answers,
            currentIndex,
            timeRemaining,
          ),
          quizSubmitted: (result, quiz, questions, userAnswers) =>
              _buildQuizSubmitted(context, result, quiz, questions, userAnswers),
          error: (message) => _buildErrorState(context, message),
        );
      },
    );
  }

  Widget _buildQuizIntro(
    BuildContext context,
    QuizEntity quiz,
    List<dynamic> questions,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.quiz,
                size: 80,
                color: AppColors.primary,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                quiz.title,
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                quiz.description,
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xl),
              _buildInfoCard(
                icon: Icons.question_answer,
                label: 'Questions',
                value: '${questions.length}',
              ),
              const SizedBox(height: AppSpacing.md),
              if (quiz.timeLimit != null)
                _buildInfoCard(
                  icon: Icons.timer,
                  label: 'Time Limit',
                  value: '${quiz.timeLimit! ~/ 60} minutes',
                ),
              if (quiz.timeLimit != null)
                const SizedBox(height: AppSpacing.md),
              _buildInfoCard(
                icon: Icons.grade,
                label: 'Passing Score',
                value: '${quiz.passingScore}%',
              ),
              const SizedBox(height: AppSpacing.md),
              if (quiz.maxAttempts != null)
                _buildInfoCard(
                  icon: Icons.refresh,
                  label: 'Max Attempts',
                  value: '${quiz.maxAttempts}',
                ),
              const SizedBox(height: AppSpacing.xl),
              ElevatedButton(
                onPressed: () {
                  context.read<QuizBloc>().add(const QuizEvent.startQuiz());
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(AppSpacing.md),
                ),
                child: const Text('Start Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: AppSpacing.md),
            Text(
              label,
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizInProgress(
    BuildContext context,
    QuizEntity quiz,
    List<dynamic> questions,
    Map<String, List<String>> answers,
    int currentIndex,
    int? timeRemaining,
  ) {
    final currentQuestionWithAnswers = questions[currentIndex];
    final currentQuestion = currentQuestionWithAnswers.question;
    final questionAnswers = currentQuestionWithAnswers.answers;
    final selectedAnswers = answers[currentQuestion.id] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${currentIndex + 1}/${questions.length}'),
        actions: [
          if (timeRemaining != null && quiz.timeLimit != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: AppSpacing.md),
                child: QuizTimer(
                  timeRemaining: timeRemaining,
                  totalTime: quiz.timeLimit,
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          // Progress bar
          LinearProgressIndicator(
            value: (currentIndex + 1) / questions.length,
            backgroundColor: AppColors.surfaceVariant,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),

          // Question
          Expanded(
            child: SingleChildScrollView(
              child: QuestionWidget(
                question: currentQuestion,
                answers: questionAnswers,
                selectedAnswerIds: selectedAnswers,
                onAnswerSelected: (newAnswers) {
                  context.read<QuizBloc>().add(
                        QuizEvent.answerQuestion(
                          questionId: currentQuestion.id,
                          selectedAnswerIds: newAnswers,
                        ),
                      );
                },
              ),
            ),
          ),

          // Navigation buttons
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                if (currentIndex > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: currentIndex > 0
                          ? () {
                              // Navigate to previous question
                              context.read<QuizBloc>().add(
                                    QuizEvent.navigateToPreviousQuestion(),
                                  );
                            }
                          : null,
                      child: const Text('Previous'),
                    ),
                  ),
                if (currentIndex > 0) const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentIndex < questions.length - 1) {
                        // Navigate to next question
                        context.read<QuizBloc>().add(
                              QuizEvent.navigateToNextQuestion(),
                            );
                      } else {
                        // Submit quiz
                        _showSubmitConfirmation(context, answers.length, questions.length);
                      }
                    },
                    child: Text(
                      currentIndex < questions.length - 1 ? 'Next' : 'Submit',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizSubmitted(
    BuildContext context,
    QuizResultEntity result,
    QuizEntity quiz,
    List<dynamic> questions,
    Map<String, List<String>> userAnswers,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Completed'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                result.passed ? Icons.check_circle : Icons.cancel,
                size: 100,
                color: result.passed ? Colors.green : Colors.red,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                result.passed ? 'Congratulations!' : 'Keep Trying!',
                style: AppTypography.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                result.passed
                    ? 'You passed the quiz!'
                    : 'You didn\'t pass this time, but you can try again.',
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xl),
              _buildResultCard('Score', '${result.score.toStringAsFixed(1)}%'),
              const SizedBox(height: AppSpacing.md),
              _buildResultCard(
                'Correct Answers',
                '${result.correctAnswers}/${result.totalQuestions}',
              ),
              const SizedBox(height: AppSpacing.md),
              _buildResultCard(
                'Time Spent',
                '${result.timeSpent ~/ 60}:${(result.timeSpent % 60).toString().padLeft(2, '0')}',
              ),
              const SizedBox(height: AppSpacing.xl),
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Back to Course'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard(String label, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTypography.bodyLarge,
            ),
            Text(
              value,
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultDialog(BuildContext context, QuizResultEntity result) {
    return AlertDialog(
      title: Text(result.passed ? 'Passed!' : 'Not Passed'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Score: ${result.score.toStringAsFixed(1)}%'),
          Text('Correct: ${result.correctAnswers}/${result.totalQuestions}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            context.pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: AppColors.error,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                message,
                style: AppTypography.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.lg),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSubmitConfirmation(
    BuildContext context,
    int answeredCount,
    int totalCount,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Submit Quiz?'),
        content: Text(
          answeredCount < totalCount
              ? 'You have answered $answeredCount out of $totalCount questions. '
                  'Unanswered questions will be marked as incorrect.\n\n'
                  'Are you sure you want to submit?'
              : 'Are you sure you want to submit your answers?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<QuizBloc>().add(const QuizEvent.submitQuiz());
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
