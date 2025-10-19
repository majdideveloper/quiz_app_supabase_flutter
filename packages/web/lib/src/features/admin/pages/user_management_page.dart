import 'package:flutter/material.dart';
import 'package:common/common.dart' as common;
import '../widgets/admin_sidebar.dart';

/// Page de gestion des utilisateurs
class UserManagementPage extends StatelessWidget {
  const UserManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const AdminSidebar(currentRoute: '/admin/users'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gestion des utilisateurs',
                    style: common.AppTypography.displaySmall.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // TODO: Ajouter DataTable avec liste des utilisateurs
                  Expanded(
                    child: Card(
                      child: Center(
                        child: Text(
                          'Liste des utilisateurs à implémenter',
                          style: common.AppTypography.titleMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
