# Quiz Feature

## Overview

The Quiz feature provides complete quiz and assessment functionality for the Formation Métiers application. It allows users to take quizzes, submit answers, view results, track progress, and review quiz history. The feature follows Clean Architecture principles with distinct domain, data, and presentation layers.

## Architecture

```
quizzes/
├── domain/
│   ├── entities/
│   │   ├── quiz_entity.dart           # Quiz domain entity
│   │   ├── question_entity.dart       # Question domain entity
│   │   ├── answer_entity.dart         # Answer option entity
│   │   └── quiz_result_entity.dart    # Quiz result entity
│   ├── repositories/
│   │   └── quiz_repository.dart       # Repository interface
│   └── usecases/
│       ├── get_lesson_quiz_usecase.dart
│       ├── get_course_quizzes_usecase.dart
│       ├── submit_quiz_usecase.dart
│       ├── get_quiz_results_usecase.dart
│       └── get_user_quiz_history_usecase.dart
├── data/
│   ├── models/
│   │   ├── quiz_model.dart            # Quiz data model with JSON
│   │   ├── question_model.dart        # Question data model
│   │   ├── answer_model.dart          # Answer data model
│   │   └── quiz_result_model.dart     # Result data model
│   ├── datasources/
│   │   └── quiz_remote_datasource.dart # Supabase implementation
│   └── repositories/
│       └── quiz_repository_impl.dart   # Repository implementation
└── README.md
```

## Features

### ✅ Implemented

- **Quiz Management**: Get quizzes by lesson or course
- **Quiz Types**: Lesson quizzes, midterm exams, final exams
- **Question Types**: Multiple choice, true/false, multiple select
- **Quiz Submission**: Submit answers with automatic scoring
- **Time Tracking**: Track time spent on quizzes
- **Attempt Limits**: Configurable maximum attempts
- **Grading System**: Automatic grade calculation (A+ to F)
- **Quiz History**: View all past attempts
- **Best Score**: Track highest score achieved
- **Shuffle Options**: Randomize questions and answers
- **Explanations**: Show correct answers and explanations
- **Error Handling**: Comprehensive error handling with Either pattern
- **Dependency Injection**: Full GetIt + Injectable integration
- **Logging**: Detailed logging for debugging

### 🔜 Future Enhancements

- Question feedback and comments
- Partial credit for multiple select questions
- Essay/short answer questions
- Quiz analytics and insights
- Peer review for open-ended questions
- Quiz retake recommendations
- Achievement badges

## Domain Layer

### QuizEntity

The core domain entity representing a quiz.

```dart
import 'package:common/common.dart';

final quiz = QuizEntity(
  id: 'quiz-123',
  courseId: 'course-456',
  lessonId: 'lesson-789', // Optional, null for course-level quizzes
  title: 'Quiz: Introduction à l\'électricité',
  description: 'Testez vos connaissances...',
  quizType: QuizType.lesson,
  passingScore: 70,
  timeLimit: 30, // minutes
  questionsCount: 10,
  maxAttempts: 3,
  shuffleQuestions: true,
  shuffleAnswers: true,
  showCorrectAnswers: true,
  isActive: true,
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);

// Helper methods
print(quiz.isLessonQuiz);           // true
print(quiz.isMidterm);              // false
print(quiz.isFinalExam);            // false
print(quiz.hasTimeLimit);           // true
print(quiz.hasMaxAttempts);         // true
print(quiz.formattedTimeLimit);     // '30 min'
print(quiz.formattedMaxAttempts);   // '3 tentatives'
print(quiz.quizTypeDisplayName);    // 'Quiz de leçon'
print(quiz.difficulty);             // QuizDifficulty.medium
print(quiz.difficultyDisplayName);  // 'Moyen'
```

**Quiz Types:**
- `QuizType.lesson` - Quiz de leçon (associated with a lesson)
- `QuizType.midterm` - Examen de mi-session (covers multiple lessons)
- `QuizType.finalExam` - Examen final (covers entire course)

