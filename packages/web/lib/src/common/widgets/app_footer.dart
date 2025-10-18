import 'package:flutter/material.dart';
import 'package:common/common.dart';

import '../../core/utils/responsive_helper.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      color: AppColors.surfaceVariant,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context),
        vertical: isMobile ? 32 : 48,
      ),
      child: Column(
        children: [
          if (isMobile)
            _buildMobileFooter(context)
          else
            _buildDesktopFooter(context),

          const Divider(height: 48),

          // Copyright
          Text(
            '© 2024 Formation Métiers. All rights reserved.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Column 1: About
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Formation Métiers',
                style: AppTypography.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Quick and effective exam preparation for electricians.',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),

        // Column 2: Links
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quick Links',
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildFooterLink('Home'),
              _buildFooterLink('Courses'),
              _buildFooterLink('About'),
              _buildFooterLink('Contact'),
            ],
          ),
        ),

        // Column 3: Legal
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Legal',
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildFooterLink('Privacy Policy'),
              _buildFooterLink('Terms of Service'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      children: [
        Text(
          'Formation Métiers',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            _buildFooterLink('Home'),
            _buildFooterLink('Courses'),
            _buildFooterLink('Privacy'),
            _buildFooterLink('Terms'),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return TextButton(
      onPressed: () {
        // TODO: Navigate to respective pages
      },
      child: Text(text),
    );
  }
}
