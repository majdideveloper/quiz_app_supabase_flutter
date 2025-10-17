import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';

import '../widgets/question_widget.dart';

/// Quiz result page
///
/// Displays quiz results with detailed review of answers
class QuizResultPage extends StatefulWidget {
  final QuizResultEntity result;
  final QuizEntity quiz;
  final List<dynamic> questions; // List<QuestionWithAnswers>
  final Map<String, List<String>> userAnswers;

  const QuizResultPage({
    super.key,
    required this.result,
    required this.quiz,
    required this.questions,
    required this.userAnswers,
  });

  @override
  State<QuizResultPage> createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage> {
  bool _showReview = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        automaticallyImplyLeading: false,
      ),
      body: _showReview ? _buildReviewMode() : _buildResultsSummary(),
    );
  }

  Widget _buildResultsSummary() {
    final isPassed = widget.result.passed;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Result icon
            Icon(
              isPassed ? Icons.check_circle : Icons.cancel,
              size: 100,
              color: isPassed ? Colors.green : Colors.red,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Result message
            Text(
              isPassed ? 'Congratulations!' : 'Keep Trying!',
              style: AppTypography.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.md),

            Text(
              isPassed
                  ? 'You passed the quiz!'
                  : 'You didn\'t pass this time, but you can try again.',
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),

            // Score card
            _buildResultCard(
              icon: Icons.grade,
              label: 'Score',
              value: '${widget.result.score.toStringAsFixed(1)}%',
              color: isPassed ? Colors.green : Colors.red,
            ),
            const SizedBox(height: AppSpacing.md),

            // Correct answers card
            _buildResultCard(
              icon: Icons.check_circle_outline,
              label: 'Correct Answers',
              value: '${widget.result.correctAnswers}/${widget.result.totalQuestions}',
              color: AppColors.primary,
            ),
            const SizedBox(height: AppSpacing.md),

            // Time spent card
            _buildResultCard(
              icon: Icons.timer,
              label: 'Time Spent',
              value: _formatTime(widget.result.timeSpent),
              color: AppColors.primary,
            ),
            const SizedBox(height: AppSpacing.md),

            // Passing score card
            _buildResultCard(
              icon: Icons.flag,
              label: 'Passing Score',
              value: '${widget.quiz.passingScore}%',
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: AppSpacing.xl),

            // Review answers button
            OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  _showReview = true;
                });
              },
              icon: const Icon(Icons.visibility),
              label: const Text('Review Answers'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(AppSpacing.md),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Back to course button
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(AppSpacing.md),
              ),
              child: const Text('Back to Course'),
            ),

            // Retake quiz button (if allowed)
            if (!isPassed && _canRetake()) ...[
              const SizedBox(height: AppSpacing.md),
              TextButton.icon(
                onPressed: () {
                  // Navigate back and trigger quiz reload
                  context.pop();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Retake Quiz'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildReviewMode() {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          color: AppColors.surfaceVariant,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _showReview = false;
                  });
                },
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Answer Review',
                      style: AppTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${widget.result.correctAnswers}/${widget.result.totalQuestions} correct',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Questions review
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: AppSpacing.lg),
            itemCount: widget.questions.length,
            itemBuilder: (context, index) {
              final questionWithAnswers = widget.questions[index];
              final question = questionWithAnswers.question;
              final answers = questionWithAnswers.answers;
              final selectedAnswers = widget.userAnswers[question.id] ?? [];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.md,
                      AppSpacing.md,
                      AppSpacing.md,
                      0,
                    ),
                    child: Row(
                      children: [
                        _buildQuestionStatusBadge(questionWithAnswers, selectedAnswers),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          'Question ${index + 1}',
                          style: AppTypography.titleSmall.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  QuestionWidget(
                    question: question,
                    answers: answers,
                    selectedAnswerIds: selectedAnswers,
                    onAnswerSelected: (_) {}, // Read-only in review mode
                    showCorrectAnswers: true,
                    isReview: true,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildResultCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                label,
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            Text(
              value,
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionStatusBadge(
    dynamic questionWithAnswers,
    List<String> selectedAnswers,
  ) {
    final answers = questionWithAnswers.answers;

    final correctAnswerIds = answers
        .where((answer) => answer.isCorrect)
        .map((answer) => answer.id)
        .toSet();

    final isCorrect = selectedAnswers.isNotEmpty &&
        selectedAnswers.every((id) => correctAnswerIds.contains(id)) &&
        selectedAnswers.length == correctAnswerIds.length;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: isCorrect
            ? Colors.green.withValues(alpha: 0.1)
            : Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCorrect ? Colors.green : Colors.red,
        ),
      ),
      child: Icon(
        isCorrect ? Icons.check : Icons.close,
        size: 16,
        color: isCorrect ? Colors.green : Colors.red,
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  bool _canRetake() {
    if (widget.quiz.maxAttempts == null) {
      return true; // Unlimited attempts
    }

    // TODO: Check actual attempt count from backend
    // For now, allow retake if max attempts is defined
    return widget.quiz.maxAttempts! > 1;
  }
}
