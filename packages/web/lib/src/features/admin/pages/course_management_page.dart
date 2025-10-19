import 'package:flutter/material.dart';
import 'package:common/common.dart' as common;
import '../widgets/admin_sidebar.dart';

/// Page de gestion des cours
class CourseManagementPage extends StatelessWidget {
  const CourseManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const AdminSidebar(currentRoute: '/admin/courses'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gestion des cours',
                        style: common.AppTypography.displaySmall.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Ouvrir dialogue de création de cours
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Nouveau cours'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: Card(
                      child: Center(
                        child: Text(
                          'Liste des cours à implémenter',
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