**Quiz Difficulty** (based on passing score):
- Easy: Passing score < 60
- Medium: Passing score 60-79
- Hard: Passing score >= 80

### QuestionEntity

The core domain entity representing a quiz question.

```dart
final question = QuestionEntity(
  id: 'question-123',
  quizId: 'quiz-456',
  questionText: 'Quelle est la tension standard au Canada?',
  questionType: QuestionType.multipleChoice,
  orderIndex: 0,
  points: 1,
  explanation: 'Au Canada, la tension standard est de 120V.',
  imageUrl: 'https://example.com/diagram.jpg',
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);

// Helper methods
print(question.hasImage);              // true
print(question.hasExplanation);        // true
print(question.questionNumber);        // 1 (orderIndex + 1)
print(question.displayTitle);          // 'Question 1'
print(question.isMultipleChoice);      // true
print(question.questionTypeDisplayName); // 'Choix multiple'
print(question.formattedPoints);       // '1 point'
```

**Question Types:**
- `QuestionType.multipleChoice` - Choix multiple (one correct answer)
- `QuestionType.trueFalse` - Vrai ou Faux
- `QuestionType.multipleSelect` - Sélection multiple (multiple correct answers)

### AnswerEntity

The core domain entity representing an answer option.

```dart
final answer = AnswerEntity(
  id: 'answer-123',
  questionId: 'question-456',
  answerText: '120 volts',
  isCorrect: true,
  orderIndex: 0,
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);

// Helper methods
print(answer.optionLabel);   // 'A' (based on orderIndex)
print(answer.displayText);   // 'A. 120 volts'
```

### QuizResultEntity

The core domain entity representing a quiz attempt result.

```dart
final result = QuizResultEntity(
  id: 'result-123',
  quizId: 'quiz-456',
  userId: 'user-789',
  score: 85.5,
  totalQuestions: 10,
  correctAnswers: 9,
  incorrectAnswers: 1,
  timeSpent: 1200, // seconds
  passed: true,
  attemptNumber: 1,
  startedAt: DateTime.now().subtract(Duration(minutes: 20)),
  submittedAt: DateTime.now(),
  createdAt: DateTime.now(),
);

// Helper methods
print(result.formattedScore);        // '85.5%'
print(result.formattedTimeSpent);    // '20:00'
print(result.scorePercentage);       // 86
print(result.unansweredQuestions);   // 0
print(result.hasUnansweredQuestions); // false
print(result.correctPercentage);     // 90.0
print(result.incorrectPercentage);   // 10.0
print(result.grade);                 // QuizGrade.a
print(result.gradeDisplayName);      // 'A'
print(result.statusMessage);         // 'Très bien !'
print(result.attemptDuration);       // Duration(minutes: 20)
```

**Grading Scale:**
- A+: 90-100
- A: 85-89
- A-: 80-84
- B+: 75-79
- B: 70-74
- B-: 65-69
- C+: 60-64
- C: 55-59
- C-: 50-54
- D+: 45-49
- D: 40-44
- F: < 40

### QuizRepository Interface

Defines the contract for quiz operations.

```dart
abstract class QuizRepository {
  Future<Either<Failure, QuizEntity>> getLessonQuiz(String lessonId);

  Future<Either<Failure, List<QuizEntity>>> getCourseQuizzes(String courseId);

  Future<Either<Failure, QuizEntity>> getQuizById(String quizId);

  Future<Either<Failure, List<QuestionEntity>>> getQuizQuestions(String quizId);

  Future<Either<Failure, List<AnswerEntity>>> getQuestionAnswers(String questionId);

  Future<Either<Failure, QuizResultEntity>> submitQuiz({
    required String quizId,
    required String userId,
    required Map<String, List<String>> answers,
    required int timeSpent,
    required DateTime startedAt,
  });

  Future<Either<Failure, QuizResultEntity>> getQuizResultById(String resultId);

  Future<Either<Failure, List<QuizResultEntity>>> getUserQuizResults({
    required String quizId,
    required String userId,
  });

  Future<Either<Failure, List<QuizResultEntity>>> getUserQuizHistory({
    required String userId,
    int? limit,
  });

  Future<Either<Failure, QuizResultEntity>> getBestScore({
    required String quizId,
    required String userId,
  });

  Future<Either<Failure, int>> getUserAttemptCount({
    required String quizId,
    required String userId,
  });
}
```

