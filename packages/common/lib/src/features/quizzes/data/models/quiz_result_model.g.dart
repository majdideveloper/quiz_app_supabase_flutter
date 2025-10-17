// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizResultModelImpl _$$QuizResultModelImplFromJson(
  Map<String, dynamic> json,
) => _$QuizResultModelImpl(
  id: json['id'] as String,
  quizId: json['quiz_id'] as String,
  userId: json['user_id'] as String,
  score: (json['score'] as num).toDouble(),
  totalQuestions: (json['total_questions'] as num).toInt(),
  correctAnswers: (json['correct_answers'] as num).toInt(),
  incorrectAnswers: (json['incorrect_answers'] as num).toInt(),
  timeSpent: (json['time_spent'] as num).toInt(),
  passed: json['passed'] as bool,
  attemptNumber: (json['attempt_number'] as num).toInt(),
  startedAt: DateTime.parse(json['started_at'] as String),
  submittedAt: DateTime.parse(json['submitted_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$$QuizResultModelImplToJson(
  _$QuizResultModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'quiz_id': instance.quizId,
  'user_id': instance.userId,
  'score': instance.score,
  'total_questions': instance.totalQuestions,
  'correct_answers': instance.correctAnswers,
  'incorrect_answers': instance.incorrectAnswers,
  'time_spent': instance.timeSpent,
  'passed': instance.passed,
  'attempt_number': instance.attemptNumber,
  'started_at': instance.startedAt.toIso8601String(),
  'submitted_at': instance.submittedAt.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
};
