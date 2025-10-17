import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/answer_entity.dart';

part 'answer_model.freezed.dart';
part 'answer_model.g.dart';

/// Answer model for data layer
///
/// This is the data layer representation of an answer. It extends [AnswerEntity]
/// and adds JSON serialization capabilities for API communication.
///
/// The model maps to the `quiz_answers` table in Supabase.
@freezed
class AnswerModel with _$AnswerModel {
  const factory AnswerModel({
    required String id,
    @JsonKey(name: 'question_id') required String questionId,
    @JsonKey(name: 'answer_text') required String answerText,
    @JsonKey(name: 'is_correct') required bool isCorrect,
    @JsonKey(name: 'order_index') required int orderIndex,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _AnswerModel;

  const AnswerModel._();

  /// Create AnswerModel from JSON
  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  /// Convert AnswerModel to domain entity
  AnswerEntity toEntity() {
    return AnswerEntity(
      id: id,
      questionId: questionId,
      answerText: answerText,
      isCorrect: isCorrect,
      orderIndex: orderIndex,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Create AnswerModel from domain entity
  factory AnswerModel.fromEntity(AnswerEntity entity) {
    return AnswerModel(
      id: entity.id,
      questionId: entity.questionId,
      answerText: entity.answerText,
      isCorrect: entity.isCorrect,
      orderIndex: entity.orderIndex,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