### Use Cases

#### GetLessonQuizUseCase

Gets the quiz for a specific lesson.

```dart
final getLessonQuizUseCase = getIt<GetLessonQuizUseCase>();

final result = await getLessonQuizUseCase(
  GetLessonQuizParams(lessonId: 'lesson-123'),
);

result.fold(
  (failure) {
    if (failure is NotFoundFailure) {
      print('No quiz for this lesson');
    }
  },
  (quiz) {
    print('Quiz: ${quiz.title}');
    print('Questions: ${quiz.questionsCount}');
    print('Time limit: ${quiz.formattedTimeLimit}');
  },
);
```

#### SubmitQuizUseCase

Submits a quiz with user answers and gets the result.

```dart
final submitQuizUseCase = getIt<SubmitQuizUseCase>();

final answers = {
  'question-1': ['answer-a'],        // Single choice
  'question-2': ['answer-b'],        // True/False
  'question-3': ['answer-a', 'answer-c'], // Multiple select
};

final result = await submitQuizUseCase(
  SubmitQuizParams(
    quizId: 'quiz-123',
    userId: 'user-456',
    answers: answers,
    timeSpent: 1200, // 20 minutes in seconds
    startedAt: startTime,
  ),
);

result.fold(
  (failure) {
    if (failure is AuthorizationFailure) {
      print('Max attempts exceeded');
    } else {
      print('Submission failed: ${failure.message}');
    }
  },
  (quizResult) {
    print('Score: ${quizResult.formattedScore}');
    print('Grade: ${quizResult.gradeDisplayName}');
    print('Status: ${quizResult.statusMessage}');
    print('Passed: ${quizResult.passed}');
  },
);
```

**Validations:**
- Quiz ID not empty
- User ID not empty
- Answers not empty
- Time spent >= 0
- Started at not in the future

**Possible Failures:**
- `ValidationFailure` - Invalid quiz data or answers
- `NotFoundFailure` - Quiz not found
- `AuthorizationFailure` - Max attempts exceeded
- `NetworkFailure` - No internet connection
- `ServerFailure` - Server error
- `DatabaseFailure` - Database error

#### GetUserQuizHistoryUseCase

Gets all quiz attempts for a user across all courses.

```dart
final getUserQuizHistoryUseCase = getIt<GetUserQuizHistoryUseCase>();

final result = await getUserQuizHistoryUseCase(
  GetUserQuizHistoryParams(
    userId: 'user-123',
    limit: 20,
  ),
);

result.fold(
  (failure) => print('Failed to load history'),
  (history) {
    print('Total attempts: ${history.length}');
    for (var attempt in history) {
      print('${attempt.formattedScore} - ${attempt.gradeDisplayName}');
    }
  },
);
```

## Data Layer

### Models

All models support JSON serialization and conversion to/from domain entities:

```dart
// QuizModel
final json = {...};
final model = QuizModel.fromJson(json);
final entity = model.toEntity();
final model2 = QuizModel.fromEntity(entity);

// QuestionModel
final questionModel = QuestionModel.fromJson(json);
final questionEntity = questionModel.toEntity();

// AnswerModel
final answerModel = AnswerModel.fromJson(json);
final answerEntity = answerModel.toEntity();

// QuizResultModel
final resultModel = QuizResultModel.fromJson(json);
final resultEntity = resultModel.toEntity();
```

### QuizRemoteDataSource

Handles all remote quiz operations using Supabase.

