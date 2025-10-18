import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:common/common.dart';

import '../../../core/utils/responsive_helper.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primary.withValues(alpha: 0.8),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context),
        vertical: isMobile ? 60 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveHelper.getMaxContentWidth(context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Formation Métiers',
                style: (isMobile
                    ? AppTypography.displaySmall
                    : AppTypography.displayLarge
                ).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                'Quick and Effective Exam Preparation for Electricians',
                style: (isMobile
                    ? AppTypography.titleMedium
                    : AppTypography.headlineSmall
                ).copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              if (isMobile)
                Column(
                  children: [
                    _buildPrimaryButton(context, 'Get Started', '/register'),
                    const SizedBox(height: 16),
                    _buildSecondaryButton(context, 'Browse Courses', '/courses'),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPrimaryButton(context, 'Get Started', '/register'),
                    const SizedBox(width: 16),
                    _buildSecondaryButton(context, 'Browse Courses', '/courses'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context, String text, String route) {
    return ElevatedButton(
      onPressed: () => context.go(route),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
        textStyle: AppTypography.titleMedium.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildSecondaryButton(BuildContext context, String text, String route) {
    return OutlinedButton(
      onPressed: () => context.go(route),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
        textStyle: AppTypography.titleMedium.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text),
    );
  }
}
