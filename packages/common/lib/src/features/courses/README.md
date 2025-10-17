# Course Feature

## Overview

The Course feature provides complete course and lesson management functionality for the Formation Métiers application. It allows users to browse, search, filter, and access training courses with their lessons. The feature follows Clean Architecture principles with distinct domain, data, and presentation layers.

## Architecture

```
courses/
├── domain/
│   ├── entities/
│   │   ├── course_entity.dart        # Course domain entity
│   │   └── lesson_entity.dart        # Lesson domain entity
│   ├── repositories/
│   │   └── course_repository.dart    # Repository interface
│   └── usecases/
│       ├── get_courses_usecase.dart
│       ├── get_course_by_id_usecase.dart
│       ├── get_course_lessons_usecase.dart
│       ├── search_courses_usecase.dart
│       └── filter_courses_usecase.dart
├── data/
│   ├── models/
│   │   ├── course_model.dart         # Course data model with JSON
│   │   └── lesson_model.dart         # Lesson data model with JSON
│   ├── datasources/
│   │   └── course_remote_datasource.dart  # Supabase implementation
│   └── repositories/
│       └── course_repository_impl.dart    # Repository implementation
└── README.md
```

## Features

### ✅ Implemented

- **Browse Courses**: View all published courses
- **Course Categories**: Filter by CCQ, Non-Construction, Red Seal
- **Course Details**: Get detailed course information
- **Lessons**: View all lessons for a course
- **Search**: Search courses by title or description
- **Advanced Filtering**: Filter by category, level, price range, rating
- **Instructor Courses**: View courses by specific instructor
- **Popular Courses**: Get most enrolled courses
- **Featured Courses**: Get highly-rated and popular courses
- **Error Handling**: Comprehensive error handling with Either pattern
- **Dependency Injection**: Full GetIt + Injectable integration
- **Logging**: Detailed logging for debugging and monitoring

### 🔜 Future Enhancements

- Course enrollment management
- Course progress tracking
- Course ratings and reviews
- Course creation and editing (instructor features)
- Lesson video streaming
- Course certificates
- Course recommendations

## Domain Layer

### CourseEntity

The core domain entity representing a training course.

```dart
import 'package:common/common.dart';

final course = CourseEntity(
  id: '123e4567-e89b-12d3-a456-426614174000',
  title: 'Électricien CCQ',
  description: 'Formation complète pour devenir électricien...',
  category: CourseCategory.ccq,
  thumbnailUrl: 'https://example.com/course.jpg',
  instructorId: 'instructor-123',
  instructorName: 'Jean Tremblay',
  price: 299.99,
  duration: 900, // minutes
  level: CourseLevel.beginner,
  isPublished: true,
  enrollmentCount: 150,
  rating: 4.5,
  ratingCount: 45,
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);

// Helper methods
print(course.isFree);              // false
print(course.formattedPrice);      // '299,99 $'
print(course.formattedDuration);   // '15h'
print(course.formattedRating);     // '4.5'
print(course.categoryDisplayName); // 'CCQ'
print(course.levelDisplayName);    // 'Débutant'
print(course.isPopular);           // true (> 50 enrollments)
print(course.isHighlyRated);       // true (>= 4.0 rating with >= 5 reviews)
```

**Course Categories:**
- `CourseCategory.ccq` - CCQ (Commission de la construction du Québec) certification
- `CourseCategory.nonConstruction` - Non-construction related courses
- `CourseCategory.redSeal` - Red Seal (Sceau Rouge) certification

**Course Levels:**
- `CourseLevel.beginner` - Débutant
- `CourseLevel.intermediate` - Intermédiaire
- `CourseLevel.advanced` - Avancé
- `CourseLevel.expert` - Expert

### LessonEntity

The core domain entity representing a lesson within a course.

```dart
final lesson = LessonEntity(
  id: 'lesson-123',
  courseId: 'course-456',
  title: 'Introduction à l\'électricité',
  description: 'Les bases de l\'électricité...',
  content: 'Dans cette leçon, nous allons...',
  videoUrl: 'https://example.com/video.mp4',
  videoThumbnailUrl: 'https://example.com/thumb.jpg',
  videoDuration: 1800, // seconds
  orderIndex: 0,
  duration: 30, // minutes
  resources: [
    'https://example.com/doc1.pdf',
    'https://example.com/doc2.pdf',
  ],
  isPreview: true,
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);

// Helper methods
print(lesson.hasVideo);              // true
print(lesson.hasResources);          // true
print(lesson.formattedDuration);     // '30 min'
print(lesson.formattedVideoDuration); // '30:00'
print(lesson.lessonNumber);          // 1 (orderIndex + 1)
print(lesson.displayTitle);          // 'Leçon 1: Introduction à l'électricité'
print(lesson.contentPreview);        // First 150 characters
print(lesson.resourceCount);         // 2
```

