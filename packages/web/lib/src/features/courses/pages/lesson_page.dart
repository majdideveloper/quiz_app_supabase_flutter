import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart' as common;
import '../../../common/widgets/app_navbar.dart';
import '../../../common/widgets/app_footer.dart';
import '../../../core/utils/responsive_helper.dart';
import '../widgets/web_video_player.dart';

/// Page de visualisation d'une leçon avec lecteur vidéo
class LessonPage extends StatefulWidget {
  final String courseId;
  final String lessonId;

  const LessonPage({
    super.key,
    required this.courseId,
    required this.lessonId,
  });

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  // TODO: Charger la leçon depuis le BLoC
  // Pour l'instant, données de démonstration
  final _demoLesson = common.LessonEntity(
    id: '1',
    courseId: '1',
    title: 'Introduction à l\'électricité',
    description: 'Découvrez les bases de l\'électricité et les concepts fondamentaux.',
    content: 'Contenu de la leçon...',
    orderIndex: 1,
    duration: 15,
    videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Scaffold(
      appBar: const AppNavbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb et navigation
            _buildBreadcrumb(context),

            // Contenu principal
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: ResponsiveHelper.getMaxContentWidth(context),
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    ResponsiveHelper.getHorizontalPadding(context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Titre de la leçon
                      Text(
                        _demoLesson.title,
                        style: (isMobile
                                ? common.AppTypography.headlineSmall
                                : common.AppTypography.displaySmall)
                            .copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Métadonnées
                      Row(
                        children: [
                          _buildMetadata(
                            Icons.access_time,
                            _demoLesson.formattedDuration,
                          ),
                          const SizedBox(width: 24),
                          _buildMetadata(
                            Icons.play_circle_outline,
                            _demoLesson.hasVideo ? 'Vidéo' : 'Texte',
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Lecteur vidéo ou contenu
                      _buildLessonContent(isMobile),

                      const SizedBox(height: 32),

                      // Description
                      Text(
                        'À propos de cette leçon',
                        style: common.AppTypography.titleLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _demoLesson.description,
                        style: common.AppTypography.bodyLarge.copyWith(
                          color: common.AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Bouton marquer comme terminé
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Marquer la leçon comme terminée
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Leçon marquée comme terminée !'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.check_circle),
                          label: const Text('Marquer comme terminé'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Navigation leçon précédente/suivante
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {
                                // TODO: Naviguer vers leçon précédente
                              },
                              icon: const Icon(Icons.arrow_back),
                              label: const Text('Leçon précédente'),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // TODO: Naviguer vers leçon suivante
                              },
                              icon: const Icon(Icons.arrow_forward),
                              label: const Text('Leçon suivante'),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            ),

            // Footer
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildBreadcrumb(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context),
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: common.AppColors.surfaceVariant,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveHelper.getMaxContentWidth(context),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () => context.go('/courses'),
                child: Text(
                  'Cours',
                  style: common.AppTypography.bodyMedium.copyWith(
                    color: common.AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, size: 20),
              const SizedBox(width: 8),
              InkWell(
                onTap: () => context.go('/courses/${widget.courseId}'),
                child: Text(
                  'Détails du cours',
                  style: common.AppTypography.bodyMedium.copyWith(
                    color: common.AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _demoLesson.title,
                  style: common.AppTypography.bodyMedium.copyWith(
                    color: common.AppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLessonContent(bool isMobile) {
    // Afficher la vidéo si disponible
    if (_demoLesson.hasVideo) {
      return WebVideoPlayer(
        videoUrl: _demoLesson.videoUrl!,
        aspectRatio: isMobile ? 16 / 9 : 16 / 9,
      );
    }

    // Sinon afficher le contenu texte
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          _demoLesson.content,
          style: common.AppTypography.bodyLarge,
        ),
      ),
    );
  }

  Widget _buildMetadata(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: common.AppColors.textSecondary),
        const SizedBox(width: 6),
        Text(
          text,
          style: common.AppTypography.bodyMedium.copyWith(
            color: common.AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

}
