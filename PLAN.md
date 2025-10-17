# Formation Métiers - Implementation Plan

**Duration**: 10-12 weeks (52 working days)
**Status Legend**: ✅ Done | 🔄 In Progress | ⬜ Not Started

---

## Phase 1: Project Foundation & Infrastructure (Days 1-3) ✅

### Task 1.1: Project Initialization
- ✅ **1.1.1** Initialize Flutter project with web support
- ✅ **1.1.2** Create multi-package structure (common, mobile, web)
- ✅ **1.1.3** Set up Melos for monorepo management
- ✅ **1.1.4** Configure root pubspec.yaml and melos.yaml

### Task 1.2: Environment Configuration
- ✅ **1.2.1** Create .env files (develop, staging, production)
- ✅ **1.2.2** Create EnvConfig class for environment management
- ✅ **1.2.3** Add .gitignore entries for environment files

### Task 1.3: Supabase Setup
- ✅ **1.3.1** Install Supabase CLI (v2.51.0 already installed)
- ✅ **1.3.2** Initialize local Supabase project structure
- ✅ **1.3.3** Create database migration files
- ✅ **1.3.4** Write initial schema (profiles, courses, lessons, quizzes)
- ✅ **1.3.5** Set up Row Level Security (RLS) policies
- ✅ **1.3.6** Create seed data for development

---

## Phase 2: Common Package - Core Layer (Days 4-6) ✅

### Task 2.1: Core Infrastructure
- ✅ **2.1.1** Create core/error (failures.dart, exceptions.dart)
- ✅ **2.1.2** Create core/network (supabase_client.dart)
- ✅ **2.1.3** Create core/utils (logger.dart, validators.dart)
- ✅ **2.1.4** Create core/di (injection_container.dart with GetIt)
- ✅ **2.1.5** Add core/config (env_config.dart) - completed in Phase 1
- ✅ **2.1.6** Create core/theme (app_colors.dart, app_typography.dart, app_spacing.dart, app_theme.dart)
- ✅ **2.1.7** Write README.md for each core module

### Task 2.2: Package Dependencies
- ✅ **2.2.1** Add all dependencies to common/pubspec.yaml - completed in Phase 1
- ✅ **2.2.2** Add freezed, injectable, dartz, supabase_flutter - completed in Phase 1
- ✅ **2.2.3** Run flutter pub get

---

## Phase 3: Common Package - Auth Feature (Days 7-9) ✅

### Task 3.1: Auth Domain Layer
- ✅ **3.1.1** Create user_entity.dart with Freezed
- ✅ **3.1.2** Create auth_repository.dart interface
- ✅ **3.1.3** Create login_usecase.dart
- ✅ **3.1.4** Create register_usecase.dart
- ✅ **3.1.5** Create logout_usecase.dart
- ✅ **3.1.6** Create get_current_user_usecase.dart

### Task 3.2: Auth Data Layer
- ✅ **3.2.1** Create user_model.dart with Freezed + JSON
- ✅ **3.2.2** Create auth_remote_datasource.dart
- ✅ **3.2.3** Implement Supabase auth methods
- ✅ **3.2.4** Create auth_repository_impl.dart
- ✅ **3.2.5** Add Injectable annotations for DI

### Task 3.3: Auth Documentation
- ✅ **3.3.1** Write comprehensive auth/README.md
- ✅ **3.3.2** Document all use cases and business rules

---

## Phase 4: Common Package - Course Feature (Days 10-13) ✅

### Task 4.1: Course Domain Layer
- ✅ **4.1.1** Create course_entity.dart with Freezed
- ✅ **4.1.2** Create lesson_entity.dart with Freezed
- ✅ **4.1.3** Create course_repository.dart interface
- ✅ **4.1.4** Create get_courses_usecase.dart
- ✅ **4.1.5** Create get_course_by_id_usecase.dart
- ✅ **4.1.6** Create get_course_lessons_usecase.dart
- ✅ **4.1.7** Create search_courses_usecase.dart
- ✅ **4.1.8** Create filter_courses_usecase.dart

