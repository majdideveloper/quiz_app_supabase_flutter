import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/quiz_entity.dart';

part 'quiz_model.freezed.dart';
part 'quiz_model.g.dart';

/// Quiz model for data layer
///
/// This is the data layer representation of a quiz. It extends [QuizEntity]
/// and adds JSON serialization capabilities for API communication.
///
/// The model maps to the `quizzes` table in Supabase.
@freezed
class QuizModel with _$QuizModel {
  const factory QuizModel({
    required String id,
    @JsonKey(name: 'course_id')
    required String courseId,
    @JsonKey(name: 'lesson_id')
    String? lessonId,
    required String title,
    required String description,
    @JsonKey(name: 'quiz_type')
    required QuizType quizType,
    @JsonKey(name: 'passing_score')
    required int passingScore,
    @JsonKey(name: 'time_limit')
    int? timeLimit,
    @JsonKey(name: 'questions_count')
    required int questionsCount,
    @JsonKey(name: 'max_attempts')
    int? maxAttempts,
    @JsonKey(name: 'shuffle_questions')
    @Default(true)
    bool shuffleQuestions,
    @JsonKey(name: 'shuffle_answers')
    @Default(true)
    bool shuffleAnswers,
    @JsonKey(name: 'show_correct_answers')
    @Default(true)
    bool showCorrectAnswers,
    @JsonKey(name: 'is_active')
    @Default(true)
    bool isActive,
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
    @JsonKey(name: 'updated_at')
    required DateTime updatedAt,
  }) = _QuizModel;

  const QuizModel._();

  /// Create QuizModel from JSON
  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);

  /// Convert QuizModel to domain entity
  QuizEntity toEntity() {
    return QuizEntity(
      id: id,
      courseId: courseId,
      lessonId: lessonId,
      title: title,
      description: description,
      quizType: quizType,
      passingScore: passingScore,
      timeLimit: timeLimit,
      questionsCount: questionsCount,
      maxAttempts: maxAttempts,
      shuffleQuestions: shuffleQuestions,
      shuffleAnswers: shuffleAnswers,
      showCorrectAnswers: showCorrectAnswers,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Create QuizModel from domain entity
  factory QuizModel.fromEntity(QuizEntity entity) {
    return QuizModel(
      id: entity.id,
      courseId: entity.courseId,
      lessonId: entity.lessonId,
      title: entity.title,
      description: entity.description,
      quizType: entity.quizType,
      passingScore: entity.passingScore,
      timeLimit: entity.timeLimit,
      questionsCount: entity.questionsCount,
      maxAttempts: entity.maxAttempts,
      shuffleQuestions: entity.shuffleQuestions,
      shuffleAnswers: entity.shuffleAnswers,
      showCorrectAnswers: entity.showCorrectAnswers,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
