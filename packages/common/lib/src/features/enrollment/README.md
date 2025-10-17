# Enrollment Feature

This feature handles course enrollment, user progress tracking, and lesson completion for the Formation Métiers application.

## Architecture

This feature follows Clean Architecture principles with three main layers:

### Domain Layer (`domain/`)
- **Entities**: Core business objects (EnrollmentEntity, UserProgressEntity)
- **Repositories**: Abstract interfaces defining data operations
- **Use Cases**: Business logic for enrollment operations

### Data Layer (`data/`)
- **Models**: Data transfer objects with JSON serialization
- **Data Sources**: Remote data source implementation using Supabase
- **Repositories**: Implementation of domain repository interfaces

## Features

### Enrollment Management
- Enroll users in courses
- Track enrollment status (enrolled, in_progress, completed, dropped)
- View active and completed enrollments
- Drop enrollments
- Check enrollment status

### Progress Tracking
- Track lesson progress
- Monitor video completion
- Record time spent on lessons
- Calculate course completion percentage
- Automatic enrollment status updates

## Entities

### EnrollmentEntity

Represents a user's enrollment in a course.

**Status Types:**
- `enrolled`: User just enrolled
- `in_progress`: User is actively taking the course
- `completed`: User completed the course
- `dropped`: User dropped the course

**Key Properties:**
- `id`: Unique enrollment identifier
- `userId`: User who enrolled
- `courseId`: Course enrolled in
- `status`: Current enrollment status
- `progress`: Completion percentage (0-100)
- `completedLessons`: Number of completed lessons
- `totalLessons`: Total number of lessons in the course
- `timeSpent`: Total time spent in minutes
- `enrolledAt`: Enrollment date
- `completedAt`: Completion date (if completed)
- `lastAccessedAt`: Last access date

**Helper Methods:**
```dart
bool get isActive              // Check if enrollment is active
bool get isCompleted           // Check if enrollment is completed
String get formattedProgress   // Get formatted progress (e.g., "75%")
String get formattedTimeSpent  // Get formatted time (e.g., "2h 30min")
String get statusDisplayName   // Get French status name
bool get isRecent              // Check if enrolled within 7 days
bool get isStale               // Check if no activity in 30 days
```

### UserProgressEntity

Represents a user's progress on a specific lesson.

**Key Properties:**
- `id`: Unique progress identifier
- `userId`: User ID
- `enrollmentId`: Associated enrollment ID
- `lessonId`: Lesson ID
- `completed`: Whether lesson is completed
- `timeSpent`: Time spent on lesson in minutes
- `videoProgress`: Video progress percentage (0-100)
- `videoCompleted`: Whether video is fully watched
- `lastAccessedAt`: Last access date
- `completedAt`: Completion date (if completed)

**Helper Methods:**
```dart
bool get isInProgress           // Check if lesson is in progress
bool get isNotStarted           // Check if lesson not started
String get formattedTimeSpent   // Get formatted time
String get statusDisplayName    // Get French status name
bool get isRecent               // Check if accessed within 24 hours
bool get isVideoMostlyCompleted // Check if video >80% complete
```

## Use Cases

### EnrollInCourseUseCase

Enroll a user in a course.

**Usage:**
```dart
final enrollUseCase = getIt<EnrollInCourseUseCase>();

final result = await enrollUseCase(
  userId: 'user-123',
  courseId: 'course-456',
);

result.fold(
  (failure) => print('Error: ${failure.message}'),
  (enrollment) => print('Enrolled: ${enrollment.id}'),
);
```

**Validations:**
- User ID must not be empty
- Course ID must not be empty

### GetUserEnrollmentsUseCase

Get all enrollments for a user.

**Usage:**
```dart
final getEnrollmentsUseCase = getIt<GetUserEnrollmentsUseCase>();

final result = await getEnrollmentsUseCase('user-123');

result.fold(
  (failure) => print('Error: ${failure.message}'),
  (enrollments) {
    for (final enrollment in enrollments) {
      print('Course: ${enrollment.courseId}');
      print('Progress: ${enrollment.formattedProgress}');
      print('Status: ${enrollment.statusDisplayName}');
    }
  },
);
```

### UpdateLessonProgressUseCase

Update a user's progress on a lesson.

**Usage:**
```dart
final updateProgressUseCase = getIt<UpdateLessonProgressUseCase>();

final params = UpdateLessonProgressParams(
  enrollmentId: 'enrollment-123',
  lessonId: 'lesson-456',
  timeSpent: 45, // 45 minutes
  videoProgress: 85, // 85% watched
  completed: false,
);

final result = await updateProgressUseCase(params);

result.fold(
  (failure) => print('Error: ${failure.message}'),
  (progress) {
    print('Progress updated: ${progress.formattedTimeSpent}');
    print('Video: ${progress.formattedVideoProgress}');
  },
);
```

**Validations:**
- Enrollment ID must not be empty
- Lesson ID must not be empty
- Time spent must be non-negative
- Video progress must be between 0 and 100

## Repository Methods

