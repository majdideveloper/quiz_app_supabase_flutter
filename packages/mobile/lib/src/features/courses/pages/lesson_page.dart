import 'package:flutter/material.dart';
import 'package:common/common.dart';

import '../widgets/lesson_video_player.dart';

/// Lesson page for viewing lesson content
///
/// Supports different lesson types:
/// - Video lessons with video player
/// - Text/PDF lessons with content display
/// - Progress tracking and completion marking
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
  bool _isCompleted = false;
  double _videoProgress = 0.0;

  // TODO: Load lesson data from BLoC
  // For now, using placeholder data
  final LessonEntity _lesson = LessonEntity(
    id: '1',
    courseId: '1',
    title: 'Introduction to Flutter',
    description: 'Learn the basics of Flutter development',
    content: 'This is the lesson content',
    orderIndex: 1,
    duration: 30,
    videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_lesson.title),
        actions: [
          // Mark as complete button
          if (!_isCompleted)
            IconButton(
              onPressed: _markAsComplete,
              icon: const Icon(Icons.check_circle_outline),
              tooltip: 'Mark as complete',
            )
          else
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Content based on lesson type
            _buildLessonContent(),

            // Lesson info
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress indicator for video
                  if (_lesson.hasVideo && _videoProgress > 0)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Progress',
                              style: AppTypography.titleSmall,
                            ),
                            Text(
                              '${(_videoProgress * 100).toInt()}%',
                              style: AppTypography.titleSmall.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        LinearProgressIndicator(
                          value: _videoProgress,
                          backgroundColor: AppColors.surfaceVariant,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                      ],
                    ),

                  // Description
                  Text(
                    'About this lesson',
                    style: AppTypography.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    _lesson.description,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        size: 20,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Text(
                        'Duration: ${_lesson.duration} minutes',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Mark as complete button (large)
                  if (!_isCompleted)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _markAsComplete,
                        icon: const Icon(Icons.check),
                        label: const Text('Mark as Complete'),
                      ),
                    )
                  else
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            'Completed',
                            style: AppTypography.titleSmall.copyWith(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonContent() {
    // Check if lesson has video
    if (_lesson.hasVideo) {
      return _buildVideoContent();
    }

    // Otherwise show text content
    return _buildTextContent();
  }

  Widget _buildVideoContent() {
    if (_lesson.videoUrl == null) {
      return _buildErrorContent('Video URL not available');
    }

    return LessonVideoPlayer(
      videoUrl: _lesson.videoUrl!,
      onProgress: (position, duration) {
        if (duration.inSeconds > 0) {
          setState(() {
            _videoProgress = position.inSeconds / duration.inSeconds;
          });

          // Auto-mark as complete when video reaches 90%
          if (_videoProgress >= 0.9 && !_isCompleted) {
            _markAsComplete();
          }
        }
      },
      onCompleted: () {
        if (!_isCompleted) {
          _markAsComplete();
        }
      },
    );
  }

  Widget _buildTextContent() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Text(
        _lesson.content,
        style: AppTypography.bodyLarge,
      ),
    );
  }

  Widget _buildErrorContent(String message) {
    return Container(
      height: 200,
      color: AppColors.surfaceVariant,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              message,
              style: AppTypography.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  void _markAsComplete() {
    // TODO: Call BLoC to update lesson progress
    setState(() {
      _isCompleted = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Lesson marked as complete!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
