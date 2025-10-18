import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';

import '../../core/utils/responsive_helper.dart';

class AppNavbar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      title: Row(
        children: [
          // Logo/Brand
          Text(
            'Formation Métiers',
            style: AppTypography.headlineSmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (!isMobile) ...[
            const SizedBox(width: 48),
            // Navigation links
            TextButton(
              onPressed: () => context.go('/'),
              child: const Text('Home'),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: () => context.go('/courses'),
              child: const Text('Courses'),
            ),
          ],
        ],
      ),
      actions: [
        if (!isMobile) ...[
          // Login button
          OutlinedButton(
            onPressed: () => context.go('/login'),
            child: const Text('Login'),
          ),
          const SizedBox(width: 16),
          // Register button
          ElevatedButton(
            onPressed: () => context.go('/register'),
            child: const Text('Get Started'),
          ),
          const SizedBox(width: 24),
        ] else
          // Mobile menu
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // TODO: Show mobile drawer
            },
          ),
      ],
    );
  }
}
