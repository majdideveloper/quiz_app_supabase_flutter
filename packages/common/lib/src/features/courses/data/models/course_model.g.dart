// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseModelImpl _$$CourseModelImplFromJson(Map<String, dynamic> json) =>
    _$CourseModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$CourseCategoryEnumMap, json['category']),
      thumbnailUrl: json['thumbnail_url'] as String?,
      instructorId: json['instructor_id'] as String,
      instructorName: json['instructor_name'] as String,
      price: (json['price'] as num).toDouble(),
      duration: (json['duration'] as num).toInt(),
      level: $enumDecode(_$CourseLevelEnumMap, json['level']),
      isPublished: json['is_published'] as bool,
      enrollmentCount: (json['enrollment_count'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      ratingCount: (json['rating_count'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CourseModelImplToJson(_$CourseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': _$CourseCategoryEnumMap[instance.category]!,
      'thumbnail_url': instance.thumbnailUrl,
      'instructor_id': instance.instructorId,
      'instructor_name': instance.instructorName,
      'price': instance.price,
      'duration': instance.duration,
      'level': _$CourseLevelEnumMap[instance.level]!,
      'is_published': instance.isPublished,
      'enrollment_count': instance.enrollmentCount,
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$CourseCategoryEnumMap = {
  CourseCategory.ccq: 'ccq',
  CourseCategory.nonConstruction: 'non_construction',
  CourseCategory.redSeal: 'red_seal',
};

const _$CourseLevelEnumMap = {
  CourseLevel.beginner: 'beginner',
  CourseLevel.intermediate: 'intermediate',
  CourseLevel.advanced: 'advanced',
  CourseLevel.expert: 'expert',
};
