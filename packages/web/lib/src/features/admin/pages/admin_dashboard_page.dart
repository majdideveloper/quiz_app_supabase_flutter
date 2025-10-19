import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/common.dart' as common;
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
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          const AdminSidebar(currentRoute: '/admin'),

          // Contenu principal
          Expanded(
            child: BlocBuilder<common.AdminBloc, common.AdminState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(child: CircularProgressIndicator()),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  dashboardLoaded: (stats) => _buildDashboard(stats),
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

  Widget _buildDashboard(common.AdminStatsEntity stats) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Tableau de bord',
            style: common.AppTypography.displaySmall.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Vue d\'ensemble de la plateforme',
            style: common.AppTypography.titleMedium.copyWith(
              color: common.AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 32),

          // Stats cards
          GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.5,
            children: [
              StatCard(
                title: 'Utilisateurs',
                value: '${stats.totalUsers}',
                subtitle: '${stats.activeUsers} actifs',
                icon: Icons.people,
                color: common.AppColors.primary,
              ),
              StatCard(
                title: 'Cours',
                value: '${stats.totalCourses}',
                subtitle: '${stats.publishedCourses} publiés',
                icon: Icons.school,
                color: common.AppColors.secondary,
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
            style: common.AppTypography.titleLarge.copyWith(
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
                  style: common.AppTypography.bodyLarge.copyWith(
                    color: common.AppColors.textSecondary,
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
