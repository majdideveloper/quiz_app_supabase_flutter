# Profile Feature

This feature handles user profile management, preferences, and learning statistics for the Formation Métiers application.

## Architecture

This feature follows Clean Architecture principles with three main layers:

### Domain Layer (`domain/`)
- **Entities**: Core business objects (ProfileEntity)
- **Repositories**: Abstract interfaces defining data operations
- **Use Cases**: Business logic for profile operations

### Data Layer (`data/`)
- **Models**: Data transfer objects with JSON serialization
- **Data Sources**: Remote data source implementation using Supabase
- **Repositories**: Implementation of domain repository interfaces

## Features

### Profile Management
- View user profiles
- Update personal information
- Upload and manage avatars
- Profile completion tracking
- Account activation/deactivation

### Preferences
- Language preferences
- Notification settings
- Email notification preferences

### Learning Statistics
- Total enrollments tracking
- Completed courses count
- Certificates earned
- Points system
- Completion rate calculation

## Entities

### ProfileEntity

Represents a user's profile and learning data.

**User Roles:**
- `student`: Regular student user
- `instructor`: Course instructor
- `admin`: System administrator

**Key Properties:**
- `id`: Unique user identifier
- `email`: User email address
- `fullName`: User's full name
- `avatarUrl`: Profile picture URL
- `phone`: Phone number
- `bio`: User biography
- `role`: User role (student, instructor, admin)
- `dateOfBirth`: Date of birth
- `address`, `city`, `province`, `postalCode`, `country`: Address information
- `preferredLanguage`: Preferred UI language
- `notificationsEnabled`: Push notifications setting
- `emailNotificationsEnabled`: Email notifications setting
- `totalEnrollments`: Total courses enrolled in
- `completedCourses`: Number of completed courses
- `certificatesEarned`: Number of certificates
- `totalPoints`: Total points earned
- `lastLoginAt`: Last login timestamp

**Helper Methods:**
```dart
String get displayName             // Full name or email
String get initials                // User initials for avatar
String get roleDisplayName         // French role name
bool get isStudent                 // Check if student
bool get isInstructor              // Check if instructor
bool get isAdmin                   // Check if admin
String? get fullAddress            // Complete address string
bool get hasCompleteAddress        // Check if address is complete
bool get isProfileComplete         // Check if all required fields filled
int get profileCompletionPercentage // Profile completion (0-100)
int? get age                       // Age from date of birth
bool get isRecentlyActive          // Active within 30 days
int? get daysSinceLastLogin        // Days since last login
String get learningLevel           // Learning level based on completed courses
double get completionRate          // Course completion rate percentage
String get formattedCompletionRate // Formatted completion rate
```

## Use Cases

### GetProfileUseCase

Get a user's profile by ID or current user.

**Usage:**
```dart
final getProfileUseCase = getIt<GetProfileUseCase>();

// Get specific user profile
final result = await getProfileUseCase('user-123');

// Get current user profile
final currentUserResult = await getProfileUseCase();

result.fold(
  (failure) => print('Error: ${failure.message}'),
  (profile) {
    print('Name: ${profile.fullName}');
    print('Email: ${profile.email}');
    print('Role: ${profile.roleDisplayName}');
    print('Completion: ${profile.profileCompletionPercentage}%');
    print('Learning level: ${profile.learningLevel}');
  },
);
```

### UpdateProfileUseCase

Update a user's profile information.

**Usage:**
```dart
final updateProfileUseCase = getIt<UpdateProfileUseCase>();

final params = UpdateProfileParams(
  userId: 'user-123',
  fullName: 'Jean Tremblay',
  phone: '+1 514-555-0123',
  bio: 'Électricien en formation',
  dateOfBirth: DateTime(1990, 5, 15),
  address: '123 Rue Principale',
  city: 'Montréal',
  province: 'QC',
  postalCode: 'H1A 1A1',
  country: 'Canada',
);

final result = await updateProfileUseCase(params);

result.fold(
  (failure) => print('Error: ${failure.message}'),
  (profile) {
    print('Profile updated successfully');
    print('Completion: ${profile.profileCompletionPercentage}%');
  },
);
```

