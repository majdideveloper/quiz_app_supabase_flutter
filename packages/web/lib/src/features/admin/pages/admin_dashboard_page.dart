import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/common.dart' as common;
import '../../../common/widgets/app_navbar.dart';
import '../../../core/utils/responsive_helper.dart';
import '../widgets/admin_sidebar.dart';
import '../widgets/stat_card.dart';

/// Tableau de bord admin avec statistiques
class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  @override
  void initState() {
    super.initState();
    context.read<common.AdminBloc>().add(const common.AdminEvent.loadDashboardStats());
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobileOrTablet(context);

    return Scaffold(
      appBar: const AppNavbar(),
      drawer: isMobile ? const Drawer(child: AdminSidebar(currentRoute: '/admin')) : null,
      body: Row(
        children: [
          // Sidebar (desktop only)
          if (!isMobile) const AdminSidebar(currentRoute: '/admin'),

          // Contenu principal
          Expanded(
            child: BlocBuilder<common.AdminBloc, common.AdminState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(child: CircularProgressIndicator()),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  dashboardLoaded: (stats) => _buildDashboard(stats, isMobile),
                  usersLoaded: (_) => const SizedBox(),
                  coursesLoaded: (_) => const SizedBox(),
                  quizzesLoaded: (_) => const SizedBox(),
                  error: (message) => Center(
                    child: Text('Erreur: $message'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboard(common.AdminStatsEntity stats, bool isMobile) {
    final theme = Theme.of(context);
    final crossAxisCount = isMobile ? 2 : 4;

    return SingleChildScrollView(
      padding: EdgeInsets.all(isMobile ? 16 : 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Tableau de bord',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Vue d\'ensemble de la plateforme',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),

          // Stats cards - Responsive grid
          GridView.count(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: isMobile ? 1.2 : 1.5,
            children: [
              StatCard(
                title: 'Utilisateurs',
                value: '${stats.totalUsers}',
                subtitle: '${stats.activeUsers} actifs',
                icon: Icons.people,
                color: theme.colorScheme.primary,
              ),
              StatCard(
                title: 'Cours',
                value: '${stats.totalCourses}',
                subtitle: '${stats.publishedCourses} publiés',
                icon: Icons.school,
                color: theme.colorScheme.secondary,
              ),
              StatCard(
                title: 'Quizzes',
                value: '${stats.totalQuizzes}',
                subtitle: '${stats.completedQuizzes} complétés',
                icon: Icons.quiz,
                color: Colors.green,
              ),
              StatCard(
                title: 'Score moyen',
                value: '${stats.averageQuizScore.toStringAsFixed(1)}%',
                subtitle: 'Tous les quiz',
                icon: Icons.trending_up,
                color: Colors.orange,
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Graphiques et autres contenus à ajouter
          Text(
            'Activité récente',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Text(
                  'Graphiques et activités à venir',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