The `EnrollmentRepository` interface defines the following operations:

### Enrollment Operations
```dart
// Enroll user in course
Future<Either<Failure, EnrollmentEntity>> enrollInCourse({
  required String userId,
  required String courseId,
});

// Get all user enrollments
Future<Either<Failure, List<EnrollmentEntity>>> getUserEnrollments(String userId);

// Get specific enrollment
Future<Either<Failure, EnrollmentEntity>> getEnrollmentById(String enrollmentId);

// Get enrollment for specific course
Future<Either<Failure, EnrollmentEntity>> getCourseEnrollment({
  required String userId,
  required String courseId,
});

// Update enrollment progress
Future<Either<Failure, EnrollmentEntity>> updateEnrollmentProgress({
  required String enrollmentId,
  required int progress,
  required int completedLessons,
});

// Drop enrollment
Future<Either<Failure, EnrollmentEntity>> dropEnrollment(String enrollmentId);

// Get active enrollments
Future<Either<Failure, List<EnrollmentEntity>>> getActiveEnrollments(String userId);

// Get completed enrollments
Future<Either<Failure, List<EnrollmentEntity>>> getCompletedEnrollments(String userId);

// Check if user is enrolled
Future<Either<Failure, bool>> isUserEnrolled({
  required String userId,
  required String courseId,
});
```

### Progress Operations
```dart
// Get lesson progress
Future<Either<Failure, UserProgressEntity>> getLessonProgress({
  required String enrollmentId,
  required String lessonId,
});

// Get all progress for enrollment
Future<Either<Failure, List<UserProgressEntity>>> getEnrollmentProgress(
  String enrollmentId,
);

// Update lesson progress
Future<Either<Failure, UserProgressEntity>> updateLessonProgress({
  required String enrollmentId,
  required String lessonId,
  required int timeSpent,
  required int videoProgress,
  required bool completed,
});

// Mark lesson as completed
Future<Either<Failure, UserProgressEntity>> completeLessonProgress({
  required String enrollmentId,
  required String lessonId,
});
```

## Data Models

### EnrollmentModel

Maps to the `enrollments` table in Supabase.

**JSON Mapping:**
```json
{
  "id": "uuid",
  "user_id": "uuid",
  "course_id": "uuid",
  "status": "enrolled|in_progress|completed|dropped",
  "enrolled_at": "timestamp",
  "completed_at": "timestamp?",
  "dropped_at": "timestamp?",
  "progress": 0,
  "completed_lessons": 0,
  "total_lessons": 10,
  "time_spent": 0,
  "last_accessed_at": "timestamp?",
  "created_at": "timestamp",
  "updated_at": "timestamp"
}
```

### UserProgressModel

Maps to the `user_progress` table in Supabase.

**JSON Mapping:**
```json
{
  "id": "uuid",
  "user_id": "uuid",
  "enrollment_id": "uuid",
  "lesson_id": "uuid",
  "completed": false,
  "completed_at": "timestamp?",
  "time_spent": 0,
  "last_accessed_at": "timestamp?",
  "video_progress": 0,
  "video_completed": false,
  "created_at": "timestamp",
  "updated_at": "timestamp"
}
```

## Remote Data Source

The `EnrollmentRemoteDataSource` uses Supabase for all data operations.

### Key Features:
- **RPC Functions**: Uses Supabase RPC functions for complex operations like enrollment and progress updates
- **Automatic Updates**: Enrollment progress is automatically updated when lessons are completed
- **Status Filtering**: Supports filtering by enrollment status
- **Comprehensive Logging**: All operations are logged with AppLogger
- **Exception Handling**: Converts Supabase exceptions to domain exceptions

### RPC Functions Required:

1. **enroll_in_course**
   - Parameters: `p_user_id`, `p_course_id`
   - Returns: Enrollment record
   - Handles: Duplicate enrollment checking, total lessons calculation

2. **update_lesson_progress**
   - Parameters: `p_enrollment_id`, `p_lesson_id`, `p_time_spent`, `p_video_progress`, `p_completed`
   - Returns: Progress record
   - Handles: Upsert logic, enrollment progress recalculation

3. **complete_lesson**
   - Parameters: `p_enrollment_id`, `p_lesson_id`
   - Returns: Progress record
   - Handles: Marking lesson complete, updating enrollment progress

## Example Workflows

### Enrolling in a Course

```dart
// 1. Check if already enrolled
final enrolledResult = await enrollmentRepository.isUserEnrolled(
  userId: currentUserId,
  courseId: selectedCourseId,
);

final isEnrolled = enrolledResult.getOrElse(() => false);

if (isEnrolled) {
  showMessage('Vous êtes déjà inscrit à ce cours');
  return;
}

// 2. Enroll in course
final enrollResult = await enrollInCourseUseCase(
  userId: currentUserId,
  courseId: selectedCourseId,
);

enrollResult.fold(
  (failure) => showError(failure.message),
  (enrollment) {
    showSuccess('Inscription réussie !');
    navigateToCourse(enrollment.courseId);
  },
);
```

### Tracking Lesson Progress

