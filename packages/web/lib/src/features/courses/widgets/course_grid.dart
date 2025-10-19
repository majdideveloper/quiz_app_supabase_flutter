import 'package:flutter/material.dart';
import 'package:common/common.dart' as common;
import '../../../core/utils/responsive_helper.dart';
import 'course_card_web.dart';

/// Widget de grille de cours responsive
class CourseGrid extends StatelessWidget {
  final List<common.CourseEntity> courses;
  final bool isLoading;

  const CourseGrid({
    super.key,
    required this.courses,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (courses.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Aucun cours disponible',
              style: common.AppTypography.titleMedium.copyWith(
                color: common.AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    final columns = ResponsiveHelper.getGridColumns(context);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(
        ResponsiveHelper.getHorizontalPadding(context),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 0.75, // Ajuster selon le design
      ),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return CourseCardWeb(course: courses[index]);
      },
    );
  }
}
