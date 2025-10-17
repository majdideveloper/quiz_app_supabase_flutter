# Course Feature - Mobile Package

This feature provides the UI for browsing, viewing, and interacting with courses in the Formation Métiers mobile app.

## Overview

The Course feature in the mobile package implements the presentation layer for course-related functionality, including:
- Course browsing and search
- Course detail viewing with tabs
- Lesson viewing with video player
- Progress tracking

## Architecture

This feature follows the **BLoC pattern** with **Freezed** for type-safe events and states:

```
lib/src/features/courses/
├── bloc/
│   ├── course_bloc.dart          # BLoC managing course state
│   ├── course_event.dart          # Freezed events
│   ├── course_event.freezed.dart  # Generated
│   ├── course_state.dart          # Freezed states
│   └── course_state.freezed.dart  # Generated
├── pages/
│   ├── course_list_page.dart      # Browse and search courses
│   ├── course_detail_page.dart    # Course details with tabs
│   └── lesson_page.dart           # View lesson content
├── widgets/
│   ├── course_card.dart           # Course display card
│   ├── course_filter.dart         # Filter dialog
│   └── lesson_video_player.dart   # Video player widget
└── README.md
```

## BLoC Events

The CourseBloc handles the following events (defined with Freezed):

```dart
@freezed
class CourseEvent with _$CourseEvent {
  // Load all courses
  const factory CourseEvent.loadCourses() = LoadCoursesEvent;

  // Load a single course by ID
  const factory CourseEvent.loadCourseById(String courseId) = LoadCourseByIdEvent;

  // Load course with its lessons
  const factory CourseEvent.loadCourseWithLessons(String courseId) = LoadCourseWithLessonsEvent;

  // Search courses
  const factory CourseEvent.searchCourses(String query) = SearchCoursesEvent;

  // Filter by category
  const factory CourseEvent.filterByCategory(CourseCategory category) = FilterByCategoryEvent;

  // Filter by level
  const factory CourseEvent.filterByLevel(CourseLevel level) = FilterByLevelEvent;

  // Refresh courses
  const factory CourseEvent.refreshCourses() = RefreshCoursesEvent;
}
```

## BLoC States

The CourseBloc emits the following states (defined with Freezed):

```dart
@freezed
class CourseState with _$CourseState {
  // Initial state
  const factory CourseState.initial() = CourseInitial;

  // Loading state
  const factory CourseState.loading() = CourseLoading;

  // Courses loaded (list view)
  const factory CourseState.coursesLoaded({
    required List<CourseEntity> courses,
    CourseCategory? selectedCategory,
    CourseLevel? selectedLevel,
    String? searchQuery,
  }) = CoursesLoaded;

  // Course detail loaded with lessons
  const factory CourseState.courseDetailLoaded({
    required CourseEntity course,
    required List<LessonEntity> lessons,
  }) = CourseDetailLoaded;

  // Error state
  const factory CourseState.error({required String message}) = CourseError;
}
```

## Pages

### CourseListPage

Browse and search all available courses.

**Features:**
- Grid/List display of courses
- Search functionality
- Filter by category and level
- Pull-to-refresh
- Empty state handling

**Usage:**
```dart
// Navigate to course list
context.push('/courses');
```

**BLoC Integration:**
```dart
BlocBuilder<CourseBloc, CourseState>(
  builder: (context, state) {
    return state.when(
      initial: () => const CircularProgressIndicator(),
      loading: () => const CircularProgressIndicator(),
      coursesLoaded: (courses, category, level, query) {
        return ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return CourseCard(course: courses[index]);
          },
        );
      },
      error: (message) => Text('Error: $message'),
      courseDetailLoaded: (course, lessons) => const SizedBox(),
    );
  },
)
```

### CourseDetailPage

View detailed course information with tabs for lessons and quizzes.

**Features:**
- Course header with image and gradient
- Course information (instructor, duration, enrollment count)
- Two tabs: Lessons and Quizzes
- Lesson list with playback icons
- Enrollment button
- Category and level chips

**Usage:**
```dart
// Navigate to course detail
context.push('/courses/$courseId');
```

**Parameters:**
- `courseId` (String, required): The ID of the course to display

### LessonPage

View individual lesson content.

**Features:**
- Video player for video lessons
- Text display for text lessons
- PDF viewer placeholder for PDF lessons
- Progress tracking
- Mark as complete functionality
- Auto-complete at 90% video progress

**Usage:**
```dart
// Navigate to lesson
context.push('/courses/$courseId/lessons/$lessonId');
```

**Parameters:**
- `courseId` (String, required): The ID of the course
- `lessonId` (String, required): The ID of the lesson

## Widgets

### CourseCard

Reusable card widget for displaying course information.

**Properties:**
- `course` (CourseEntity, required): The course to display
- `onTap` (VoidCallback?, optional): Callback when card is tapped

**Features:**
- Thumbnail image with fallback
- Course title and instructor
- Rating display (if available)
- Category and level chips
- Price or "Free" indicator
- Enrollment count

