// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionModelImpl _$$QuestionModelImplFromJson(Map<String, dynamic> json) =>
    _$QuestionModelImpl(
      id: json['id'] as String,
      quizId: json['quiz_id'] as String,
      questionText: json['question_text'] as String,
      questionType: $enumDecode(_$QuestionTypeEnumMap, json['question_type']),
      orderIndex: (json['order_index'] as num).toInt(),
      points: (json['points'] as num?)?.toInt() ?? 1,
      explanation: json['explanation'] as String?,
      imageUrl: json['image_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quiz_id': instance.quizId,
      'question_text': instance.questionText,
      'question_type': _$QuestionTypeEnumMap[instance.questionType]!,
      'order_index': instance.orderIndex,
      'points': instance.points,
      'explanation': instance.explanation,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$QuestionTypeEnumMap = {
  QuestionType.multipleChoice: 'multiple_choice',
  QuestionType.trueFalse: 'true_false',
  QuestionType.multipleSelect: 'multiple_select',
};
