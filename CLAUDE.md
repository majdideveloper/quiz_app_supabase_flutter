# Formation Métiers - Clean Architecture Multi-Package Flutter App

## Architecture Overview

This project implements **Clean Architecture** with a **multi-package structure** to separate concerns between web and mobile platforms while sharing common business logic.

### State Management & Dependency Injection

- **State Management**: **BLoC (Business Logic Component)** pattern
- **Dependency Injection**: **GetIt** with **Injectable** for code generation
- **Feature-Based Architecture**: Each feature is self-contained with its own README.md

### Architecture Layers

- **Presentation Layer** (BLoC, Pages, Widgets) - Mobile & Web packages
- **Common Package**:
  - **Domain Layer** (Pure Dart): Entities, Use Cases, Repository Interfaces
  - **Data Layer**: Repository Implementations, Data Sources (Supabase), Models & DTOs
  - **Core Layer**: DI Setup, Utils, Config, Error Handling

### BLoC Pattern Flow

Widget → Event → BLoC → UseCase → Repository → Supabase
Widget ← State ← BLoC

## Clean Architecture Principles

### Dependency Rule
- **Presentation** → **Domain** ← **Data**
- Domain layer has NO dependencies on outer layers

### Use Cases
Each use case represents a single business action

### Repository Pattern
- Domain defines interfaces (contracts)
- Data provides implementations
- Supabase details hidden in data layer

### Entity vs Model with Freezed

- **Entity**: Domain object (business logic) - Freezed immutable class
  - Naming: `{name}_entity.dart` (e.g., `user_entity.dart`)
  - Class name: `{Name}Entity` (e.g., `UserEntity`)
- **Model**: Data object (for API/Database) - Freezed immutable class with JSON serialization
  - Naming: `{name}_model.dart` (e.g., `user_model.dart`)
  - Class name: `{Name}Model` (e.g., `UserModel`)
  - Converts to/from Entity

### Naming Conventions

**Files:**
- Entities: `user_entity.dart`, `course_entity.dart`, `lesson_entity.dart`
- Models: `user_model.dart`, `course_model.dart`, `lesson_model.dart`
- Use Cases: `login_usecase.dart`, `get_courses_usecase.dart`
- Repositories: `auth_repository.dart`, `course_repository.dart`
- Data Sources: `auth_remote_datasource.dart`, `auth_local_datasource.dart`
- BLoCs: `auth_bloc.dart`, `auth_event.dart`, `auth_state.dart`

**Classes:**
- Entities: `UserEntity`, `CourseEntity`, `LessonEntity`
- Models: `UserModel`, `CourseModel`, `LessonModel`
- Use Cases: `LoginUseCase`, `GetCoursesUseCase`
- Repositories: `AuthRepository`, `CourseRepository`
- Repository Implementations: `AuthRepositoryImpl`, `CourseRepositoryImpl`

## Environment Configuration

### Three Environments

**Development**: Local Supabase
**Staging**: Supabase Cloud (staging)
**Production**: Supabase Cloud (production)

Environment files: `.env.develop`, `.env.staging`, `.env.production`

## Course & Quiz Structure

### User Flow

1. **Enrolled Courses Page**: List of enrolled courses
2. **Course Detail Page**: Two main tabs:
   - **Lessons Tab**: Course content (video, text/PDF, mark as complete)
   - **Quizzes Tab**: Assessments (status, scores, retake option)

This separation allows:
- Independent review of materials vs assessments
- Course-level and lesson-level quizzes
- Better progress tracking

## Database Schema

### Core Tables
- `profiles`: User profiles (extends auth.users)
- `courses`: Course information
- `lessons`: Course content/materials
- `quizzes`: Assessments (separate from lessons)
- `quiz_questions`: Quiz questions
- `enrollments`: User course enrollments
- `user_lesson_progress`: Lesson completion tracking
- `quiz_attempts`: Quiz submissions and scores

### Row Level Security (RLS)
All tables have RLS policies for data security

## Package Dependencies

### Common Package
- `supabase_flutter`: Backend
- `get_it`, `injectable`: Dependency Injection
- `dartz`: Functional Programming (Either<Failure, Success>)
- `freezed_annotation`, `json_annotation`: Immutable Data Classes
- `flutter_dotenv`: Environment Configuration
- `logger`: Logging
- Code generation: `build_runner`, `freezed`, `json_serializable`, `injectable_generator`

### Mobile Package
- `flutter_bloc`, `bloc`: State Management
- `get_it`, `injectable`: Dependency Injection
- `go_router`: Navigation
- `video_player`: Video Player
- `cached_network_image`: UI Components

### Web Package
- Same as mobile plus:
- `video_player_web`: Web video player
- `responsive_framework`: Responsive Design

## Dependency Injection with GetIt

### Injectable Annotations
- `@LazySingleton(as: Interface)`: Data sources, repositories
- `@lazySingleton`: Use cases
- `@injectable`: BLoCs

### Code Generation

```bash
# Common package (Freezed entities/models + Injectable DI)
cd packages/common
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-generate on save)
flutter pub run build_runner watch --delete-conflicting-outputs

# Mobile/Web packages (Injectable DI only)
cd packages/mobile # or packages/web
flutter pub run build_runner build --delete-conflicting-outputs
```

## BLoC State Management

### BLoC Structure
- **bloc.dart**: Main BLoC logic
- **event.dart**: User actions/events
- **state.dart**: UI states

Each BLoC:
- Extends `Bloc<Event, State>`
- Decorated with `@injectable`
- Receives use cases via constructor injection

## Feature Documentation Structure

Each feature has a `README.md` with:
1. Feature Overview
2. Use Cases
3. Entities
4. API Integration (Supabase tables/queries)
5. BLoC Events & States
6. UI Components

## Running the Project

### Setup Local Supabase
```bash
supabase start
# Copy API URL and anon key to .env.develop
```

### Run Development
```bash
# Mobile
cd packages/mobile
flutter run --dart-define-from-file=../../.env.develop

# Web
cd packages/web
flutter run -d chrome --dart-define-from-file=../../.env.develop
```

### Run Staging/Production
```bash
flutter run --dart-define-from-file=.env.staging
flutter build apk --dart-define-from-file=.env.production
flutter build web --dart-define-from-file=.env.production
```

## Melos Configuration

Monorepo management with Melos:

```bash
melos bootstrap  # Bootstrap all packages
melos test       # Run tests across all packages
melos build:mobile  # Build mobile app
melos build:web     # Build web app
```

## Testing Strategy

- **Unit Tests** (Common Package): Use cases, repositories, models
- **Widget Tests** (Mobile/Web): Individual widgets, page layouts
- **Integration Tests**: Complete user flows, Supabase integration

## Best Practices

1. Keep domain layer pure (no Flutter/external dependencies)
2. Use dependency injection (constructor injection)
3. Implement error handling (Either<Failure, Success> pattern)
4. Write tests (80%+ coverage target)
5. Follow Dart naming conventions
6. Document public APIs (dartdoc comments)
7. Never edit existing migrations
8. Use RLS policies for data security
9. Never commit secrets
10. Test on multiple screen sizes

## Resources

- [Clean Architecture by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Clean Architecture Guide](https://resocoder.com/flutter-clean-architecture-tdd/)
- [Supabase Docs](https://supabase.com/docs)
- [Melos Documentation](https://melos.invertase.dev/)