### Task 4.2: Course Data Layer
- ✅ **4.2.1** Create course_model.dart with Freezed + JSON
- ✅ **4.2.2** Create lesson_model.dart with Freezed + JSON
- ✅ **4.2.3** Create course_remote_datasource.dart
- ✅ **4.2.4** Implement Supabase course queries
- ✅ **4.2.5** Create course_repository_impl.dart
- ✅ **4.2.6** Add Injectable annotations

### Task 4.3: Course Documentation
- ✅ **4.3.1** Write course/README.md with all use cases

---

## Phase 5: Common Package - Quiz Feature (Days 14-17) ✅

### Task 5.1: Quiz Domain Layer
- ✅ **5.1.1** Create quiz_entity.dart with Freezed
- ✅ **5.1.2** Create question_entity.dart with Freezed
- ✅ **5.1.3** Create answer_entity.dart with Freezed
- ✅ **5.1.4** Create quiz_result_entity.dart with Freezed
- ✅ **5.1.5** Create quiz_repository.dart interface
- ✅ **5.1.6** Create get_lesson_quiz_usecase.dart
- ✅ **5.1.7** Create get_course_quizzes_usecase.dart
- ✅ **5.1.8** Create submit_quiz_usecase.dart
- ✅ **5.1.9** Create get_quiz_results_usecase.dart
- ✅ **5.1.10** Create get_user_quiz_history_usecase.dart

### Task 5.2: Quiz Data Layer
- ✅ **5.2.1** Create quiz_model.dart with Freezed + JSON
- ✅ **5.2.2** Create question_model.dart with Freezed + JSON
- ✅ **5.2.3** Create answer_model.dart with Freezed + JSON
- ✅ **5.2.4** Create quiz_result_model.dart with Freezed + JSON
- ✅ **5.2.5** Create quiz_remote_datasource.dart
- ✅ **5.2.6** Implement quiz queries and submissions
- ✅ **5.2.7** Create quiz_repository_impl.dart
- ✅ **5.2.8** Add Injectable annotations

### Task 5.3: Quiz Documentation
- ✅ **5.3.1** Write quiz/README.md

---

## Phase 6: Common Package - Enrollment & Profile (Days 18-20) ✅

### Task 6.1: Enrollment Feature
- ✅ **6.1.1** Create enrollment_entity.dart and user_progress_entity.dart
- ✅ **6.1.2** Create enrollment_repository.dart interface
- ✅ **6.1.3** Create use cases (enroll, get enrollments, update progress)
- ✅ **6.1.4** Create models with Freezed
- ✅ **6.1.5** Create datasource and repository implementation
- ✅ **6.1.6** Write enrollment/README.md

### Task 6.2: Profile Feature
- ✅ **6.2.1** Create profile_entity.dart
- ✅ **6.2.2** Create profile_repository.dart interface
- ✅ **6.2.3** Create use cases (get profile, update profile)
- ✅ **6.2.4** Create models and implementations
- ✅ **6.2.5** Write profile/README.md

### Task 6.3: Code Generation
- ✅ **6.3.1** Run build_runner for Freezed generation
- ✅ **6.3.2** Run build_runner for Injectable DI generation
- ✅ **6.3.3** Verify all generated files

---

## Phase 7: Mobile Package - Setup & Auth UI (Days 21-24) ✅

### Task 7.1: Mobile Package Setup
- ✅ **7.1.1** Create mobile package structure
- ✅ **7.1.2** Add dependencies (flutter_bloc, get_it, go_router, freezed)
- ✅ **7.1.3** Reuse theme from common package (no duplication!)
- ✅ **7.1.4** Create core/routes/app_router.dart with GoRouter
- ✅ **7.1.5** Create core/di/injection_container.dart for mobile
- ✅ **7.1.6** Create main.dart and app.dart

