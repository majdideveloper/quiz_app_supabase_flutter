import 'package:flutter/material.dart';
import 'package:common/common.dart' as common;

/// Lecteur vidéo web (placeholder pour l'instant)
/// TODO: Implémenter avec video_player_web ou youtube_player_iframe
class WebVideoPlayer extends StatelessWidget {
  final String videoUrl;
  final double aspectRatio;

  const WebVideoPlayer({
    super.key,
    required this.videoUrl,
    this.aspectRatio = 16 / 9,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.play_circle_outline,
                size: 80,
                color: Colors.white.withValues(alpha: 0.8),
              ),
              const SizedBox(height: 16),
              Text(
                'Lecteur vidéo web',
                style: common.AppTypography.titleMedium.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  videoUrl,
                  style: common.AppTypography.bodySmall.copyWith(
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: () {
                  // TODO: Ouvrir la vidéo dans un nouvel onglet ou lecteur
                },
                icon: const Icon(Icons.open_in_new, color: Colors.white),
                label: Text(
                  'Ouvrir la vidéo',
                  style: common.AppTypography.bodyMedium.copyWith(
                    color: Colors.white,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
