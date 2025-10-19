import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart' as common;

/// Sidebar de navigation pour le panneau d'administration
class AdminSidebar extends StatelessWidget {
  final String currentRoute;

  const AdminSidebar({
    super.key,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: common.AppColors.surface,
        border: Border(
          right: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header admin
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.admin_panel_settings,
                  color: common.AppColors.primary,
                  size: 32,
                ),
                const SizedBox(width: 12),
                Text(
                  'Administration',
                  style: common.AppTypography.titleLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Menu items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.dashboard,
                  title: 'Tableau de bord',
                  route: '/admin',
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.people,
                  title: 'Utilisateurs',
                  route: '/admin/users',
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.school,
                  title: 'Cours',
                  route: '/admin/courses',
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.quiz,
                  title: 'Quizzes',
                  route: '/admin/quizzes',
                ),
                const Divider(height: 32),
                _buildMenuItem(
                  context,
                  icon: Icons.settings,
                  title: 'Paramètres',
                  route: '/admin/settings',
                ),
              ],
            ),
          ),

          // Footer avec retour au site
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
            ),
            child: OutlinedButton.icon(
              onPressed: () => context.go('/'),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Retour au site'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 44),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
  }) {
    final isActive = currentRoute == route;

    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? common.AppColors.primary : common.AppColors.textSecondary,
      ),
      title: Text(
        title,
        style: common.AppTypography.bodyMedium.copyWith(
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          color: isActive ? common.AppColors.primary : common.AppColors.textPrimary,
        ),
      ),
      selected: isActive,
      selectedTileColor: common.AppColors.primaryContainer.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: () => context.go(route),
    );
  }
}