### Task 7.2: Auth BLoC & UI (Mobile)
- ✅ **7.2.1** Create auth_bloc.dart, auth_event.dart (Freezed), auth_state.dart (Freezed)
- ✅ **7.2.2** Implement auth event handlers
- ✅ **7.2.3** Create login_page.dart with form validation
- ✅ **7.2.4** Create register_page.dart with form validation
- ✅ **7.2.5** Create login_form.dart and register_form.dart widgets
- ✅ **7.2.6** Add error handling and loading states
- ✅ **7.2.7** Write auth/README.md for mobile
- ✅ **7.2.8** Run build_runner to generate Freezed files
- ✅ **7.2.9** Add @injectable annotation to AuthBloc for DI
- ✅ **7.2.10** Fix common package exports (courses, quizzes, enrollment, profile)
- ✅ **7.2.11** Fix UserRole ambiguous export issue
- ✅ **7.2.12** Fix Material 3 theme errors (CardTheme, DialogTheme, TabBarTheme)
- ✅ **7.2.13** Fix deprecated withOpacity() calls

---

## Phase 8: Mobile Package - Course & Dashboard UI (Days 25-28) ✅

### Task 8.1: Course BLoC & UI
- ✅ **8.1.1** Create course_bloc.dart with events/states (Freezed)
- ✅ **8.1.2** Create course_list_page.dart
- ✅ **8.1.3** Create course_detail_page.dart with tabs (Lessons/Quizzes)
- ✅ **8.1.4** Create lesson_page.dart with video player
- ✅ **8.1.5** Create course_card.dart widget
- ✅ **8.1.6** Create course_filter.dart widget
- ✅ **8.1.7** Create lesson_video_player.dart widget
- ✅ **8.1.8** Write course/README.md for mobile

### Task 8.2: Dashboard BLoC & UI
- ✅ **8.2.1** Create dashboard_bloc.dart with Freezed
- ✅ **8.2.2** Create dashboard_page.dart
- ✅ **8.2.3** Create progress_card.dart widget
- ✅ **8.2.4** Create enrolled_courses_list.dart widget
- ✅ **8.2.5** Show user statistics and recent activity
- ✅ **8.2.6** Update app router with all new pages

---

## Phase 9: Mobile Package - Quiz UI (Days 29-31) ✅

### Task 9.1: Quiz BLoC & UI
- ✅ **9.1.1** Create quiz_bloc.dart with timer logic
- ✅ **9.1.2** Create quiz_page.dart
- ✅ **9.1.3** Create quiz_result_page.dart
- ✅ **9.1.4** Create question_widget.dart (multiple choice, true/false)
- ✅ **9.1.5** Create quiz_timer.dart widget
- ✅ **9.1.6** Implement quiz submission and scoring
- ✅ **9.1.7** Show correct answers after submission
- ✅ **9.1.8** Write quiz/README.md for mobile
- ✅ **9.1.9** Create QuestionWithAnswers helper model
- ✅ **9.1.10** Update QuizBloc to fetch questions and answers from repository
- ✅ **9.1.11** Add navigation events (previous/next question)
- ✅ **9.1.12** Fix timer tick event to avoid emit() warnings

---

## Phase 10: Web Package - Setup & Auth UI (Days 32-35) ⬜

### Task 10.1: Web Package Setup
- ⬜ **10.1.1** Create web package structure
- ⬜ **10.1.2** Add dependencies (responsive_framework)
- ⬜ **10.1.3** Create core/theme/app_theme.dart
- ⬜ **10.1.4** Create core/routes/app_router.dart
- ⬜ **10.1.5** Create core/di/injection_container.dart
- ⬜ **10.1.6** Create main.dart and app.dart
- ⬜ **10.1.7** Set up responsive breakpoints

### Task 10.2: Auth UI (Web)
- ⬜ **10.2.1** Create auth_bloc.dart (same as mobile)
- ⬜ **10.2.2** Create responsive login_page.dart
- ⬜ **10.2.3** Create responsive register_page.dart
- ⬜ **10.2.4** Create web-optimized forms
- ⬜ **10.2.5** Add social auth buttons layout

### Task 10.3: Home Page
- ⬜ **10.3.1** Create home_page.dart
- ⬜ **10.3.2** Create hero_section.dart widget
- ⬜ **10.3.3** Create feature_section.dart widget
- ⬜ **10.3.4** Create testimonials.dart widget
- ⬜ **10.3.5** Add navigation bar

---

