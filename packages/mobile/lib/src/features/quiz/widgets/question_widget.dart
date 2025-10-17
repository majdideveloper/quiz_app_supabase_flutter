import 'package:flutter/material.dart';
import 'package:common/common.dart';

/// Question widget
///
/// Displays a question with its answers and handles selection
class QuestionWidget extends StatelessWidget {
  final QuestionEntity question;
  final List<AnswerEntity> answers;
  final List<String> selectedAnswerIds;
  final Function(List<String>) onAnswerSelected;
  final bool showCorrectAnswers;
  final bool isReview;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.answers,
    required this.selectedAnswerIds,
    required this.onAnswerSelected,
    this.showCorrectAnswers = false,
    this.isReview = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(AppSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _getQuestionTypeLabel(),
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                if (question.points > 1)
                  Text(
                    '${question.points} points',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Question text
            Text(
              question.questionText,
              style: AppTypography.titleMedium,
            ),

            // Question image (if available)
            if (question.imageUrl != null) ...[
              const SizedBox(height: AppSpacing.md),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  question.imageUrl!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: AppColors.surfaceVariant,
                      child: const Icon(Icons.broken_image),
                    );
                  },
                ),
              ),
            ],

            const SizedBox(height: AppSpacing.lg),

            // Answers
            ...answers.asMap().entries.map((entry) {
              final index = entry.key;
              final answer = entry.value;
              return _buildAnswerOption(index, answer);
            }),

            // Explanation (if review mode and has explanation)
            if (isReview && question.explanation != null) ...[
              const SizedBox(height: AppSpacing.lg),
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.lightbulb_outline,
                          size: 20,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          'Explanation',
                          style: AppTypography.titleSmall.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      question.explanation!,
                      style: AppTypography.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerOption(int index, AnswerEntity answer) {
    final isSelected = selectedAnswerIds.contains(answer.id);
    final isCorrect = answer.isCorrect;
    final showResult = showCorrectAnswers;

    Color? backgroundColor;
    Color? borderColor;
    IconData? icon;

    if (showResult) {
      if (isCorrect) {
        backgroundColor = Colors.green.withValues(alpha: 0.1);
        borderColor = Colors.green;
        icon = Icons.check_circle;
      } else if (isSelected && !isCorrect) {
        backgroundColor = Colors.red.withValues(alpha: 0.1);
        borderColor = Colors.red;
        icon = Icons.cancel;
      }
    } else if (isSelected) {
      backgroundColor = AppColors.primary.withValues(alpha: 0.1);
      borderColor = AppColors.primary;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: isReview ? null : () => _handleAnswerTap(answer.id),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: borderColor ?? AppColors.surfaceVariant,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              // Answer letter/number
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isSelected
                      ? (showResult && !isCorrect
                          ? Colors.red
                          : AppColors.primary)
                      : AppColors.surfaceVariant,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    String.fromCharCode(65 + index), // A, B, C, D
                    style: AppTypography.titleSmall.copyWith(
                      color: isSelected ? Colors.white : AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),

              // Answer text
              Expanded(
                child: Text(
                  answer.answerText,
                  style: AppTypography.bodyMedium,
                ),
              ),

              // Result icon
              if (showResult && icon != null) ...[
                const SizedBox(width: AppSpacing.sm),
                Icon(
                  icon,
                  color: isCorrect ? Colors.green : Colors.red,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _handleAnswerTap(String answerId) {
    if (question.questionType == QuestionType.multipleSelect) {
      // For multiple select, allow multiple selections
      final newSelection = List<String>.from(selectedAnswerIds);
      if (newSelection.contains(answerId)) {
        newSelection.remove(answerId);
      } else {
        newSelection.add(answerId);
      }
      onAnswerSelected(newSelection);
    } else {
      // For single choice (including multipleChoice and trueFalse), replace selection
      onAnswerSelected([answerId]);
    }
  }

  String _getQuestionTypeLabel() {
    switch (question.questionType) {
      case QuestionType.multipleChoice:
        return 'Multiple Choice';
      case QuestionType.trueFalse:
        return 'True/False';
      case QuestionType.multipleSelect:
        return 'Multiple Select';
    }
  }
}
