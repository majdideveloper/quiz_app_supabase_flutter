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

### Task 6.2: Profile Feature (Domain & Data)
- ✅ **6.2.1** Create profile_entity.dart
- ✅ **6.2.2** Create profile_repository.dart interface
- ✅ **6.2.3** Create use cases (get profile, update profile)
- ✅ **6.2.4** Create models and implementations
- ✅ **6.2.5** Write profile/README.md
- ✅ **6.2.6** Create upload_avatar_usecase.dart
- ✅ **6.2.7** Create delete_avatar_usecase.dart
- ✅ **6.2.8** Create update_preferences_usecase.dart

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

## Phase 10: BLoC Refactoring & Profile UI (Days 32-34) ✅

### Task 10.1: BLoC Architecture Refactoring
- ✅ **10.1.1** Move all BLoCs from mobile to common package
- ✅ **10.1.2** Move AuthBloc to common/features/auth/presentation/bloc/
- ✅ **10.1.3** Move CourseBloc to common/features/courses/presentation/bloc/
- ✅ **10.1.4** Move DashboardBloc to common/features/dashboard/presentation/bloc/
- ✅ **10.1.5** Move QuizBloc to common/features/quizzes/presentation/bloc/
- ✅ **10.1.6** Add flutter_bloc dependency to common package
- ✅ **10.1.7** Update all feature exports to include BLoCs
- ✅ **10.1.8** Remove BLoC directories from mobile package
- ✅ **10.1.9** Update mobile pages to import BLoCs from common
- ✅ **10.1.10** Fix QuestionWithAnswers model location and imports
- ✅ **10.1.11** Run build_runner on common package for Freezed generation
- ✅ **10.1.12** Verify zero errors with flutter analyze

### Task 10.2: Profile BLoC (Common Package)
- ✅ **10.2.1** Create profile_event.dart with Freezed (LoadProfile, UpdateProfile, UploadAvatar, DeleteAvatar, UpdatePreferences, RefreshProfile)
- ✅ **10.2.2** Create profile_state.dart with Freezed (initial, loading, loaded, uploading, error)
- ✅ **10.2.3** Create profile_bloc.dart with all event handlers
- ✅ **10.2.4** Update profile.dart exports to include BLoC
- ✅ **10.2.5** Run build_runner for Freezed generation

### Task 10.3: Profile UI (Mobile Package)
- ✅ **10.3.1** Create profile_page.dart with single scrollable layout
- ✅ **10.3.2** Create edit_profile_page.dart with comprehensive form
- ✅ **10.3.3** Create profile_header.dart widget (avatar, name, email, role)
- ✅ **10.3.4** Create profile_info_card.dart widget (personal information)
- ✅ **10.3.5** Create profile_stats_card.dart widget (learning progress)
- ✅ **10.3.6** Create preference_setting.dart widget (reusable setting item)
- ✅ **10.3.7** Update app_router.dart with profile and edit profile routes
- ✅ **10.3.8** Add avatar upload/delete UI (image picker TODO)
- ✅ **10.3.9** Add language selector (FR/EN)
- ✅ **10.3.10** Add notification settings toggles
- ✅ **10.3.11** Add logout functionality
- ✅ **10.3.12** Add form validation (postal code, phone, age requirements)
- ✅ **10.3.13** Add profile completion progress indicator
- ✅ **10.3.14** Add pull-to-refresh support
- ✅ **10.3.15** Verify zero errors with flutter analyze

---

## Phase 11: Web Package - Setup & Auth UI (Days 35-38) ⬜

### Task 11.1: Web Package Setup
- ⬜ **11.1.1** Create web package structure
- ⬜ **11.1.2** Add dependencies (responsive_framework)
- ⬜ **11.1.3** Reuse theme from common package (no duplication!)
- ⬜ **11.1.4** Create core/routes/app_router.dart
- ⬜ **11.1.5** Create core/di/injection_container.dart
- ⬜ **11.1.6** Create main.dart and app.dart
- ⬜ **11.1.7** Set up responsive breakpoints

### Task 11.2: Auth UI (Web)
- ⬜ **11.2.1** Reuse AuthBloc from common package
- ⬜ **11.2.2** Create responsive login_page.dart
- ⬜ **11.2.3** Create responsive register_page.dart
- ⬜ **11.2.4** Create web-optimized forms
- ⬜ **11.2.5** Add social auth buttons layout

### Task 11.3: Home Page
- ⬜ **11.3.1** Create home_page.dart
- ⬜ **11.3.2** Create hero_section.dart widget
- ⬜ **11.3.3** Create feature_section.dart widget
- ⬜ **11.3.4** Create testimonials.dart widget
- ⬜ **11.3.5** Add navigation bar

---

## Phase 12: Web Package - Course & Admin UI (Days 39-43) ⬜

