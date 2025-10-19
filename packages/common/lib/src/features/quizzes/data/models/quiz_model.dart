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
    @Default('')
    String description,
    @JsonKey(name: 'quiz_type')
    @Default(QuizType.lesson)
    QuizType quizType,
    @JsonKey(name: 'passing_score')
    @Default(70)
    int passingScore,
    @JsonKey(name: 'time_limit_minutes')
    int? timeLimit,
    @JsonKey(name: 'max_attempts')
    int? maxAttempts,
    @JsonKey(name: 'order_index')
    required int orderIndex,
    @JsonKey(name: 'is_required')
    @Default(true)
    bool isRequired,
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
  }) = _QuizModel;

  const QuizModel._();

  /// Create QuizModel from JSON
  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);

  /// Convert QuizModel to domain entity
  QuizEntity toEntity({int? questionsCount}) {
    return QuizEntity(
      id: id,
      courseId: courseId,
      lessonId: lessonId,
      title: title,
      description: description,
      quizType: quizType,
      passingScore: passingScore,
      timeLimit: timeLimit,
      questionsCount: questionsCount ?? 0,
      maxAttempts: maxAttempts,
      orderIndex: orderIndex,
      isRequired: isRequired,
      createdAt: createdAt,
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
      maxAttempts: entity.maxAttempts,
      orderIndex: entity.orderIndex,
      isRequired: entity.isRequired,
      createdAt: entity.createdAt,
    );
  }
}
