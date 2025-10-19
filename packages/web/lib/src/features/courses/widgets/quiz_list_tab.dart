import 'package:flutter/material.dart';
import 'package:common/common.dart' as common;

/// Onglet affichant la liste des quizzes d'un cours (Version simplifiée)
class QuizListTab extends StatelessWidget {
  final String courseId;

  const QuizListTab({
    super.key,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Implémenter le chargement des quizzes depuis le QuizBloc
    return _buildEmptyState();
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.quiz_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Aucun quiz disponible',
            style: common.AppTypography.titleMedium.copyWith(
              color: common.AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Les quiz seront disponibles prochainement',
            style: common.AppTypography.bodyMedium.copyWith(
              color: common.AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
