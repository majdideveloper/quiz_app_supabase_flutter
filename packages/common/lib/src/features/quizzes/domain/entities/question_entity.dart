import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_entity.freezed.dart';

/// Question entity representing a quiz question
///
/// This is the domain layer representation of a question in a quiz.
/// Each question belongs to a quiz and has multiple answer options.
///
/// Properties:
/// - [id]: Unique identifier (UUID)
/// - [quizId]: ID of the parent quiz
/// - [questionText]: The question text
/// - [questionType]: Type of question (multiple choice, true/false, etc.)
/// - [orderIndex]: Order of the question in the quiz
/// - [points]: Points awarded for correct answer
/// - [explanation]: Explanation shown after answering (optional)
/// - [imageUrl]: URL to question image (optional)
/// - [createdAt]: Question creation timestamp
/// - [updatedAt]: Last update timestamp
@freezed
class QuestionEntity with _$QuestionEntity {
  const factory QuestionEntity({
    required String id,
    required String quizId,
    required String questionText,
    required QuestionType questionType,
    required int orderIndex,
    @Default(1) int points,
    String? explanation,
    String? imageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _QuestionEntity;

  const QuestionEntity._();

  /// Check if the question has an image
  bool get hasImage => imageUrl != null && imageUrl!.isNotEmpty;

  /// Check if the question has an explanation
  bool get hasExplanation => explanation != null && explanation!.isNotEmpty;

  /// Get question number (1-based)
  int get questionNumber => orderIndex + 1;

  /// Get display title (e.g., "Question 1")
  String get displayTitle => 'Question $questionNumber';

  /// Check if this is a multiple choice question
  bool get isMultipleChoice => questionType == QuestionType.multipleChoice;

  /// Check if this is a true/false question
  bool get isTrueFalse => questionType == QuestionType.trueFalse;

  /// Check if this is a multiple select question
  bool get isMultipleSelect => questionType == QuestionType.multipleSelect;

  /// Get question type display name in French
  String get questionTypeDisplayName {
    switch (questionType) {
      case QuestionType.multipleChoice:
        return 'Choix multiple';
      case QuestionType.trueFalse:
        return 'Vrai ou Faux';
      case QuestionType.multipleSelect:
        return 'Sélection multiple';
    }
  }

  /// Get formatted points (e.g., "1 point" or "5 points")
  String get formattedPoints {
    return '$points ${points == 1 ? 'point' : 'points'}';
  }
}

/// Question type enumeration
///
/// Represents the type of question:
/// - [multipleChoice]: Single correct answer from multiple options
/// - [trueFalse]: True or false question
/// - [multipleSelect]: Multiple correct answers from multiple options
enum QuestionType {
  @JsonValue('multiple_choice')
  multipleChoice,
  @JsonValue('true_false')
  trueFalse,
  @JsonValue('multiple_select')
  multipleSelect,
}
