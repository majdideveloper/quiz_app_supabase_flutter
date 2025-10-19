import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/common.dart' as common;
import '../../../core/utils/responsive_helper.dart';

/// Onglet affichant la liste des quizzes d'un cours
class QuizListTab extends StatefulWidget {
  final String courseId;

  const QuizListTab({
    super.key,
    required this.courseId,
  });

  @override
  State<QuizListTab> createState() => _QuizListTabState();
}

class _QuizListTabState extends State<QuizListTab> {
  @override
  void initState() {
    super.initState();
    // Charger les quizzes du cours
    context.read<common.QuizBloc>().add(
          common.QuizEvent.loadCourseQuizzes(widget.courseId),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<common.QuizBloc, common.QuizState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          quizzesLoaded: (quizzes) {
            if (quizzes.isEmpty) {
              return _buildEmptyState();
            }
            return _buildQuizList(context, quizzes);
          },
          quizLoaded: (_, __) => const Center(child: CircularProgressIndicator()),
          quizInProgress: (_, __, ___, ____, _____, ______) => const Center(child: CircularProgressIndicator()),
          quizSubmitted: (_, __, ___, ____) => const Center(child: CircularProgressIndicator()),
          error: (message) => _buildErrorState(message),
        );
      },
    );
  }

  Widget _buildQuizList(BuildContext context, List<common.QuizEntity> quizzes) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxContentWidth(context),
        ),
        child: ListView.separated(
          padding: EdgeInsets.all(
            ResponsiveHelper.getHorizontalPadding(context),
          ),
          itemCount: quizzes.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final quiz = quizzes[index];
            return _buildQuizCard(context, quiz);
          },
        ),
      ),
    );
  }

  Widget _buildQuizCard(BuildContext context, common.QuizEntity quiz) {
    return Card(
      elevation: 1,
      child: InkWell(
        onTap: () {
          // TODO: Navigate to quiz taking page
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Quiz "${quiz.title}" - Navigation à implémenter'),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Icône du type de quiz
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: _getQuizTypeColor(quiz.quizType).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(
                      _getQuizTypeIcon(quiz.quizType),
                      color: _getQuizTypeColor(quiz.quizType),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Titre et type
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quiz.title,
                          style: common.AppTypography.titleMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          quiz.quizTypeDisplayName,
                          style: common.AppTypography.bodySmall.copyWith(
                            color: _getQuizTypeColor(quiz.quizType),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              if (quiz.description.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  quiz.description,
                  style: common.AppTypography.bodyMedium.copyWith(
                    color: common.AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],

              const SizedBox(height: 16),

              // Métadonnées
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  _buildMetaChip(
                    Icons.quiz,
                    '${quiz.questionsCount} questions',
                    common.AppColors.primary,
                  ),
                  _buildMetaChip(
                    Icons.percent,
                    'Note de passage: ${quiz.passingScore}%',
                    common.AppColors.secondary,
                  ),
                  if (quiz.hasTimeLimit)
                    _buildMetaChip(
                      Icons.timer,
                      quiz.formattedTimeLimit,
                      common.AppColors.warning,
                    ),
                  if (quiz.hasMaxAttempts)
                    _buildMetaChip(
                      Icons.refresh,
                      quiz.formattedMaxAttempts,
                      common.AppColors.info,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetaChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: common.AppTypography.bodySmall.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _getQuizTypeColor(common.QuizType type) {
    switch (type) {
      case common.QuizType.lesson:
        return common.AppColors.primary;
      case common.QuizType.midterm:
        return common.AppColors.warning;
      case common.QuizType.finalExam:
        return common.AppColors.error;
    }
  }

  IconData _getQuizTypeIcon(common.QuizType type) {
    switch (type) {
      case common.QuizType.lesson:
        return Icons.quiz;
      case common.QuizType.midterm:
        return Icons.assignment;
      case common.QuizType.finalExam:
        return Icons.workspace_premium;
    }
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
            'Les quiz seront ajoutés prochainement',
            style: common.AppTypography.bodyMedium.copyWith(
              color: common.AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: common.AppColors.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Erreur de chargement',
            style: common.AppTypography.titleMedium.copyWith(
              color: common.AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
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