**Key Features:**
- Quiz retrieval by lesson/course/ID
- Question and answer fetching
- Quiz submission via Supabase RPC function
- Automatic score calculation
- Max attempts validation
- Quiz history tracking
- Best score retrieval

**Quiz Submission RPC:**

The datasource calls a Supabase RPC function `submit_quiz` that:
1. Validates the quiz and user
2. Checks max attempts limit
3. Calculates the score
4. Determines pass/fail status
5. Creates a quiz_attempts record
6. Returns the result

```dart
final response = await _supabase.rpc('submit_quiz', params: {
  'p_quiz_id': quizId,
  'p_user_id': userId,
  'p_answers': answers,
  'p_time_spent': timeSpent,
  'p_started_at': startedAt.toIso8601String(),
});
```

## Dependency Injection

All quiz components are registered with GetIt using Injectable.

```dart
// In your app initialization
await configureDependencies();

// Use cases
final getLessonQuizUseCase = getIt<GetLessonQuizUseCase>();
final getCourseQuizzesUseCase = getIt<GetCourseQuizzesUseCase>();
final submitQuizUseCase = getIt<SubmitQuizUseCase>();
final getQuizResultsUseCase = getIt<GetQuizResultsUseCase>();
final getUserQuizHistoryUseCase = getIt<GetUserQuizHistoryUseCase>();

// Repository
final quizRepository = getIt<QuizRepository>();
```

**Registered Components:**
- `GetLessonQuizUseCase` - @lazySingleton
- `GetCourseQuizzesUseCase` - @lazySingleton
- `SubmitQuizUseCase` - @lazySingleton
- `GetQuizResultsUseCase` - @lazySingleton
- `GetUserQuizHistoryUseCase` - @lazySingleton
- `QuizRemoteDataSource` - @LazySingleton
- `QuizRepository` - @LazySingleton

## Database Schema

### Quizzes Table

```sql
CREATE TABLE public.quizzes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  course_id UUID REFERENCES public.courses(id) ON DELETE CASCADE NOT NULL,
  lesson_id UUID REFERENCES public.lessons(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  quiz_type TEXT NOT NULL CHECK (quiz_type IN ('lesson', 'midterm', 'final')),
  passing_score INT NOT NULL DEFAULT 70,
  time_limit INT, -- in minutes
  questions_count INT NOT NULL,
  max_attempts INT,
  shuffle_questions BOOLEAN DEFAULT TRUE,
  shuffle_answers BOOLEAN DEFAULT TRUE,
  show_correct_answers BOOLEAN DEFAULT TRUE,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### Quiz Questions Table

```sql
CREATE TABLE public.quiz_questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  quiz_id UUID REFERENCES public.quizzes(id) ON DELETE CASCADE NOT NULL,
  question_text TEXT NOT NULL,
  question_type TEXT NOT NULL CHECK (question_type IN ('multiple_choice', 'true_false', 'multiple_select')),
  order_index INT NOT NULL,
  points INT DEFAULT 1,
  explanation TEXT,
  image_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(quiz_id, order_index)
);
```

### Quiz Answers Table

```sql
CREATE TABLE public.quiz_answers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  question_id UUID REFERENCES public.quiz_questions(id) ON DELETE CASCADE NOT NULL,
  answer_text TEXT NOT NULL,
  is_correct BOOLEAN NOT NULL DEFAULT FALSE,
  order_index INT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(question_id, order_index)
);
```

### Quiz Attempts Table

```sql
CREATE TABLE public.quiz_attempts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  quiz_id UUID REFERENCES public.quizzes(id) ON DELETE CASCADE NOT NULL,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  score DECIMAL(5,2) NOT NULL,
  total_questions INT NOT NULL,
  correct_answers INT NOT NULL,
  incorrect_answers INT NOT NULL,
  time_spent INT NOT NULL, -- in seconds
  passed BOOLEAN NOT NULL,
  attempt_number INT NOT NULL,
  started_at TIMESTAMP WITH TIME ZONE NOT NULL,
  submitted_at TIMESTAMP WITH TIME ZONE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

