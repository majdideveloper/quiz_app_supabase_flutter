import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/question_entity.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

/// Question model for data layer
///
/// This is the data layer representation of a question. It extends [QuestionEntity]
/// and adds JSON serialization capabilities for API communication.
///
/// The model maps to the `quiz_questions` table in Supabase.
@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String id,
    @JsonKey(name: 'quiz_id') required String quizId,
    @JsonKey(name: 'question_text') required String questionText,
    @JsonKey(name: 'question_type') required QuestionType questionType,
    @JsonKey(name: 'order_index') required int orderIndex,
    @Default(1) int points,
    String? explanation,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _QuestionModel;

  const QuestionModel._();

  /// Create QuestionModel from JSON
  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  /// Convert QuestionModel to domain entity
  QuestionEntity toEntity() {
    return QuestionEntity(
      id: id,
      quizId: quizId,
      questionText: questionText,
      questionType: questionType,
      orderIndex: orderIndex,
      points: points,
      explanation: explanation,
      imageUrl: imageUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Create QuestionModel from domain entity
  factory QuestionModel.fromEntity(QuestionEntity entity) {
    return QuestionModel(
      id: entity.id,
      quizId: entity.quizId,
      questionText: entity.questionText,
      questionType: entity.questionType,
      orderIndex: entity.orderIndex,
      points: entity.points,
      explanation: entity.explanation,
      imageUrl: entity.imageUrl,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