**Validations:**
- User ID must not be empty
- At least one field must be updated
- Full name cannot be empty if provided
- Phone number must match regex pattern
- Date of birth cannot be in future
- User must be at least 13 years old
- Postal code must match Canadian format (A1A 1A1)

## Repository Methods

The `ProfileRepository` interface defines the following operations:

### Profile Operations
```dart
// Get user profile
Future<Either<Failure, ProfileEntity>> getProfile(String userId);

// Get current user profile
Future<Either<Failure, ProfileEntity>> getCurrentUserProfile();

// Update profile information
Future<Either<Failure, ProfileEntity>> updateProfile({
  required String userId,
  String? fullName,
  String? phone,
  String? bio,
  DateTime? dateOfBirth,
  String? address,
  String? city,
  String? province,
  String? postalCode,
  String? country,
});

// Upload avatar
Future<Either<Failure, ProfileEntity>> uploadAvatar({
  required String userId,
  required String filePath,
});

// Delete avatar
Future<Either<Failure, ProfileEntity>> deleteAvatar(String userId);
```

### Preferences Operations
```dart
// Update user preferences
Future<Either<Failure, ProfileEntity>> updatePreferences({
  required String userId,
  String? preferredLanguage,
  bool? notificationsEnabled,
  bool? emailNotificationsEnabled,
});

// Update last login
Future<Either<Failure, ProfileEntity>> updateLastLogin(String userId);
```

### Statistics Operations
```dart
// Update learning statistics
Future<Either<Failure, ProfileEntity>> updateLearningStats({
  required String userId,
  int? totalEnrollments,
  int? completedCourses,
  int? certificatesEarned,
  int? totalPoints,
});
```

### Admin Operations
```dart
// Deactivate profile
Future<Either<Failure, ProfileEntity>> deactivateProfile(String userId);

// Reactivate profile
Future<Either<Failure, ProfileEntity>> reactivateProfile(String userId);

// Search profiles
Future<Either<Failure, List<ProfileEntity>>> searchProfiles(String query);

// Get profiles by role
Future<Either<Failure, List<ProfileEntity>>> getProfilesByRole(UserRole role);
```

## Data Models

### ProfileModel

Maps to the `profiles` table in Supabase.

**JSON Mapping:**
```json
{
  "id": "uuid",
  "email": "user@example.com",
  "full_name": "Jean Tremblay",
  "avatar_url": "https://...",
  "phone": "+1 514-555-0123",
  "bio": "Électricien en formation",
  "role": "student",
  "email_verified": false,
  "is_active": true,
  "date_of_birth": "1990-05-15",
  "address": "123 Rue Principale",
  "city": "Montréal",
  "province": "QC",
  "postal_code": "H1A 1A1",
  "country": "Canada",
  "preferred_language": "fr",
  "notifications_enabled": true,
  "email_notifications_enabled": false,
  "total_enrollments": 5,
  "completed_courses": 2,
  "certificates_earned": 2,
  "total_points": 500,
  "last_login_at": "timestamp",
  "created_at": "timestamp",
  "updated_at": "timestamp"
}
```

## Remote Data Source

The `ProfileRemoteDataSource` uses Supabase for all data operations.

### Key Features:
- **Authentication Check**: Validates current user authentication
- **Avatar Storage**: Uses Supabase Storage for avatar uploads
- **Public URLs**: Generates public URLs for avatar images
- **Search**: Case-insensitive search by name or email
- **Role Filtering**: Filter profiles by user role
- **Comprehensive Logging**: All operations logged with AppLogger
- **Exception Handling**: Converts Supabase exceptions to domain exceptions

### Storage Bucket:
- **Bucket Name**: `avatars`
- **Path Format**: `avatars/{userId}-{timestamp}.{ext}`
- **Public Access**: Yes (for avatar display)