## Usage Examples

### Taking a Quiz

```dart
class QuizPage extends StatefulWidget {
  final String quizId;

  const QuizPage({required this.quizId});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _quizRepository = getIt<QuizRepository>();
  final _submitQuizUseCase = getIt<SubmitQuizUseCase>();

  QuizEntity? _quiz;
  List<QuestionEntity> _questions = [];
  Map<String, List<AnswerEntity>> _answers = {};
  Map<String, List<String>> _selectedAnswers = {};
  DateTime? _startTime;

  @override
  void initState() {
    super.initState();
    _loadQuiz();
  }

  Future<void> _loadQuiz() async {
    _startTime = DateTime.now();

    // Load quiz
    final quizResult = await _quizRepository.getQuizById(widget.quizId);
    quizResult.fold(
      (failure) => _showError(failure.message),
      (quiz) => setState(() => _quiz = quiz),
    );

    // Load questions
    final questionsResult = await _quizRepository.getQuizQuestions(widget.quizId);
    questionsResult.fold(
      (failure) => _showError(failure.message),
      (questions) async {
        setState(() => _questions = questions);

        // Load answers for each question
        for (var question in questions) {
          final answersResult = await _quizRepository.getQuestionAnswers(question.id);
          answersResult.fold(
            (failure) => _showError(failure.message),
            (answers) {
              setState(() {
                _answers[question.id] = answers;
                _selectedAnswers[question.id] = [];
              });
            },
          );
        }
      },
    );
  }

  Future<void> _submitQuiz() async {
    final timeSpent = DateTime.now().difference(_startTime!).inSeconds;

    final result = await _submitQuizUseCase(
      SubmitQuizParams(
        quizId: widget.quizId,
        userId: currentUserId,
        answers: _selectedAnswers,
        timeSpent: timeSpent,
        startedAt: _startTime!,
      ),
    );

    result.fold(
      (failure) => _showError(failure.message),
      (quizResult) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => QuizResultPage(result: quizResult),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_quiz == null || _questions.isEmpty) {
      return CircularProgressIndicator();
    }

    return Scaffold(
      appBar: AppBar(title: Text(_quiz!.title)),
      body: ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          final question = _questions[index];
          final answers = _answers[question.id] ?? [];

          return QuizQuestionCard(
            question: question,
            answers: answers,
            selectedAnswers: _selectedAnswers[question.id] ?? [],
            onAnswerSelected: (answerId) {
              setState(() {
                if (question.isMultipleSelect) {
                  if (_selectedAnswers[question.id]!.contains(answerId)) {
                    _selectedAnswers[question.id]!.remove(answerId);
                  } else {
                    _selectedAnswers[question.id]!.add(answerId);
                  }
                } else {
                  _selectedAnswers[question.id] = [answerId];
                }
              });
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: FilledButton(
          onPressed: _submitQuiz,
          child: const Text('SOUMETTRE'),
        ),
      ),
    );
  }
}
```

### Quiz Results Display

```dart
class QuizResultPage extends StatelessWidget {
  final QuizResultEntity result;

  const QuizResultPage({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Résultat du quiz')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Grade display
            Text(
              result.gradeDisplayName,
              style: AppTypography.displayLarge.copyWith(
                color: result.passed ? AppColors.success : AppColors.error,
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Score
            Text(
              result.formattedScore,
              style: AppTypography.headlineLarge,
            ),

            // Status message
            Text(
              result.statusMessage,
              style: AppTypography.titleMedium.copyWith(
                color: result.passed ? AppColors.success : AppColors.error,
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            // Stats
            _buildStatRow('Bonnes réponses', '${result.correctAnswers}'),
            _buildStatRow('Mauvaises réponses', '${result.incorrectAnswers}'),
            _buildStatRow('Temps passé', result.formattedTimeSpent),
            _buildStatRow('Tentative', '#${result.attemptNumber}'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$label: ', style: AppTypography.bodyMedium),
          Text(value, style: AppTypography.bodyMedium.copyWith(
            fontWeight: AppTypography.bold,
          )),
        ],
      ),
    );
  }
}
```

