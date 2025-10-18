import 'package:flutter/material.dart';
import 'package:common/common.dart';

class TestimonialCard extends StatelessWidget {
  final String name;
  final String role;
  final String quote;
  final int rating;

  const TestimonialCard({
    super.key,
    required this.name,
    required this.role,
    required this.quote,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stars
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            // Quote
            Text(
              '"$quote"',
              style: AppTypography.bodyLarge.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            // Author
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                  child: Text(
                    name[0].toUpperCase(),
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppTypography.titleSmall.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        role,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
