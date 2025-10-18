import 'package:flutter/material.dart';
import 'package:common/common.dart';

import '../../../core/utils/responsive_helper.dart';
import 'testimonial_card.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

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
                'What Our Students Say',
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
                childAspectRatio: isMobile ? 0.9 : 1.1,
                children: const [
                  TestimonialCard(
                    name: 'Jean Dubois',
                    role: 'Electrician Apprentice',
                    quote: 'The courses are well-structured and easy to follow. I passed my exam on the first try!',
                    rating: 5,
                  ),
                  TestimonialCard(
                    name: 'Marie Tremblay',
                    role: 'Journeyman Electrician',
                    quote: 'Excellent platform for exam preparation. The practice quizzes were incredibly helpful.',
                    rating: 5,
                  ),
                  TestimonialCard(
                    name: 'Pierre Gagnon',
                    role: 'Master Electrician',
                    quote: 'I recommend this to all my apprentices. High-quality content and great support.',
                    rating: 5,
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