## Phase 11: Web Package - Course & Admin UI (Days 36-40) ⬜

### Task 11.1: Course UI (Web)
- ⬜ **11.1.1** Create course_bloc.dart
- ⬜ **11.1.2** Create responsive course_list_page.dart
- ⬜ **11.1.3** Create course_detail_page.dart with tabs
- ⬜ **11.1.4** Create lesson_page.dart with web video player
- ⬜ **11.1.5** Create course_grid.dart widget
- ⬜ **11.1.6** Create course_sidebar.dart widget
- ⬜ **11.1.7** Create responsive_layout.dart wrapper

### Task 11.2: Admin Panel
- ⬜ **11.2.1** Create admin_bloc.dart
- ⬜ **11.2.2** Create admin_dashboard_page.dart
- ⬜ **11.2.3** Create course_management_page.dart
- ⬜ **11.2.4** Create user_management_page.dart
- ⬜ **11.2.5** Create admin_sidebar.dart widget
- ⬜ **11.2.6** Create data_table.dart widget for listings
- ⬜ **11.2.7** Implement course creation/editing forms
- ⬜ **11.2.8** Implement quiz creation interface

---

## Phase 12: Web Package - Dashboard & Quiz UI (Days 41-43) ⬜

### Task 12.1: Dashboard UI (Web)
- ⬜ **12.1.1** Create dashboard_bloc.dart
- ⬜ **12.1.2** Create responsive dashboard_page.dart
- ⬜ **12.1.3** Create stats_cards.dart widget
- ⬜ **12.1.4** Create recent_activity.dart widget
- ⬜ **12.1.5** Show charts and progress visualization

### Task 12.2: Quiz UI (Web)
- ⬜ **12.2.1** Reuse quiz_bloc.dart from mobile
- ⬜ **12.2.2** Create web-optimized quiz interface
- ⬜ **12.2.3** Implement question navigation
- ⬜ **12.2.4** Create results page with detailed breakdown

---

## Phase 13: Testing (Days 44-47) ⬜

### Task 13.1: Unit Tests (Common)
- ⬜ **13.1.1** Test all use cases
- ⬜ **13.1.2** Test repository implementations
- ⬜ **13.1.3** Test models (fromJson/toJson)
- ⬜ **13.1.4** Mock Supabase client

### Task 13.2: BLoC Tests
- ⬜ **13.2.1** Test auth_bloc events/states
- ⬜ **13.2.2** Test course_bloc events/states
- ⬜ **13.2.3** Test quiz_bloc events/states
- ⬜ **13.2.4** Use bloc_test package

### Task 13.3: Widget Tests
- ⬜ **13.3.1** Test mobile pages
- ⬜ **13.3.2** Test web pages
- ⬜ **13.3.3** Test reusable widgets

### Task 13.4: Integration Tests
- ⬜ **13.4.1** Test complete user flows (mobile)
- ⬜ **13.4.2** Test complete user flows (web)
- ⬜ **13.4.3** Test with local Supabase

---

## Phase 14: Deployment & DevOps (Days 48-50) ⬜

### Task 14.1: Supabase Cloud Setup
- ⬜ **14.1.1** Create staging Supabase project
- ⬜ **14.1.2** Create production Supabase project
- ⬜ **14.1.3** Run migrations on staging/production
- ⬜ **14.1.4** Configure environment variables

### Task 14.2: CI/CD Pipeline
- ⬜ **14.2.1** Create GitHub Actions workflow
- ⬜ **14.2.2** Add analyze and test jobs
- ⬜ **14.2.3** Add build jobs for mobile and web
- ⬜ **14.2.4** Configure automatic deployment

### Task 14.3: Mobile Deployment
- ⬜ **14.3.1** Build Android APK/AAB
- ⬜ **14.3.2** Build iOS IPA
- ⬜ **14.3.3** Submit to Play Store (optional)
- ⬜ **14.3.4** Submit to App Store (optional)

### Task 14.4: Web Deployment
- ⬜ **14.4.1** Build Flutter web
- ⬜ **14.4.2** Deploy to hosting (Firebase/Vercel/Netlify)
- ⬜ **14.4.3** Configure custom domain
- ⬜ **14.4.4** Set up SSL

