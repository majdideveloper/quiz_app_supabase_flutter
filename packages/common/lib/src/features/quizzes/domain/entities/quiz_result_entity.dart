import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_result_entity.freezed.dart';

/// Quiz result entity representing a user's quiz attempt result
///
/// This is the domain layer representation of a quiz attempt result.
/// It contains the user's answers, score, and other attempt details.
///
/// Properties:
/// - [id]: Unique identifier (UUID)
/// - [quizId]: ID of the quiz
/// - [userId]: ID of the user who took the quiz
/// - [score]: Score achieved (0-100)
/// - [totalQuestions]: Total number of questions in the quiz
/// - [correctAnswers]: Number of correct answers
/// - [incorrectAnswers]: Number of incorrect answers
/// - [timeSpent]: Time spent in seconds
/// - [passed]: Whether the user passed (score >= passing score)
/// - [attemptNumber]: Attempt number (1, 2, 3, etc.)
/// - [startedAt]: When the quiz attempt was started
/// - [submittedAt]: When the quiz was submitted
/// - [createdAt]: Result creation timestamp
@freezed
class QuizResultEntity with _$QuizResultEntity {
  const factory QuizResultEntity({
    required String id,
    required String quizId,
    required String userId,
    required double score,
    required int totalQuestions,
    required int correctAnswers,
    required int incorrectAnswers,
    required int timeSpent,
    required bool passed,
    required int attemptNumber,
    required DateTime startedAt,
    required DateTime submittedAt,
    required DateTime createdAt,
  }) = _QuizResultEntity;

  const QuizResultEntity._();

  /// Get formatted score (e.g., "85%")
  String get formattedScore => '${score.toStringAsFixed(1)}%';

  /// Get formatted time spent (e.g., "15:30" or "1:25:45")
  String get formattedTimeSpent {
    final hours = timeSpent ~/ 3600;
    final minutes = (timeSpent % 3600) ~/ 60;
    final seconds = timeSpent % 60;

    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Get score percentage as integer (e.g., 85 from 85.5%)
  int get scorePercentage => score.round();

  /// Get number of unanswered questions
  int get unansweredQuestions => totalQuestions - (correctAnswers + incorrectAnswers);

  /// Check if there are unanswered questions
  bool get hasUnansweredQuestions => unansweredQuestions > 0;

  /// Get percentage of correct answers
  double get correctPercentage => (correctAnswers / totalQuestions) * 100;

  /// Get percentage of incorrect answers
  double get incorrectPercentage => (incorrectAnswers / totalQuestions) * 100;

  /// Get result grade based on score
  QuizGrade get grade {
    if (score >= 90) return QuizGrade.aPlus;
    if (score >= 85) return QuizGrade.a;
    if (score >= 80) return QuizGrade.aMinus;
    if (score >= 75) return QuizGrade.bPlus;
    if (score >= 70) return QuizGrade.b;
    if (score >= 65) return QuizGrade.bMinus;
    if (score >= 60) return QuizGrade.cPlus;
    if (score >= 55) return QuizGrade.c;
    if (score >= 50) return QuizGrade.cMinus;
    if (score >= 45) return QuizGrade.dPlus;
    if (score >= 40) return QuizGrade.d;
    return QuizGrade.f;
  }

  /// Get grade display name
  String get gradeDisplayName {
    switch (grade) {
      case QuizGrade.aPlus:
        return 'A+';
      case QuizGrade.a:
        return 'A';
      case QuizGrade.aMinus:
        return 'A-';
      case QuizGrade.bPlus:
        return 'B+';
      case QuizGrade.b:
        return 'B';
      case QuizGrade.bMinus:
        return 'B-';
      case QuizGrade.cPlus:
        return 'C+';
      case QuizGrade.c:
        return 'C';
      case QuizGrade.cMinus:
        return 'C-';
      case QuizGrade.dPlus:
        return 'D+';
      case QuizGrade.d:
        return 'D';
      case QuizGrade.f:
        return 'F';
    }
  }

  /// Get result status message
  String get statusMessage {
    if (passed) {
      if (score >= 90) return 'Excellent !';
      if (score >= 75) return 'Très bien !';
      return 'Réussi !';
    } else {
      return 'Échec';
    }
  }

  /// Get duration of the attempt
  Duration get attemptDuration => submittedAt.difference(startedAt);
}

/// Quiz grade enumeration
///
/// Represents the letter grade based on score
enum QuizGrade {
  aPlus, // 90-100
  a, // 85-89
  aMinus, // 80-84
  bPlus, // 75-79
  b, // 70-74
  bMinus, // 65-69
  cPlus, // 60-64
  c, // 55-59
  cMinus, // 50-54
  dPlus, // 45-49
  d, // 40-44
  f, // < 40
}