### CourseRepository Interface

Defines the contract for course operations.

```dart
abstract class CourseRepository {
  Future<Either<Failure, List<CourseEntity>>> getCourses();

  Future<Either<Failure, List<CourseEntity>>> getCoursesByCategory(
    CourseCategory category,
  );

  Future<Either<Failure, CourseEntity>> getCourseById(String courseId);

  Future<Either<Failure, List<LessonEntity>>> getCourseLessons(String courseId);

  Future<Either<Failure, LessonEntity>> getLessonById(String lessonId);

  Future<Either<Failure, List<CourseEntity>>> searchCourses(String query);

  Future<Either<Failure, List<CourseEntity>>> filterCourses({
    CourseCategory? category,
    CourseLevel? level,
    double? minPrice,
    double? maxPrice,
    double? minRating,
  });

  Future<Either<Failure, List<CourseEntity>>> getCoursesByInstructor(
    String instructorId,
  );

  Future<Either<Failure, List<CourseEntity>>> getPopularCourses({
    int limit = 10,
  });

  Future<Either<Failure, List<CourseEntity>>> getFeaturedCourses({
    int limit = 5,
  });
}
```

### Use Cases

#### GetCoursesUseCase

Retrieves all published courses.

```dart
final getCoursesUseCase = getIt<GetCoursesUseCase>();

final result = await getCoursesUseCase();

result.fold(
  (failure) {
    // Handle error
    print('Failed to load courses: ${failure.message}');
  },
  (courses) {
    // Success
    print('Loaded ${courses.length} courses');
    for (var course in courses) {
      print('${course.title} - ${course.formattedPrice}');
    }
  },
);
```

**Possible Failures:**
- `NetworkFailure` - No internet connection
- `ServerFailure` - Server error
- `DatabaseFailure` - Database query error

#### GetCourseByIdUseCase

Gets detailed information about a specific course.

```dart
final getCourseByIdUseCase = getIt<GetCourseByIdUseCase>();

final result = await getCourseByIdUseCase(
  GetCourseByIdParams(courseId: 'course-123'),
);

result.fold(
  (failure) {
    if (failure is NotFoundFailure) {
      print('Course not found');
    } else {
      print('Error: ${failure.message}');
    }
  },
  (course) {
    print('Course: ${course.title}');
    print('Instructor: ${course.instructorName}');
    print('Rating: ${course.formattedRating}');
    print('Enrollments: ${course.enrollmentCount}');
  },
);
```

**Validations:**
- Course ID not empty

**Possible Failures:**
- `ValidationFailure` - Invalid course ID
- `NotFoundFailure` - Course not found
- `NetworkFailure` - No internet connection
- `ServerFailure` - Server error
- `DatabaseFailure` - Database query error

#### GetCourseLessonsUseCase

Retrieves all lessons for a course, ordered by sequence.

```dart
final getCourseLessonsUseCase = getIt<GetCourseLessonsUseCase>();

final result = await getCourseLessonsUseCase(
  GetCourseLessonsParams(courseId: 'course-123'),
);

result.fold(
  (failure) => print('Failed to load lessons'),
  (lessons) {
    print('Course has ${lessons.length} lessons');
    for (var lesson in lessons) {
      print('${lesson.displayTitle} - ${lesson.formattedDuration}');
      if (lesson.hasVideo) {
        print('  Video: ${lesson.formattedVideoDuration}');
      }
    }
  },
);
```

**Validations:**
- Course ID not empty

**Possible Failures:**
- `ValidationFailure` - Invalid course ID
- `NotFoundFailure` - Course not found
- `NetworkFailure` - No internet connection
- `ServerFailure` - Server error
- `DatabaseFailure` - Database query error

#### SearchCoursesUseCase

Searches courses by title or description.

```dart
final searchCoursesUseCase = getIt<SearchCoursesUseCase>();

final result = await searchCoursesUseCase(
  SearchCoursesParams(query: 'électricien'),
);

result.fold(
  (failure) {
    if (failure is ValidationFailure) {
      print('Invalid search query: ${failure.message}');
    } else {
      print('Search failed');
    }
  },
  (courses) {
    print('Found ${courses.length} courses');
    for (var course in courses) {
      print('${course.title} - ${course.categoryDisplayName}');
    }
  },
);
```

