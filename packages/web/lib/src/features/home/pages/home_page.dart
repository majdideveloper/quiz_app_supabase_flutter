import 'package:flutter/material.dart';

import '../../../common/widgets/app_navbar.dart';
import '../../../common/widgets/app_footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/features_section.dart';
import '../widgets/course_preview_section.dart';
import '../widgets/testimonials_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppNavbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            FeaturesSection(),
            CoursePreviewSection(),
            TestimonialsSection(),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
