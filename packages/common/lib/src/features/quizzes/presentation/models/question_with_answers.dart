import 'package:common/common.dart';

/// Helper model to hold a question with its answers
///
/// This is used in the presentation layer to simplify quiz state management
class QuestionWithAnswers {
  final QuestionEntity question;
  final List<AnswerEntity> answers;

  const QuestionWithAnswers({
    required this.question,
    required this.answers,
  });

  /// Get the correct answer IDs for this question
  List<String> get correctAnswerIds {
    return answers
        .where((answer) => answer.isCorrect)
        .map((answer) => answer.id)
        .toList();
  }

  /// Check if user answers are correct
  bool isAnswerCorrect(List<String> userAnswerIds) {
    final correctIds = correctAnswerIds.toSet();
    final userIds = userAnswerIds.toSet();

    return correctIds.length == userIds.length &&
        correctIds.containsAll(userIds);
  }
}
