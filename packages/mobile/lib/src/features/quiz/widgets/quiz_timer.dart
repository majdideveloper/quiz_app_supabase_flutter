import 'package:flutter/material.dart';
import 'package:common/common.dart';

/// Quiz timer widget
///
/// Displays a countdown timer for timed quizzes
class QuizTimer extends StatelessWidget {
  final int? timeRemaining; // in seconds
  final int? totalTime; // in seconds

  const QuizTimer({
    super.key,
    this.timeRemaining,
    this.totalTime,
  });

  @override
  Widget build(BuildContext context) {
    if (timeRemaining == null || totalTime == null) {
      return const SizedBox.shrink();
    }

    final minutes = timeRemaining! ~/ 60;
    final seconds = timeRemaining! % 60;
    final progress = timeRemaining! / totalTime!;
    final isLowTime = timeRemaining! < 60; // Less than 1 minute

    Color timerColor;
    if (isLowTime) {
      timerColor = Colors.red;
    } else if (progress < 0.25) {
      timerColor = Colors.orange;
    } else {
      timerColor = AppColors.primary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: timerColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: timerColor,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.timer,
            color: timerColor,
            size: 20,
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
            style: AppTypography.titleMedium.copyWith(
              color: timerColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