## Example Workflows

### Viewing Profile

```dart
// Get current user's profile
final profileResult = await getProfileUseCase();

profileResult.fold(
  (failure) => showError(failure.message),
  (profile) {
    print('Welcome ${profile.displayName}!');
    print('Email: ${profile.email}');
    print('Role: ${profile.roleDisplayName}');

    if (!profile.isProfileComplete) {
      print('Profile ${profile.profileCompletionPercentage}% complete');
      print('Please complete your profile');
    }

    if (profile.hasEnrollments) {
      print('Enrolled in ${profile.totalEnrollments} courses');
      print('Completed ${profile.completedCourses} courses');
      print('Completion rate: ${profile.formattedCompletionRate}');
    }
  },
);
```

### Updating Profile

```dart
// Update personal information
final params = UpdateProfileParams(
  userId: currentUserId,
  fullName: fullNameController.text,
  phone: phoneController.text,
  bio: bioController.text,
  address: addressController.text,
  city: cityController.text,
  province: provinceController.text,
  postalCode: postalCodeController.text,
);

final result = await updateProfileUseCase(params);

result.fold(
  (failure) {
    if (failure is ValidationFailure) {
      showValidationError(failure.message);
    } else {
      showError(failure.message);
    }
  },
  (profile) {
    showSuccess('Profil mis à jour avec succès');

    if (profile.isProfileComplete) {
      showAchievement('Profil complété à 100% !');
    }
  },
);
```

### Uploading Avatar

```dart
// Pick image file
final pickedFile = await ImagePicker().pickImage(
  source: ImageSource.gallery,
);

if (pickedFile != null) {
  final result = await profileRepository.uploadAvatar(
    userId: currentUserId,
    filePath: pickedFile.path,
  );

  result.fold(
    (failure) {
      if (failure is StorageFailure) {
        showError('Erreur lors du téléchargement de l\'image');
      } else {
        showError(failure.message);
      }
    },
    (profile) {
      showSuccess('Avatar mis à jour');
      updateProfileImage(profile.avatarUrl);
    },
  );
}
```

### Managing Preferences

```dart
// Update notification preferences
final result = await profileRepository.updatePreferences(
  userId: currentUserId,
  notificationsEnabled: true,
  emailNotificationsEnabled: false,
  preferredLanguage: 'fr',
);

result.fold(
  (failure) => showError(failure.message),
  (profile) {
    showSuccess('Préférences enregistrées');

    // Update app locale if language changed
    if (profile.preferredLanguage == 'en') {
      setLocale(Locale('en'));
    }
  },
);
```

### Admin: Searching Users

```dart
// Search for users (admin only)
final searchResult = await profileRepository.searchProfiles('tremblay');

searchResult.fold(
  (failure) => showError(failure.message),
  (profiles) {
    print('Found ${profiles.length} users');

    for (final profile in profiles) {
      print('${profile.fullName} (${profile.email})');
      print('Role: ${profile.roleDisplayName}');
      print('Active: ${profile.isActive}');

      if (!profile.isRecentlyActive) {
        print('⚠️ Inactive for ${profile.daysSinceLastLogin} days');
      }
    }
  },
);
```

### Admin: Managing Users

```dart
// Get all instructors
final instructorsResult = await profileRepository.getProfilesByRole(
  UserRole.instructor,
);

instructorsResult.fold(
  (failure) => showError(failure.message),
  (instructors) {
    print('${instructors.length} instructors');

    for (final instructor in instructors) {
      print('${instructor.fullName}');
      print('Created: ${instructor.createdAt}');
    }
  },
);

// Deactivate user
final deactivateResult = await profileRepository.deactivateProfile(userId);

deactivateResult.fold(
  (failure) => showError(failure.message),
  (profile) => print('User deactivated: ${profile.email}'),
);
```

## Error Handling

All repository methods return `Either<Failure, T>` where failures can be:

