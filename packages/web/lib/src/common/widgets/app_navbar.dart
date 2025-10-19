import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';

import '../../core/utils/responsive_helper.dart';

class AppNavbar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final isLoggedIn = authState.maybeWhen(
          authenticated: (_) => true,
          orElse: () => false,
        );

        return AppBar(
          elevation: 0,
          backgroundColor: theme.colorScheme.surface,
          toolbarHeight: 70,
          title: Row(
            children: [
              // Logo/Brand - Navigation intelligente
              InkWell(
                onTap: () => context.go(isLoggedIn ? '/dashboard' : '/'),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    'Formation Métiers',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if (!isMobile && !isLoggedIn) ...[
                const SizedBox(width: 48),
                // Navigation links pour utilisateurs non connectés
                TextButton(
                  onPressed: () => context.go('/'),
                  child: const Text('Accueil'),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () => context.go('/courses'),
                  child: const Text('Cours'),
                ),
              ],
            ],
          ),
          actions: [
            if (!isMobile) ...[
              if (isLoggedIn)
                // Menu utilisateur connecté
                _buildUserMenu(context, authState, theme)
              else ...[
                // Boutons pour utilisateurs non connectés
                OutlinedButton(
                  onPressed: () => context.go('/login'),
                  child: const Text('Connexion'),
                ),
                const SizedBox(width: 16),
                FilledButton(
                  onPressed: () => context.go('/register'),
                  child: const Text('S\'inscrire'),
                ),
              ],
              const SizedBox(width: 24),
            ] else
              // Mobile menu
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _showMobileDrawer(context, isLoggedIn, authState);
                },
              ),
          ],
        );
      },
    );
  }

  Widget _buildUserMenu(BuildContext context, AuthState authState, ThemeData theme) {
    return authState.maybeWhen(
      authenticated: (user) {
        return PopupMenuButton<String>(
          offset: const Offset(0, 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Text(
                    (user.fullName?.isNotEmpty ?? false) ? user.fullName![0].toUpperCase() : 'U',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  user.fullName ?? 'Utilisateur',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.arrow_drop_down, color: theme.colorScheme.onSurface),
              ],
            ),
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'dashboard',
              child: Row(
                children: [
                  Icon(Icons.dashboard, size: 20, color: theme.colorScheme.primary),
                  const SizedBox(width: 12),
                  const Text('Mon Dashboard'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'courses',
              child: Row(
                children: [
                  Icon(Icons.school, size: 20, color: theme.colorScheme.primary),
                  const SizedBox(width: 12),
                  const Text('Mes Cours'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'profile',
              child: Row(
                children: [
                  Icon(Icons.person, size: 20, color: theme.colorScheme.primary),
                  const SizedBox(width: 12),
                  const Text('Mon Profil'),
                ],
              ),
            ),
            const PopupMenuDivider(),
            PopupMenuItem(
              value: 'logout',
              child: Row(
                children: [
                  Icon(Icons.logout, size: 20, color: theme.colorScheme.error),
                  const SizedBox(width: 12),
                  Text(
                    'Déconnexion',
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case 'dashboard':
                context.go('/dashboard');
                break;
              case 'courses':
                context.go('/courses');
                break;
              case 'profile':
                // TODO: Navigate to profile page
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Page profil à venir')),
                );
                break;
              case 'logout':
                context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
                context.go('/');
                break;
            }
          },
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }

  void _showMobileDrawer(BuildContext context, bool isLoggedIn, AuthState authState) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoggedIn)
              authState.maybeWhen(
                authenticated: (user) => Column(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: Text(
                        (user.fullName?.isNotEmpty ?? false) ? user.fullName![0].toUpperCase() : 'U',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      user.fullName ?? 'Utilisateur',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.email,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Divider(height: 32),
                    ListTile(
                      leading: const Icon(Icons.dashboard),
                      title: const Text('Mon Dashboard'),
                      onTap: () {
                        Navigator.pop(context);
                        context.go('/dashboard');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.school),
                      title: const Text('Mes Cours'),
                      onTap: () {
                        Navigator.pop(context);
                        context.go('/courses');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Mon Profil'),
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Page profil à venir')),
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: theme.colorScheme.error),
                      title: Text(
                        'Déconnexion',
                        style: TextStyle(color: theme.colorScheme.error),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
                        context.go('/');
                      },
                    ),
                  ],
                ),
                orElse: () => const SizedBox.shrink(),
              )
            else
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Accueil'),
                    onTap: () {
                      Navigator.pop(context);
                      context.go('/');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.school),
                    title: const Text('Cours'),
                    onTap: () {
                      Navigator.pop(context);
                      context.go('/courses');
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.login),
                    title: const Text('Connexion'),
                    onTap: () {
                      Navigator.pop(context);
                      context.go('/login');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_add),
                    title: const Text('S\'inscrire'),
                    onTap: () {
                      Navigator.pop(context);
                      context.go('/register');
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
