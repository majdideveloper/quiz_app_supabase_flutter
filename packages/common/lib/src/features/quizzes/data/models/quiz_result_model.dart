import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/quiz_result_entity.dart';

part 'quiz_result_model.freezed.dart';
part 'quiz_result_model.g.dart';

/// Quiz result model for data layer
///
/// This is the data layer representation of a quiz result. It extends [QuizResultEntity]
/// and adds JSON serialization capabilities for API communication.
///
/// The model maps to the `quiz_attempts` table in Supabase.
@freezed
class QuizResultModel with _$QuizResultModel {
  const factory QuizResultModel({
    required String id,
    @JsonKey(name: 'quiz_id')
    required String quizId,
    @JsonKey(name: 'user_id')
    required String userId,
    required double score,
    @JsonKey(name: 'total_questions')
    required int totalQuestions,
    @JsonKey(name: 'correct_answers')
    required int correctAnswers,
    @JsonKey(name: 'incorrect_answers')
    required int incorrectAnswers,
    @JsonKey(name: 'time_spent')
    required int timeSpent,
    required bool passed,
    @JsonKey(name: 'attempt_number')
    required int attemptNumber,
    @JsonKey(name: 'started_at')
    required DateTime startedAt,
    @JsonKey(name: 'submitted_at')
    required DateTime submittedAt,
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
  }) = _QuizResultModel;

  const QuizResultModel._();

  /// Create QuizResultModel from JSON
  factory QuizResultModel.fromJson(Map<String, dynamic> json) =>
      _$QuizResultModelFromJson(json);

  /// Convert QuizResultModel to domain entity
  QuizResultEntity toEntity() {
    return QuizResultEntity(
      id: id,
      quizId: quizId,
      userId: userId,
      score: score,
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
      incorrectAnswers: incorrectAnswers,
      timeSpent: timeSpent,
      passed: passed,
      attemptNumber: attemptNumber,
      startedAt: startedAt,
      submittedAt: submittedAt,
      createdAt: createdAt,
    );
  }

  /// Create QuizResultModel from domain entity
  factory QuizResultModel.fromEntity(QuizResultEntity entity) {
    return QuizResultModel(
      id: entity.id,
      quizId: entity.quizId,
      userId: entity.userId,
      score: entity.score,
      totalQuestions: entity.totalQuestions,
      correctAnswers: entity.correctAnswers,
      incorrectAnswers: entity.incorrectAnswers,
      timeSpent: entity.timeSpent,
      passed: entity.passed,
      attemptNumber: entity.attemptNumber,
      startedAt: entity.startedAt,
      submittedAt: entity.submittedAt,
      createdAt: entity.createdAt,
    );
  }
}
