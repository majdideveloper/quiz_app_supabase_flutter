import 'package:flutter/material.dart';
import 'package:common/common.dart' as common;

/// Sidebar pour filtrer et rechercher des cours
class CourseSidebar extends StatefulWidget {
  final Function(String?) onCategoryChanged;
  final Function(common.CourseLevel?) onLevelChanged;
  final Function(String) onSearchChanged;

  const CourseSidebar({
    super.key,
    required this.onCategoryChanged,
    required this.onLevelChanged,
    required this.onSearchChanged,
  });

  @override
  State<CourseSidebar> createState() => _CourseSidebarState();
}

class _CourseSidebarState extends State<CourseSidebar> {
  String? selectedCategory;
  common.CourseLevel? selectedLevel;
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          // Titre
          Text(
            'Filtres',
            style: common.AppTypography.titleLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Recherche
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Rechercher un cours...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            onChanged: widget.onSearchChanged,
          ),
          const SizedBox(height: 32),

          // Filtre par niveau
          Text(
            'Niveau',
            style: common.AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _buildLevelFilter(),
          const SizedBox(height: 32),

          // Filtre par catégorie
          Text(
            'Catégorie',
            style: common.AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _buildCategoryFilter(),

          const SizedBox(height: 32),

          // Bouton réinitialiser
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _resetFilters,
              child: const Text('Réinitialiser les filtres'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelFilter() {
    return Column(
      children: [
        _buildRadioTile<common.CourseLevel?>(
          title: 'Tous',
          value: null,
          groupValue: selectedLevel,
          onChanged: (value) {
            setState(() => selectedLevel = value);
            widget.onLevelChanged(value);
          },
        ),
        _buildRadioTile<common.CourseLevel?>(
          title: 'Débutant',
          value: common.CourseLevel.beginner,
          groupValue: selectedLevel,
          onChanged: (value) {
            setState(() => selectedLevel = value);
            widget.onLevelChanged(value);
          },
        ),
        _buildRadioTile<common.CourseLevel?>(
          title: 'Intermédiaire',
          value: common.CourseLevel.intermediate,
          groupValue: selectedLevel,
          onChanged: (value) {
            setState(() => selectedLevel = value);
            widget.onLevelChanged(value);
          },
        ),
        _buildRadioTile<common.CourseLevel?>(
          title: 'Avancé',
          value: common.CourseLevel.advanced,
          groupValue: selectedLevel,
          onChanged: (value) {
            setState(() => selectedLevel = value);
            widget.onLevelChanged(value);
          },
        ),
      ],
    );
  }

  Widget _buildCategoryFilter() {
    final categories = [
      'Électricité',
      'Plomberie',
      'Menuiserie',
      'Maçonnerie',
      'Peinture',
    ];

    return Column(
      children: [
        _buildRadioTile<String?>(
          title: 'Toutes',
          value: null,
          groupValue: selectedCategory,
          onChanged: (value) {
            setState(() => selectedCategory = value);
            widget.onCategoryChanged(value);
          },
        ),
        ...categories.map((category) {
          return _buildRadioTile<String?>(
            title: category,
            value: category,
            groupValue: selectedCategory,
            onChanged: (value) {
              setState(() => selectedCategory = value);
              widget.onCategoryChanged(value);
            },
          );
        }),
      ],
    );
  }

  Widget _buildRadioTile<T>({
    required String title,
    required T value,
    required T groupValue,
    required Function(T) onChanged,
  }) {
    final isSelected = value == groupValue;
    return InkWell(
      onTap: () => onChanged(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            // ignore: deprecated_member_use
            Radio<T>(
              value: value,
              // ignore: deprecated_member_use
              groupValue: groupValue,
              // ignore: deprecated_member_use
              onChanged: (v) => onChanged(v as T),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: common.AppTypography.bodyMedium.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _resetFilters() {
    setState(() {
      selectedCategory = null;
      selectedLevel = null;
      searchController.clear();
    });
    widget.onCategoryChanged(null);
    widget.onLevelChanged(null);
    widget.onSearchChanged('');
  }
}
