import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_entity.freezed.dart';

/// Answer entity representing an answer option for a question
///
/// This is the domain layer representation of an answer option in a quiz question.
/// Each answer belongs to a question and can be marked as correct or incorrect.
///
/// Properties:
/// - [id]: Unique identifier (UUID)
/// - [questionId]: ID of the parent question
/// - [answerText]: The answer text
/// - [isCorrect]: Whether this answer is correct
/// - [orderIndex]: Order of the answer option
/// - [createdAt]: Answer creation timestamp
/// - [updatedAt]: Last update timestamp
@freezed
class AnswerEntity with _$AnswerEntity {
  const factory AnswerEntity({
    required String id,
    required String questionId,
    required String answerText,
    required bool isCorrect,
    required int orderIndex,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AnswerEntity;

  const AnswerEntity._();

  /// Get answer option label (A, B, C, D, etc.)
  String get optionLabel {
    const labels = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
    if (orderIndex < labels.length) {
      return labels[orderIndex];
    }
    return '${orderIndex + 1}';
  }

  /// Get display text with option label (e.g., "A. Answer text")
  String get displayText => '$optionLabel. $answerText';
}