---

## Phase 15: Polish & Documentation (Days 51-52) ⬜

### Task 15.1: UI/UX Polish
- ⬜ **15.1.1** Add animations and transitions
- ⬜ **15.1.2** Improve loading states
- ⬜ **15.1.3** Add skeleton loaders
- ⬜ **15.1.4** Improve error messages
- ⬜ **15.1.5** Add empty states

### Task 15.2: Documentation
- ⬜ **15.2.1** Update all feature README.md files
- ⬜ **15.2.2** Create comprehensive project README.md
- ⬜ **15.2.3** Add API documentation
- ⬜ **15.2.4** Create user guide

### Task 15.3: Performance Optimization
- ⬜ **15.3.1** Optimize images and assets
- ⬜ **15.3.2** Add caching strategies
- ⬜ **15.3.3** Optimize bundle size
- ⬜ **15.3.4** Test on various devices

---

## How to Use This Plan

### Updating Progress
1. When you **start** a task: Change `⬜` to `🔄`
2. When you **complete** a task: Change `🔄` to `✅`
3. When a **phase is complete**: Update phase header from `⬜` to `✅`

### Example
```markdown
## Phase 1: Project Foundation & Infrastructure (Days 1-3) 🔄

### Task 1.1: Project Initialization
- ✅ **1.1.1** Initialize Flutter project with web support
- 🔄 **1.1.2** Create multi-package structure (common, mobile, web)
- ⬜ **1.1.3** Set up Melos for monorepo management
```

---

## Progress Overview

### Completed Phases: 9/15
- ✅ Phase 1: Foundation
- ✅ Phase 2: Core Layer
- ✅ Phase 3: Auth Feature
- ✅ Phase 4: Course Feature
- ✅ Phase 5: Quiz Feature
- ✅ Phase 6: Enrollment & Profile
- ✅ Phase 7: Mobile Auth UI
- ✅ Phase 8: Mobile Course & Dashboard UI
- ✅ Phase 9: Mobile Quiz UI
- ⬜ Phase 10: Web Auth UI
- ⬜ Phase 11: Web Admin UI
- ⬜ Phase 12: Web Dashboard UI
- ⬜ Phase 13: Testing
- ⬜ Phase 14: Deployment
- ⬜ Phase 15: Polish

### Overall Progress: 64% (139/~218 tasks)

### Recent Updates (Latest Session - Phase 9 Complete)

**Quiz Feature:**
- ✅ Created QuizBloc with Freezed events/states and timer management
- ✅ Created QuizPage with quiz intro, in-progress, and submitted screens
- ✅ Created QuizResultPage with detailed answer review mode
- ✅ Created QuestionWidget supporting multiple choice, single choice, and true/false
- ✅ Created QuizTimer widget with color-coded countdown
- ✅ Implemented quiz submission with automatic scoring
- ✅ Created QuestionWithAnswers helper model to hold questions with their answers
- ✅ Updated QuizBloc to fetch questions and answers from repository
- ✅ Added navigation events for previous/next question
- ✅ Fixed timer tick event to avoid bloc emit() warnings
- ✅ Wrote comprehensive quiz/README.md for mobile

**Router & Dependency Injection Fixes:**
- ✅ Added BlocProvider wrappers to all routes in app_router.dart
- ✅ Fixed ProviderNotFoundException by providing BLoCs from GetIt
- ✅ Each route now creates its own BLoC instance from DI container
- ✅ Updated router imports to include flutter_bloc and all BLoCs

**Data Layer Fixes:**
- ✅ Fixed CourseModel.fromSupabaseWithInstructor null-safety issues
- ✅ Added null checks for duration, price, isPublished fields
- ✅ Fixed type casting errors when database returns null values
- ✅ Ensured proper default values for nullable integer fields

**Architecture:**
- ✅ Maintained clean architecture with proper separation of concerns
- ✅ Used Freezed for type-safe events and states throughout
- ✅ Followed BLoC pattern with proper event handlers
- ✅ All code compiled with zero analyzer warnings