### Task 12.1: Course UI (Web)
- ⬜ **12.1.1** Reuse CourseBloc from common package
- ⬜ **12.1.2** Create responsive course_list_page.dart
- ⬜ **12.1.3** Create course_detail_page.dart with tabs
- ⬜ **12.1.4** Create lesson_page.dart with web video player
- ⬜ **12.1.5** Create course_grid.dart widget
- ⬜ **12.1.6** Create course_sidebar.dart widget
- ⬜ **12.1.7** Create responsive_layout.dart wrapper

### Task 12.2: Admin Panel
- ⬜ **12.2.1** Create admin_bloc.dart
- ⬜ **12.2.2** Create admin_dashboard_page.dart
- ⬜ **12.2.3** Create course_management_page.dart
- ⬜ **12.2.4** Create user_management_page.dart
- ⬜ **12.2.5** Create admin_sidebar.dart widget
- ⬜ **12.2.6** Create data_table.dart widget for listings
- ⬜ **12.2.7** Implement course creation/editing forms
- ⬜ **12.2.8** Implement quiz creation interface

---

## Phase 13: Web Package - Dashboard, Quiz & Profile UI (Days 44-46) ⬜

### Task 13.1: Dashboard UI (Web)
- ⬜ **13.1.1** Reuse DashboardBloc from common package
- ⬜ **13.1.2** Create responsive dashboard_page.dart
- ⬜ **13.1.3** Create stats_cards.dart widget
- ⬜ **13.1.4** Create recent_activity.dart widget
- ⬜ **13.1.5** Show charts and progress visualization

### Task 13.2: Quiz UI (Web)
- ⬜ **13.2.1** Reuse QuizBloc from common package
- ⬜ **13.2.2** Create web-optimized quiz interface
- ⬜ **13.2.3** Implement question navigation
- ⬜ **13.2.4** Create results page with detailed breakdown

### Task 13.3: Profile UI (Web)
- ⬜ **13.3.1** Reuse ProfileBloc from common package
- ⬜ **13.3.2** Create responsive profile_page.dart
- ⬜ **13.3.3** Create responsive edit_profile_page.dart
- ⬜ **13.3.4** Reuse/adapt profile widgets for web layout

---

## Phase 14: Testing (Days 47-50) ⬜

### Task 14.1: Unit Tests (Common)
- ⬜ **14.1.1** Test all use cases
- ⬜ **14.1.2** Test repository implementations
- ⬜ **14.1.3** Test models (fromJson/toJson)
- ⬜ **14.1.4** Mock Supabase client

### Task 14.2: BLoC Tests (Common)
- ⬜ **14.2.1** Test AuthBloc events/states
- ⬜ **14.2.2** Test CourseBloc events/states
- ⬜ **14.2.3** Test DashboardBloc events/states
- ⬜ **14.2.4** Test QuizBloc events/states
- ⬜ **14.2.5** Test ProfileBloc events/states
- ⬜ **14.2.6** Use bloc_test package

### Task 14.3: Widget Tests
- ⬜ **14.3.1** Test mobile pages
- ⬜ **14.3.2** Test web pages
- ⬜ **14.3.3** Test reusable widgets

### Task 14.4: Integration Tests
- ⬜ **14.4.1** Test complete user flows (mobile)
- ⬜ **14.4.2** Test complete user flows (web)
- ⬜ **14.4.3** Test with local Supabase

---

## Phase 15: Deployment & DevOps (Days 51-53) ⬜

### Task 15.1: Supabase Cloud Setup
- ⬜ **15.1.1** Create staging Supabase project
- ⬜ **15.1.2** Create production Supabase project
- ⬜ **15.1.3** Run migrations on staging/production
- ⬜ **15.1.4** Configure environment variables

### Task 15.2: CI/CD Pipeline
- ⬜ **15.2.1** Create GitHub Actions workflow
- ⬜ **15.2.2** Add analyze and test jobs
- ⬜ **15.2.3** Add build jobs for mobile and web
- ⬜ **15.2.4** Configure automatic deployment

### Task 15.3: Mobile Deployment
- ⬜ **15.3.1** Build Android APK/AAB
- ⬜ **15.3.2** Build iOS IPA
- ⬜ **15.3.3** Submit to Play Store (optional)
- ⬜ **15.3.4** Submit to App Store (optional)

### Task 15.4: Web Deployment
- ⬜ **15.4.1** Build Flutter web
- ⬜ **15.4.2** Deploy to hosting (Firebase/Vercel/Netlify)
- ⬜ **15.4.3** Configure custom domain
- ⬜ **15.4.4** Set up SSL

---

## Phase 16: Polish & Documentation (Days 54-55) ⬜

### Task 16.1: UI/UX Polish
- ⬜ **16.1.1** Add animations and transitions
- ⬜ **16.1.2** Improve loading states
- ⬜ **16.1.3** Add skeleton loaders
- ⬜ **16.1.4** Improve error messages
- ⬜ **16.1.5** Add empty states