```dart
// 1. Get or create progress record
final progressResult = await enrollmentRepository.getLessonProgress(
  enrollmentId: currentEnrollmentId,
  lessonId: currentLessonId,
);

// 2. Update progress as user watches video
final updateParams = UpdateLessonProgressParams(
  enrollmentId: currentEnrollmentId,
  lessonId: currentLessonId,
  timeSpent: elapsedMinutes,
  videoProgress: (currentPosition / videoDuration * 100).round(),
  completed: false,
);

await updateLessonProgressUseCase(updateParams);

// 3. Mark as completed when user finishes
if (videoCompleted && allContentViewed) {
  await enrollmentRepository.completeLessonProgress(
    enrollmentId: currentEnrollmentId,
    lessonId: currentLessonId,
  );
}
```

### Displaying User Dashboard

```dart
// Get active enrollments
final activeResult = await enrollmentRepository.getActiveEnrollments(currentUserId);

activeResult.fold(
  (failure) => showError(failure.message),
  (enrollments) {
    for (final enrollment in enrollments) {
      print('Course: ${enrollment.courseId}');
      print('Progress: ${enrollment.formattedProgress}');
      print('Completed: ${enrollment.completionRatio}');
      print('Time spent: ${enrollment.formattedTimeSpent}');

      if (enrollment.isStale) {
        print('⚠️ No activity in 30 days');
      }
    }
  },
);

// Get completed enrollments
final completedResult = await enrollmentRepository.getCompletedEnrollments(
  currentUserId,
);

completedResult.fold(
  (failure) => showError(failure.message),
  (completedEnrollments) {
    print('Completed ${completedEnrollments.length} courses');
  },
);
```

## Error Handling

All repository methods return `Either<Failure, T>` where failures can be:

- **NotFoundFailure**: Enrollment or progress not found
- **ValidationFailure**: Invalid input data (already enrolled, invalid IDs)
- **DatabaseFailure**: Database operation failed
- **NetworkFailure**: Network connection error
- **ServerFailure**: Server error
- **UnexpectedFailure**: Unexpected error occurred

## Best Practices

1. **Progress Updates**: Update progress frequently to avoid data loss
2. **Enrollment Status**: Check enrollment status before allowing course access
3. **Stale Detection**: Use `isStale` to prompt users to resume courses
4. **Video Tracking**: Update video progress every few seconds
5. **Completion Logic**: Only mark complete when all content is viewed
6. **Error Handling**: Always handle all possible failure cases

## Database Schema

### enrollments table
```sql
CREATE TABLE enrollments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id),
  course_id UUID NOT NULL REFERENCES courses(id),
  status TEXT NOT NULL DEFAULT 'enrolled',
  enrolled_at TIMESTAMP NOT NULL DEFAULT now(),
  completed_at TIMESTAMP,
  dropped_at TIMESTAMP,
  progress INTEGER NOT NULL DEFAULT 0,
  completed_lessons INTEGER NOT NULL DEFAULT 0,
  total_lessons INTEGER NOT NULL,
  time_spent INTEGER NOT NULL DEFAULT 0,
  last_accessed_at TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now(),
  UNIQUE(user_id, course_id)
);
```

### user_progress table
```sql
CREATE TABLE user_progress (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id),
  enrollment_id UUID NOT NULL REFERENCES enrollments(id),
  lesson_id UUID NOT NULL REFERENCES lessons(id),
  completed BOOLEAN NOT NULL DEFAULT false,
  completed_at TIMESTAMP,
  time_spent INTEGER NOT NULL DEFAULT 0,
  last_accessed_at TIMESTAMP,
  video_progress INTEGER NOT NULL DEFAULT 0,
  video_completed BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now(),
  UNIQUE(enrollment_id, lesson_id)
);
```

## Dependency Injection

All classes are registered with Injectable:

```dart
// Use cases
@lazySingleton
class EnrollInCourseUseCase { ... }

@lazySingleton
class GetUserEnrollmentsUseCase { ... }

@lazySingleton
class UpdateLessonProgressUseCase { ... }

// Repository
@LazySingleton(as: EnrollmentRepository)
class EnrollmentRepositoryImpl { ... }

// Data source
@LazySingleton(as: EnrollmentRemoteDataSource)
class EnrollmentRemoteDataSourceImpl { ... }
```

## Testing

Example test structure:

```dart
// Unit tests for use cases
test('should enroll user in course', () async {
  // Arrange
  when(mockRepository.enrollInCourse(
    userId: anyNamed('userId'),
    courseId: anyNamed('courseId'),
  )).thenAnswer((_) async => Right(tEnrollment));

  // Act
  final result = await useCase(userId: tUserId, courseId: tCourseId);

  // Assert
  expect(result, Right(tEnrollment));
  verify(mockRepository.enrollInCourse(
    userId: tUserId,
    courseId: tCourseId,
  ));
});
```

## Related Features

- **Courses**: Course and lesson entities
- **Quizzes**: Quiz attempts are linked to enrollments
- **Profile**: User profile and learning history
