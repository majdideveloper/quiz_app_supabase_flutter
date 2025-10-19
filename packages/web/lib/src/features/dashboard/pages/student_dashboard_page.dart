import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart' as common;
import '../../../common/widgets/app_navbar.dart';
import '../../../common/widgets/app_footer.dart';
import '../../../core/utils/responsive_helper.dart';

/// Page principale du tableau de bord étudiant
class StudentDashboardPage extends StatefulWidget {
  const StudentDashboardPage({super.key});

  @override
  State<StudentDashboardPage> createState() => _StudentDashboardPageState();
}

class _StudentDashboardPageState extends State<StudentDashboardPage> {
  @override
  void initState() {
    super.initState();
    // Charger les cours inscrits
    context.read<common.CourseBloc>().add(const common.CourseEvent.loadCourses());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    return Scaffold(
      appBar: const AppNavbar(),
      body: Column(
        children: [
          // Header
          _buildHeader(context, theme, isMobile),

          // Contenu principal
          Expanded(
            child: SingleChildScrollView(
              child: Center(
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
                        const SizedBox(height: 32),

                        // Statistiques rapides
                        _buildQuickStats(context, theme, isMobile),

                        const SizedBox(height: 48),

                        // Cours inscrits
                        _buildEnrolledCourses(context, theme),

                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Footer
          const AppFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme, bool isMobile) {
    return BlocBuilder<common.AuthBloc, common.AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (user) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.getHorizontalPadding(context),
                vertical: isMobile ? 32 : 48,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.primary.withValues(alpha: 0.8),
                  ],
                ),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: ResponsiveHelper.getMaxContentWidth(context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bonjour, ${user.fullName}!',
                        style: (isMobile
                                ? theme.textTheme.headlineMedium
                                : theme.textTheme.displaySmall)
                            ?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Bienvenue sur votre tableau de bord',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildQuickStats(BuildContext context, ThemeData theme, bool isMobile) {
    // TODO: Implémenter les vraies statistiques depuis le backend
    final stats = [
      {'icon': Icons.school, 'title': 'Cours inscrits', 'value': '0', 'color': theme.colorScheme.primary},
      {'icon': Icons.play_circle, 'title': 'Leçons complétées', 'value': '0', 'color': theme.colorScheme.secondary},
      {'icon': Icons.quiz, 'title': 'Quiz réussis', 'value': '0', 'color': theme.colorScheme.tertiary},
      {'icon': Icons.emoji_events, 'title': 'Score moyen', 'value': '0%', 'color': Colors.orange},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 2 : 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: isMobile ? 1.2 : 1.5,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        return Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  stat['icon'] as IconData,
                  size: 40,
                  color: stat['color'] as Color,
                ),
                const SizedBox(height: 12),
                Text(
                  stat['value'] as String,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  stat['title'] as String,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEnrolledCourses(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Mes cours',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton.icon(
              onPressed: () => context.go('/courses'),
              icon: const Icon(Icons.add),
              label: const Text('Parcourir les cours'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        BlocBuilder<common.CourseBloc, common.CourseState>(
          builder: (context, state) {
            return state.maybeWhen(
              coursesLoaded: (courses, _, __, ___) {
                // TODO: Filtrer uniquement les cours inscrits
                if (courses.isEmpty) {
                  return _buildEmptyCourses(context, theme);
                }
                return _buildCourseList(courses, theme);
              },
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(48.0),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (message) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 48,
                        color: theme.colorScheme.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Erreur: $message',
                        style: theme.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              orElse: () => _buildEmptyCourses(context, theme),
            );
          },
        ),
      ],
    );
  }

  Widget _buildEmptyCourses(BuildContext context, ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.school_outlined,
                size: 64,
                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 16),
              Text(
                'Aucun cours inscrit',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Commencez votre parcours d\'apprentissage en vous inscrivant à un cours',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => context.go('/courses'),
                icon: const Icon(Icons.explore),
                label: const Text('Explorer les cours'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseList(List<common.CourseEntity> courses, ThemeData theme) {
    // Afficher seulement les 3 premiers cours
    final displayCourses = courses.take(3).toList();

    return Column(
      children: displayCourses.map((course) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: InkWell(
            onTap: () => context.go('/courses/${course.id}'),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  // Image du cours
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: course.thumbnailUrl != null
                        ? Image.network(
                            course.thumbnailUrl!,
                            width: 120,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => _buildCoursePlaceholder(theme),
                          )
                        : _buildCoursePlaceholder(theme),
                  ),
                  const SizedBox(width: 20),

                  // Informations du cours
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          course.description,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _buildChip(
                              Icons.signal_cellular_alt,
                              course.levelDisplayName,
                              theme.colorScheme.primary,
                            ),
                            const SizedBox(width: 12),
                            _buildChip(
                              Icons.access_time,
                              course.formattedDuration,
                              theme.colorScheme.secondary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Progression (TODO: implémenter)
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCoursePlaceholder(ThemeData theme) {
    return Container(
      width: 120,
      height: 80,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.school,
        size: 40,
        color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
      ),
    );
  }

  Widget _buildChip(IconData icon, String label, Color color) {
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
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