### Task 16.2: Documentation
- ⬜ **16.2.1** Update all feature README.md files
- ⬜ **16.2.2** Create comprehensive project README.md
- ⬜ **16.2.3** Add API documentation
- ⬜ **16.2.4** Create user guide

### Task 16.3: Performance Optimization
- ⬜ **16.3.1** Optimize images and assets
- ⬜ **16.3.2** Add caching strategies
- ⬜ **16.3.3** Optimize bundle size
- ⬜ **16.3.4** Test on various devices

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

### Completed Phases: 10/16
- ✅ Phase 1: Foundation
- ✅ Phase 2: Core Layer
- ✅ Phase 3: Auth Feature (Domain & Data)
- ✅ Phase 4: Course Feature (Domain & Data)
- ✅ Phase 5: Quiz Feature (Domain & Data)
- ✅ Phase 6: Enrollment & Profile (Domain & Data)
- ✅ Phase 7: Mobile Auth UI
- ✅ Phase 8: Mobile Course & Dashboard UI
- ✅ Phase 9: Mobile Quiz UI
- ✅ Phase 10: BLoC Refactoring & Profile UI
- ⬜ Phase 11: Web Auth UI
- ⬜ Phase 12: Web Admin UI
- ⬜ Phase 13: Web Dashboard & Profile UI
- ⬜ Phase 14: Testing
- ⬜ Phase 15: Deployment
- ⬜ Phase 16: Polish

### Overall Progress: 68% (181/~265 tasks)

### Recent Updates (Latest Session - Phase 10 Complete)

**BLoC Architecture Refactoring:**
- ✅ Moved all BLoCs from mobile to common package for code sharing
- ✅ Relocated AuthBloc, CourseBloc, DashboardBloc, QuizBloc to common/features/*/presentation/bloc/
- ✅ Added flutter_bloc dependency to common package
- ✅ Updated all feature exports to include BLoC classes
- ✅ Removed BLoC directories from mobile package
- ✅ Updated mobile pages to import BLoCs from common package
- ✅ Fixed QuestionWithAnswers model location (moved to common)
- ✅ Fixed import paths in quiz_bloc.dart and quiz_state.dart
- ✅ Updated app_router.dart to remove obsolete BLoC imports
- ✅ Ran build_runner on common package for Freezed generation
- ✅ Verified zero errors with flutter analyze

**Profile Feature (Common Package - BLoC):**
- ✅ Created 3 additional use cases:
  * upload_avatar_usecase.dart with file validation
  * delete_avatar_usecase.dart
  * update_preferences_usecase.dart with language and notification settings
- ✅ Created ProfileBloc with Freezed events (LoadProfile, UpdateProfile, UploadAvatar, DeleteAvatar, UpdatePreferences, RefreshProfile)
- ✅ Created ProfileBloc with Freezed states (initial, loading, loaded, uploading, error)
- ✅ Implemented all ProfileBloc event handlers
- ✅ Updated profile.dart exports to include BLoC and new use cases
- ✅ Ran build_runner for Freezed code generation

**Profile Feature (Mobile Package - UI):**
- ✅ Created ProfilePage with single scrollable layout:
  * Profile header with avatar and basic info
  * Personal information section
  * Learning statistics section
  * Settings/preferences section
  * Logout functionality
  * Pull-to-refresh support
- ✅ Created EditProfilePage with comprehensive form:
  * All profile fields (name, phone, bio, DOB, address details)
  * Profile completion progress indicator
  * Date picker for date of birth
  * Form validation (postal code, phone, age requirements)
- ✅ Created 4 profile widgets:
  * ProfileHeader - avatar display with upload indicator, user info, role badge
  * ProfileInfoCard - personal information display with icons
  * ProfileStatsCard - learning progress stats with bars and level badge
  * PreferenceSetting - reusable settings list item
- ✅ Updated app_router.dart with /profile and /profile/edit routes
- ✅ Added avatar upload/delete UI (image picker integration pending)
- ✅ Added language selector (FR/EN)
- ✅ Added notification settings toggles (push and email)
- ✅ Verified zero errors with flutter analyze

**Git Branch Management:**
- ✅ Created develop, staging, and production branches
- ✅ Created feature/#3 branch from develop
- ✅ All work committed to feature/#3 with proper commit messages
- ✅ 4 commits on feature/#3: iOS deep linking, BLoC refactoring, quiz fixes, profile implementation

**Architecture Improvements:**
- ✅ Achieved complete code sharing: all BLoCs now in common package
- ✅ Web package can reuse all BLoCs without duplication
- ✅ Maintained clean architecture with proper separation of concerns
- ✅ Used Freezed for type-safe events and states throughout
- ✅ Followed BLoC pattern with proper event handlers
- ✅ All code compiled with zero analyzer errors