### Quiz History

```dart
class QuizHistoryPage extends StatelessWidget {
  final _getUserQuizHistoryUseCase = getIt<GetUserQuizHistoryUseCase>();

  Future<void> _loadHistory(String userId) async {
    final result = await _getUserQuizHistoryUseCase(
      GetUserQuizHistoryParams(
        userId: userId,
        limit: 50,
      ),
    );

    result.fold(
      (failure) => print('Failed to load history'),
      (history) {
        // Display history
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historique des quiz')),
      body: FutureBuilder<Either<Failure, List<QuizResultEntity>>>(
        future: _getUserQuizHistoryUseCase(
          GetUserQuizHistoryParams(userId: currentUserId),
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          return snapshot.data!.fold(
            (failure) => Text('Erreur: ${failure.message}'),
            (history) => ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final result = history[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(result.gradeDisplayName),
                    backgroundColor: result.passed
                        ? AppColors.success
                        : AppColors.error,
                  ),
                  title: Text(result.formattedScore),
                  subtitle: Text(
                    'Tentative #${result.attemptNumber} - ${result.formattedTimeSpent}',
                  ),
                  trailing: Text(result.statusMessage),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
```

## Best Practices

### 1. Always Validate Before Submission

```dart
// ✅ Good - validates all required data
bool canSubmit() {
  return _selectedAnswers.values.every((answers) => answers.isNotEmpty);
}

// ❌ Bad - submits without validation
void submit() {
  submitQuizUseCase(params); // May fail if answers incomplete
}
```

### 2. Track Time Accurately

```dart
// ✅ Good - tracks start time and calculates duration
DateTime _startTime = DateTime.now();

void submit() {
  final timeSpent = DateTime.now().difference(_startTime).inSeconds;
  // ...
}

// ❌ Bad - hardcoded or estimated time
void submit() {
  final timeSpent = 1800; // Not accurate
}
```

### 3. Handle Max Attempts

```dart
// ✅ Good - checks attempt count before starting
Future<void> startQuiz() async {
  final countResult = await quizRepository.getUserAttemptCount(
    quizId: quizId,
    userId: userId,
  );

  countResult.fold(
    (failure) => showError(failure),
    (count) {
      if (quiz.hasMaxAttempts && count >= quiz.maxAttempts!) {
        showError('Nombre maximum de tentatives atteint');
      } else {
        proceedToQuiz();
      }
    },
  );
}
```

### 4. Show Progress Feedback

```dart
// ✅ Good - shows loading and progress states
class QuizSubmissionState {
  bool isSubmitting = false;
  double progress = 0.0;

  Future<void> submit() async {
    setState(() => isSubmitting = true);

    final result = await submitQuizUseCase(params);

    setState(() => isSubmitting = false);

    // Handle result...
  }
}
```

## Troubleshooting

### Common Issues

**Issue: "Max attempts exceeded" error**
- Check quiz.maxAttempts setting
- Verify attempt count is accurate
- Consider allowing instructors to reset attempts

**Issue: Score calculation incorrect**
- Verify all answers are submitted
- Check question points configuration
- Review Supabase RPC function logic

**Issue: Quiz not found for lesson**
- Verify quiz.lessonId matches lesson ID
- Check quiz.isActive is true
- Ensure quiz exists in database

**Issue: Time limit not enforced**
- Implement client-side timer
- Add server-side validation
- Handle time expiration gracefully

## Related Documentation

- [Core Error Handling](../../core/error/README.md)
- [Dependency Injection](../../core/di/README.md)
- [Course Feature](../courses/README.md)
- [Authentication Feature](../auth/README.md)

## Support

For issues or questions:
1. Check Supabase documentation: https://supabase.com/docs
2. Review Clean Architecture patterns
3. Check application logs using AppLogger