**Usage:**
```dart
CourseCard(
  course: courseEntity,
  onTap: () {
    context.push('/courses/${courseEntity.id}');
  },
)
```

### CourseFilterDialog

Dialog for filtering courses by category and level.

**Properties:**
- `selectedCategory` (CourseCategory?, optional): Currently selected category
- `selectedLevel` (CourseLevel?, optional): Currently selected level
- `onApply` (Function, required): Callback with selected filters

**Features:**
- Category selection chips
- Level selection chips with color coding
- Clear all filters button
- Apply button to confirm selection

**Usage:**
```dart
showCourseFilterDialog(
  context: context,
  selectedCategory: currentCategory,
  selectedLevel: currentLevel,
  onApply: (category, level) {
    if (category != null) {
      context.read<CourseBloc>().add(
        CourseEvent.filterByCategory(category),
      );
    }
    if (level != null) {
      context.read<CourseBloc>().add(
        CourseEvent.filterByLevel(level),
      );
    }
  },
);
```

### LessonVideoPlayer

Custom video player widget with controls and progress tracking.

**Properties:**
- `videoUrl` (String, required): URL of the video to play
- `onCompleted` (VoidCallback?, optional): Callback when video completes
- `onProgress` (Function?, optional): Callback with position and duration

**Features:**
- Network and asset video support
- Play/pause control
- Progress bar with scrubbing
- Time display
- Auto-hide controls
- Error handling
- Loading state

**Usage:**
```dart
LessonVideoPlayer(
  videoUrl: lesson.videoUrl!,
  onProgress: (position, duration) {
    final progress = position.inSeconds / duration.inSeconds;
    // Update progress tracking
  },
  onCompleted: () {
    // Mark lesson as complete
  },
)
```

## Dependencies

This feature depends on:

**Common Package:**
- `CourseEntity` - Domain entity for courses
- `LessonEntity` - Domain entity for lessons
- `GetCoursesUseCase` - Fetch all courses
- `GetCourseByIdUseCase` - Fetch course by ID
- `GetCourseLessonsUseCase` - Fetch lessons for a course
- `SearchCoursesUseCase` - Search courses
- `FilterCoursesUseCase` - Filter courses

**Flutter Packages:**
- `flutter_bloc` - State management
- `freezed` - Immutable data classes
- `go_router` - Navigation
- `video_player` - Video playback
- `cached_network_image` - Image caching

## State Management Flow

1. **User Action** → Event is added to BLoC
2. **BLoC** → Calls appropriate use case from common package
3. **Use Case** → Calls repository (from common package)
4. **Repository** → Fetches data from Supabase
5. **BLoC** → Emits new state with data or error
6. **UI** → Rebuilds with new state

Example flow for loading courses:

```
User opens CourseListPage
  ↓
BlocProvider creates CourseBloc with use cases
  ↓
CourseBloc receives LoadCoursesEvent
  ↓
CourseBloc calls GetCoursesUseCase()
  ↓
GetCoursesUseCase calls CourseRepository.getCourses()
  ↓
CourseRepository fetches from Supabase
  ↓
Either<Failure, List<CourseEntity>> returned
  ↓
CourseBloc emits CoursesLoaded state
  ↓
BlocBuilder rebuilds UI with course list
```

## Routing

All course-related routes are defined in `app_router.dart`:

```dart
// Browse courses
'/courses' → CourseListPage

// View course detail
'/courses/:id' → CourseDetailPage(courseId)

// View lesson
'/courses/:courseId/lessons/:lessonId' → LessonPage(courseId, lessonId)
```

## Future Enhancements

- [ ] Offline course downloads
- [ ] Bookmarking courses
- [ ] Course recommendations
- [ ] Advanced search filters
- [ ] Course ratings and reviews
- [ ] Social sharing
- [ ] Course prerequisites display
- [ ] Learning path visualization
- [ ] Video playback speed control
- [ ] Video quality selection
- [ ] Closed captions support
- [ ] Picture-in-picture mode

## Testing

Unit tests should cover:
- CourseBloc event handlers
- State transitions
- Error handling
- Use case integration

Widget tests should cover:
- CourseListPage rendering
- CourseDetailPage tabs
- LessonPage video player
- Filter dialog functionality
- Empty and error states

Example test:
```dart
test('emits CoursesLoaded when LoadCoursesEvent succeeds', () async {
  // Arrange
  when(() => mockGetCoursesUseCase())
      .thenAnswer((_) async => Right(courses));

  // Act
  courseBloc.add(const CourseEvent.loadCourses());

  // Assert
  await expectLater(
    courseBloc.stream,
    emitsInOrder([
      const CourseState.loading(),
      CourseState.coursesLoaded(courses: courses),
    ]),
  );
});
```

## Related Features

- **Dashboard** - Shows enrolled courses
- **Enrollment** - Manages course enrollments
- **Quiz** - Course assessments
- **Profile** - Tracks course progress