**Validations:**
- Query not empty
- Query minimum 2 characters

**Possible Failures:**
- `ValidationFailure` - Empty or too short query
- `NetworkFailure` - No internet connection
- `ServerFailure` - Server error
- `DatabaseFailure` - Database query error

#### FilterCoursesUseCase

Filters courses by multiple criteria.

```dart
final filterCoursesUseCase = getIt<FilterCoursesUseCase>();

final result = await filterCoursesUseCase(
  FilterCoursesParams(
    category: CourseCategory.ccq,
    level: CourseLevel.beginner,
    maxPrice: 100.0,
    minRating: 4.0,
  ),
);

result.fold(
  (failure) {
    if (failure is ValidationFailure) {
      print('Invalid filter: ${failure.message}');
    }
  },
  (courses) {
    print('Found ${courses.length} matching courses');
  },
);
```

**Validations:**
- Min price >= 0
- Max price >= 0
- Min price <= max price
- Min rating between 0 and 5

**Possible Failures:**
- `ValidationFailure` - Invalid filter values
- `NetworkFailure` - No internet connection
- `ServerFailure` - Server error
- `DatabaseFailure` - Database query error

## Data Layer

### CourseModel

Data layer model with JSON serialization.

```dart
// From JSON (Supabase response)
final json = {
  'id': '123e4567-e89b-12d3-a456-426614174000',
  'title': 'Électricien CCQ',
  'description': 'Formation complète...',
  'category': 'ccq',
  'thumbnail_url': 'https://example.com/course.jpg',
  'instructor_id': 'instructor-123',
  'instructor_name': 'Jean Tremblay',
  'price': 299.99,
  'duration': 900,
  'level': 'beginner',
  'is_published': true,
  'enrollment_count': 150,
  'rating': 4.5,
  'rating_count': 45,
  'created_at': '2024-01-15T10:30:00.000Z',
  'updated_at': '2024-01-20T15:45:00.000Z',
};

final model = CourseModel.fromJson(json);

// To JSON
final jsonOutput = model.toJson();

// To domain entity
final entity = model.toEntity();

// From domain entity
final model2 = CourseModel.fromEntity(entity);

// From Supabase with instructor join
final model3 = CourseModel.fromSupabaseWithInstructor(jsonWithProfile);
```

### LessonModel

Data layer model with JSON serialization.

```dart
// From JSON
final json = {
  'id': 'lesson-123',
  'course_id': 'course-456',
  'title': 'Introduction',
  'description': 'Les bases...',
  'content': 'Dans cette leçon...',
  'video_url': 'https://example.com/video.mp4',
  'order_index': 0,
  'duration': 30,
  'resources': ['https://example.com/doc.pdf'],
  'is_preview': true,
  'created_at': '2024-01-15T10:30:00.000Z',
  'updated_at': '2024-01-20T15:45:00.000Z',
};

final model = LessonModel.fromJson(json);
final entity = model.toEntity();
```

### CourseRemoteDataSource

Handles all remote course operations using Supabase.

**Key Features:**
- Instructor joins using Supabase relationships
- Case-insensitive search with `ilike`
- Advanced filtering with query builders
- Popular/featured course queries
- Comprehensive error handling

**Example Queries:**

```dart
// Get all courses with instructor information
final courses = await _supabase
  .from('courses')
  .select('*, profiles!instructor_id(full_name, email)')
  .eq('is_published', true)
  .order('created_at', ascending: false);

// Search courses
final results = await _supabase
  .from('courses')
  .select('*, profiles!instructor_id(full_name, email)')
  .eq('is_published', true)
  .or('title.ilike.%$query%,description.ilike.%$query%');

// Filter courses
var query = _supabase
  .from('courses')
  .select('*, profiles!instructor_id(full_name, email)')
  .eq('is_published', true);

if (category != null) {
  query = query.eq('category', categoryString);
}

if (minPrice != null) {
  query = query.gte('price', minPrice);
}
```

## Dependency Injection

All course components are registered with GetIt using Injectable.

```dart
// In your app initialization
await configureDependencies();

// Use cases are available via GetIt
final getCoursesUseCase = getIt<GetCoursesUseCase>();
final getCourseByIdUseCase = getIt<GetCourseByIdUseCase>();
final getCourseLessonsUseCase = getIt<GetCourseLessonsUseCase>();
final searchCoursesUseCase = getIt<SearchCoursesUseCase>();
final filterCoursesUseCase = getIt<FilterCoursesUseCase>();

// Repository is also available
final courseRepository = getIt<CourseRepository>();
```