- **NotFoundFailure**: Profile not found
- **AuthenticationFailure**: User not authenticated
- **ValidationFailure**: Invalid input data
- **StorageFailure**: File upload/deletion error
- **AuthorizationFailure**: User not authorized for action
- **DatabaseFailure**: Database operation failed
- **NetworkFailure**: Network connection error
- **ServerFailure**: Server error
- **UnexpectedFailure**: Unexpected error occurred

## Best Practices

1. **Profile Completion**: Encourage users to complete their profiles
2. **Avatar Guidelines**: Validate image size and format before upload
3. **Privacy**: Only allow users to update their own profiles
4. **Admin Actions**: Log all admin actions (deactivate, search, etc.)
5. **Validation**: Always validate user input before submission
6. **Learning Stats**: Update automatically when courses are completed
7. **Last Login**: Update on each app launch

## Database Schema

### profiles table
```sql
CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id),
  email TEXT NOT NULL UNIQUE,
  full_name TEXT NOT NULL,
  avatar_url TEXT,
  phone TEXT,
  bio TEXT,
  role TEXT NOT NULL DEFAULT 'student',
  email_verified BOOLEAN NOT NULL DEFAULT false,
  is_active BOOLEAN NOT NULL DEFAULT true,
  date_of_birth DATE,
  address TEXT,
  city TEXT,
  province TEXT,
  postal_code TEXT,
  country TEXT,
  preferred_language TEXT NOT NULL DEFAULT 'fr',
  notifications_enabled BOOLEAN NOT NULL DEFAULT false,
  email_notifications_enabled BOOLEAN NOT NULL DEFAULT false,
  total_enrollments INTEGER NOT NULL DEFAULT 0,
  completed_courses INTEGER NOT NULL DEFAULT 0,
  certificates_earned INTEGER NOT NULL DEFAULT 0,
  total_points INTEGER NOT NULL DEFAULT 0,
  last_login_at TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);
```

### Storage Buckets
```sql
-- Create avatars bucket
INSERT INTO storage.buckets (id, name, public)
VALUES ('avatars', 'avatars', true);

-- Allow authenticated users to upload their own avatars
CREATE POLICY "Users can upload own avatar"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'avatars' AND auth.uid()::text = (storage.foldername(name))[1]);

-- Allow public access to view avatars
CREATE POLICY "Avatars are publicly accessible"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'avatars');
```

## Dependency Injection

All classes are registered with Injectable:

```dart
// Use cases
@lazySingleton
class GetProfileUseCase { ... }

@lazySingleton
class UpdateProfileUseCase { ... }

// Repository
@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl { ... }

// Data source
@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl { ... }
```

## Testing

Example test structure:

```dart
// Unit tests for use cases
test('should update profile with valid data', () async {
  // Arrange
  final params = UpdateProfileParams(
    userId: tUserId,
    fullName: 'Jean Tremblay',
    phone: '+1 514-555-0123',
  );

  when(mockRepository.updateProfile(
    userId: anyNamed('userId'),
    fullName: anyNamed('fullName'),
    phone: anyNamed('phone'),
  )).thenAnswer((_) async => Right(tProfile));

  // Act
  final result = await useCase(params);

  // Assert
  expect(result, Right(tProfile));
  verify(mockRepository.updateProfile(
    userId: tUserId,
    fullName: 'Jean Tremblay',
    phone: '+1 514-555-0123',
  ));
});

test('should return ValidationFailure for invalid postal code', () async {
  // Arrange
  final params = UpdateProfileParams(
    userId: tUserId,
    postalCode: 'INVALID',
  );

  // Act
  final result = await useCase(params);

  // Assert
  expect(result, isA<Left>());
  expect(
    (result as Left).value,
    isA<ValidationFailure>().having(
      (f) => f.code,
      'code',
      'INVALID_POSTAL_CODE',
    ),
  );
});
```

## Related Features

- **Auth**: User authentication and registration
- **Enrollment**: Course enrollments linked to profile stats
- **Courses**: Instructors have profiles
- **Quizzes**: Quiz results contribute to learning stats
