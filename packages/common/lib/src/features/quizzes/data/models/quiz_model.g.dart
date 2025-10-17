// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizModelImpl _$$QuizModelImplFromJson(Map<String, dynamic> json) =>
    _$QuizModelImpl(
      id: json['id'] as String,
      courseId: json['course_id'] as String,
      lessonId: json['lesson_id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      quizType: $enumDecode(_$QuizTypeEnumMap, json['quiz_type']),
      passingScore: (json['passing_score'] as num).toInt(),
      timeLimit: (json['time_limit'] as num?)?.toInt(),
      questionsCount: (json['questions_count'] as num).toInt(),
      maxAttempts: (json['max_attempts'] as num?)?.toInt(),
      shuffleQuestions: json['shuffle_questions'] as bool? ?? true,
      shuffleAnswers: json['shuffle_answers'] as bool? ?? true,
      showCorrectAnswers: json['show_correct_answers'] as bool? ?? true,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$QuizModelImplToJson(_$QuizModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'lesson_id': instance.lessonId,
      'title': instance.title,
      'description': instance.description,
      'quiz_type': _$QuizTypeEnumMap[instance.quizType]!,
      'passing_score': instance.passingScore,
      'time_limit': instance.timeLimit,
      'questions_count': instance.questionsCount,
      'max_attempts': instance.maxAttempts,
      'shuffle_questions': instance.shuffleQuestions,
      'shuffle_answers': instance.shuffleAnswers,
      'show_correct_answers': instance.showCorrectAnswers,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$QuizTypeEnumMap = {
  QuizType.lesson: 'lesson',
  QuizType.midterm: 'midterm',
  QuizType.finalExam: 'final',
};
