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
      description: json['description'] as String? ?? '',
      quizType:
          $enumDecodeNullable(_$QuizTypeEnumMap, json['quiz_type']) ??
          QuizType.lesson,
      passingScore: (json['passing_score'] as num?)?.toInt() ?? 70,
      timeLimit: (json['time_limit_minutes'] as num?)?.toInt(),
      maxAttempts: (json['max_attempts'] as num?)?.toInt(),
      orderIndex: (json['order_index'] as num).toInt(),
      isRequired: json['is_required'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
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
      'time_limit_minutes': instance.timeLimit,
      'max_attempts': instance.maxAttempts,
      'order_index': instance.orderIndex,
      'is_required': instance.isRequired,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$QuizTypeEnumMap = {
  QuizType.lesson: 'lesson',
  QuizType.midterm: 'midterm',
  QuizType.finalExam: 'final',
};
