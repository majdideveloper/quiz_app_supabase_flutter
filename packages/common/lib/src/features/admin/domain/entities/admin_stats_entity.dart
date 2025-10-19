import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_stats_entity.freezed.dart';

/// Entité représentant les statistiques du tableau de bord admin
@freezed
class AdminStatsEntity with _$AdminStatsEntity {
  const factory AdminStatsEntity({
    required int totalUsers,
    required int totalCourses,
    required int totalQuizzes,
    required int totalEnrollments,
    required int activeUsers,
    required int publishedCourses,
    required int completedQuizzes,
    required double averageQuizScore,
  }) = _AdminStatsEntity;
}
