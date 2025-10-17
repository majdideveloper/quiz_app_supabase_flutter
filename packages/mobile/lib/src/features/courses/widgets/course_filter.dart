import 'package:flutter/material.dart';
import 'package:common/common.dart';

/// Course filter dialog
///
/// Allows users to filter courses by category and level
class CourseFilterDialog extends StatefulWidget {
  final CourseCategory? selectedCategory;
  final CourseLevel? selectedLevel;
  final Function(CourseCategory? category, CourseLevel? level) onApply;

  const CourseFilterDialog({
    super.key,
    this.selectedCategory,
    this.selectedLevel,
    required this.onApply,
  });

  @override
  State<CourseFilterDialog> createState() => _CourseFilterDialogState();
}

class _CourseFilterDialogState extends State<CourseFilterDialog> {
  CourseCategory? _selectedCategory;
  CourseLevel? _selectedLevel;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.selectedCategory;
    _selectedLevel = widget.selectedLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter Courses',
                  style: AppTypography.headlineSmall,
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),

            // Category filter
            Text(
              'Category',
              style: AppTypography.titleMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                _buildFilterChip(
                  label: 'All',
                  isSelected: _selectedCategory == null,
                  onTap: () {
                    setState(() {
                      _selectedCategory = null;
                    });
                  },
                ),
                ...CourseCategory.values.map((category) {
                  return _buildFilterChip(
                    label: _getCategoryLabel(category),
                    isSelected: _selectedCategory == category,
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  );
                }),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),

            // Level filter
            Text(
              'Level',
              style: AppTypography.titleMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                _buildFilterChip(
                  label: 'All',
                  isSelected: _selectedLevel == null,
                  onTap: () {
                    setState(() {
                      _selectedLevel = null;
                    });
                  },
                ),
                ...CourseLevel.values.map((level) {
                  return _buildFilterChip(
                    label: _getLevelLabel(level),
                    isSelected: _selectedLevel == level,
                    color: _getLevelColor(level),
                    onTap: () {
                      setState(() {
                        _selectedLevel = level;
                      });
                    },
                  );
                }),
              ],
            ),

            const SizedBox(height: AppSpacing.xl),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _selectedCategory = null;
                        _selectedLevel = null;
                      });
                    },
                    child: const Text('Clear All'),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onApply(_selectedCategory, _selectedLevel);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Apply'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    Color? color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? (color ?? AppColors.primary)
              : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? (color ?? AppColors.primary)
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: AppTypography.bodyMedium.copyWith(
            color: isSelected ? Colors.white : AppColors.textPrimary,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  String _getCategoryLabel(CourseCategory category) {
    switch (category) {
      case CourseCategory.ccq:
        return 'CCQ';
      case CourseCategory.nonConstruction:
        return 'Non Construction';
      case CourseCategory.redSeal:
        return 'Red Seal';
    }
  }

  String _getLevelLabel(CourseLevel level) {
    switch (level) {
      case CourseLevel.beginner:
        return 'Beginner';
      case CourseLevel.intermediate:
        return 'Intermediate';
      case CourseLevel.advanced:
        return 'Advanced';
      case CourseLevel.expert:
        return 'Expert';
    }
  }

  Color _getLevelColor(CourseLevel level) {
    switch (level) {
      case CourseLevel.beginner:
        return Colors.green;
      case CourseLevel.intermediate:
        return Colors.orange;
      case CourseLevel.advanced:
      case CourseLevel.expert:
        return Colors.red;
        
      
    }
  }
}

/// Show course filter dialog
Future<void> showCourseFilterDialog({
  required BuildContext context,
  CourseCategory? selectedCategory,
  CourseLevel? selectedLevel,
  required Function(CourseCategory? category, CourseLevel? level) onApply,
}) {
  return showDialog(
    context: context,
    builder: (context) => CourseFilterDialog(
      selectedCategory: selectedCategory,
      selectedLevel: selectedLevel,
      onApply: onApply,
    ),
  );
}