**Registered Components:**
- `GetCoursesUseCase` - @lazySingleton
- `GetCourseByIdUseCase` - @lazySingleton
- `GetCourseLessonsUseCase` - @lazySingleton
- `SearchCoursesUseCase` - @lazySingleton
- `FilterCoursesUseCase` - @lazySingleton
- `CourseRemoteDataSource` - @LazySingleton
- `CourseRepository` - @LazySingleton

## Database Schema

### Courses Table

```sql
CREATE TABLE public.courses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  category TEXT NOT NULL CHECK (category IN ('ccq', 'non_construction', 'red_seal')),
  thumbnail_url TEXT,
  instructor_id UUID REFERENCES public.profiles(id) NOT NULL,
  price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  duration INT NOT NULL, -- in minutes
  level TEXT NOT NULL CHECK (level IN ('beginner', 'intermediate', 'advanced', 'expert')),
  is_published BOOLEAN DEFAULT FALSE,
  enrollment_count INT DEFAULT 0,
  rating DECIMAL(3,2) DEFAULT 0.00,
  rating_count INT DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### Lessons Table

```sql
CREATE TABLE public.lessons (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  course_id UUID REFERENCES public.courses(id) ON DELETE CASCADE NOT NULL,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  content TEXT NOT NULL,
  video_url TEXT,
  video_thumbnail_url TEXT,
  video_duration INT, -- in seconds
  order_index INT NOT NULL,
  duration INT NOT NULL, -- in minutes
  resources TEXT[], -- array of URLs
  is_preview BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(course_id, order_index)
);
```

## Usage Examples

### Browse All Courses

```dart
class CoursesPage extends StatelessWidget {
  final _getCoursesUseCase = getIt<GetCoursesUseCase>();

  Future<void> _loadCourses() async {
    final result = await _getCoursesUseCase();

    result.fold(
      (failure) {
        // Show error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.message)),
        );
      },
      (courses) {
        // Display courses
        setState(() {
          _courses = courses;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _courses.length,
      itemBuilder: (context, index) {
        final course = _courses[index];
        return CourseCard(course: course);
      },
    );
  }
}
```

### Course Details with Lessons

```dart
class CourseDetailsPage extends StatefulWidget {
  final String courseId;

  const CourseDetailsPage({required this.courseId});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  final _getCourseByIdUseCase = getIt<GetCourseByIdUseCase>();
  final _getCourseLessonsUseCase = getIt<GetCourseLessonsUseCase>();

  CourseEntity? _course;
  List<LessonEntity> _lessons = [];

  @override
  void initState() {
    super.initState();
    _loadCourseDetails();
  }

  Future<void> _loadCourseDetails() async {
    // Load course
    final courseResult = await _getCourseByIdUseCase(
      GetCourseByIdParams(courseId: widget.courseId),
    );

    courseResult.fold(
      (failure) => _showError(failure.message),
      (course) => setState(() => _course = course),
    );

    // Load lessons
    final lessonsResult = await _getCourseLessonsUseCase(
      GetCourseLessonsParams(courseId: widget.courseId),
    );

    lessonsResult.fold(
      (failure) => _showError(failure.message),
      (lessons) => setState(() => _lessons = lessons),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_course == null) return CircularProgressIndicator();

    return Scaffold(
      appBar: AppBar(title: Text(_course!.title)),
      body: Column(
        children: [
          // Course header
          CourseHeader(course: _course!),

          // Lessons list
          Expanded(
            child: ListView.builder(
              itemCount: _lessons.length,
              itemBuilder: (context, index) {
                final lesson = _lessons[index];
                return LessonTile(lesson: lesson);
              },
            ),
          ),
        ],
      ),
    );
  }
}
```

### Search and Filter

```dart
class CourseSearchPage extends StatefulWidget {
  @override
  State<CourseSearchPage> createState() => _CourseSearchPageState();
}

class _CourseSearchPageState extends State<CourseSearchPage> {
  final _searchCoursesUseCase = getIt<SearchCoursesUseCase>();
  final _filterCoursesUseCase = getIt<FilterCoursesUseCase>();

  List<CourseEntity> _courses = [];
  String _searchQuery = '';
  CourseCategory? _selectedCategory;
  CourseLevel? _selectedLevel;

  Future<void> _search() async {
    if (_searchQuery.isNotEmpty) {
      final result = await _searchCoursesUseCase(
        SearchCoursesParams(query: _searchQuery),
      );

      result.fold(
        (failure) => _showError(failure.message),
        (courses) => setState(() => _courses = courses),
      );
    }
  }

  Future<void> _applyFilters() async {
    final result = await _filterCoursesUseCase(
      FilterCoursesParams(
        category: _selectedCategory,
        level: _selectedLevel,
        maxPrice: 200.0,
        minRating: 3.5,
      ),
    );

    result.fold(
      (failure) => _showError(failure.message),
      (courses) => setState(() => _courses = courses),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        TextField(
          onChanged: (value) => _searchQuery = value,
          onSubmitted: (_) => _search(),
          decoration: InputDecoration(
            hintText: 'Rechercher un cours...',
            suffixIcon: Icon(Icons.search),
          ),
        ),

        // Filters
        Row(
          children: [
            DropdownButton<CourseCategory>(
              value: _selectedCategory,
              hint: Text('Catégorie'),
              items: CourseCategory.values.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedCategory = value);
                _applyFilters();
              },
            ),
            // More filters...
          ],
        ),

        // Results
        Expanded(
          child: ListView.builder(
            itemCount: _courses.length,
            itemBuilder: (context, index) {
              return CourseCard(course: _courses[index]);
            },
          ),
        ),
      ],
    );
  }
}
```

### Featured and Popular Courses

```dart
class HomePage extends StatelessWidget {
  final _getCourseRepository = getIt<CourseRepository>();

