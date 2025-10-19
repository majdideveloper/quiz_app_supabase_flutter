import 'package:flutter/material.dart';
import 'package:common/common.dart';

import '../../../core/utils/responsive_helper.dart';
import 'feature_card.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = ResponsiveHelper.getGridColumns(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context),
        vertical: isMobile ? 48 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveHelper.getMaxContentWidth(context),
          ),
          child: Column(
            children: [
              Text(
                'Why Choose Formation Métiers?',
                style: (isMobile
                    ? AppTypography.headlineMedium
                    : AppTypography.headlineLarge
                ).copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xl),
              GridView.count(
                crossAxisCount: columns,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: AppSpacing.lg,
                crossAxisSpacing: AppSpacing.lg,
                childAspectRatio: isMobile ? 1.2 : 1.0,
                children: const [
                  FeatureCard(
                    icon: Icons.school,
                    title: 'Expert-Designed Courses',
                    description: 'Learn from industry professionals with years of experience',
                    color: AppColors.primary,
                  ),
                  FeatureCard(
                    icon: Icons.quiz,
                    title: 'Interactive Quizzes',
                    description: 'Test your knowledge with comprehensive practice exams',
                    color: Colors.green,
                  ),
                  FeatureCard(
                    icon: Icons.timeline,
                    title: 'Track Progress',
                    description: 'Monitor your learning journey with detailed analytics',
                    color: Colors.orange,
                  ),
                  FeatureCard(
                    icon: Icons.access_time,
                    title: 'Flexible Learning',
                    description: 'Study at your own pace, anytime and anywhere',
                    color: Colors.purple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
