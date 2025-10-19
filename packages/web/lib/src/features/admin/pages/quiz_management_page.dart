import 'package:flutter/material.dart';
import 'package:common/common.dart' as common;
import '../widgets/admin_sidebar.dart';

/// Page de gestion des quizzes
class QuizManagementPage extends StatelessWidget {
  const QuizManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const AdminSidebar(currentRoute: '/admin/quizzes'),
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
                        'Gestion des quizzes',
                        style: common.AppTypography.displaySmall.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Ouvrir dialogue de création de quiz
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Nouveau quiz'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: Card(
                      child: Center(
                        child: Text(
                          'Liste des quizzes à implémenter',
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