  Future<void> _loadFeaturedAndPopular() async {
    // Get featured courses
    final featuredResult = await _getCourseRepository.getFeaturedCourses(
      limit: 5,
    );

    // Get popular courses
    final popularResult = await _getCourseRepository.getPopularCourses(
      limit: 10,
    );

    // Handle results...
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Featured section
        Text('Cours vedettes', style: AppTypography.headlineMedium),
        FeaturedCoursesCarousel(),

        // Popular section
        Text('Cours populaires', style: AppTypography.headlineMedium),
        PopularCoursesList(),
      ],
    );
  }
}
```

## Best Practices

### 1. Always Handle Both Sides of Either

```dart
// ✅ Good
result.fold(
  (failure) => handleError(failure),
  (courses) => displayCourses(courses),
);

// ❌ Bad
result.fold(
  (_) => null,
  (courses) => displayCourses(courses),
);
```

### 2. Use Validation in Use Cases

```dart
// ✅ Good - validated in use case
final result = await searchCoursesUseCase(
  SearchCoursesParams(query: userInput),
);

// Use case validates query length, format, etc.
```

### 3. Cache Course Data When Appropriate

```dart
// ✅ Good - cache course details
class CourseCache {
  final Map<String, CourseEntity> _cache = {};

  Future<CourseEntity> getCourse(String id) async {
    if (_cache.containsKey(id)) {
      return _cache[id]!;
    }

    final result = await getCourseByIdUseCase(
      GetCourseByIdParams(courseId: id),
    );

    return result.fold(
      (failure) => throw Exception(failure.message),
      (course) {
        _cache[id] = course;
        return course;
      },
    );
  }
}
```

### 4. Display Loading States

```dart
// ✅ Good - shows loading state
class CoursesPage extends StatefulWidget {
  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  bool _isLoading = false;
  List<CourseEntity> _courses = [];

  Future<void> _loadCourses() async {
    setState(() => _isLoading = true);

    final result = await getCoursesUseCase();

    setState(() => _isLoading = false);

    result.fold(
      (failure) => _showError(failure),
      (courses) => setState(() => _courses = courses),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return CoursesList(courses: _courses);
  }
}
```

## Troubleshooting

### Common Issues

**Issue: "Course not found" error**
- Verify course ID is correct
- Check if course is published (`is_published = true`)
- Verify database RLS policies allow reading

**Issue: Instructor name shows as "Unknown"**
- Check if instructor profile exists in profiles table
- Verify the foreign key relationship is correct
- Check RLS policies on profiles table

**Issue: Search returns no results**
- Verify search query is at least 2 characters
- Check if there are published courses in database
- Try exact title match first

**Issue: Lessons not ordered correctly**
- Verify `order_index` values are sequential (0, 1, 2, ...)
- Check for duplicate `order_index` values
- Ensure database query orders by `order_index`

## Related Documentation

- [Core Error Handling](../../core/error/README.md)
- [Dependency Injection](../../core/di/README.md)
- [Supabase Client](../../core/network/README.md)
- [Authentication Feature](../auth/README.md)

## Support

For issues or questions:
1. Check Supabase documentation: https://supabase.com/docs
2. Review Clean Architecture patterns
3. Check application logs using AppLogger
