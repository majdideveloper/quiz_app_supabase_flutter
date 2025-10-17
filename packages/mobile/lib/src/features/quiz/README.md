# Quiz Feature - Mobile Package

## Overview

The Quiz feature allows users to take quizzes associated with courses or lessons. It includes timer management, answer tracking, submission, and detailed results review.

## Architecture

### BLoC Pattern with Freezed

The quiz feature uses the BLoC pattern with Freezed for type-safe events and states.

**Files:**
- `bloc/quiz_bloc.dart` - Main BLoC logic
- `bloc/quiz_event.dart` - Freezed events
- `bloc/quiz_state.dart` - Freezed states

### Pages

1. **QuizPage** (`pages/quiz_page.dart`)
   - Quiz introduction screen
   - In-progress quiz with question navigation
   - Quick results display
   - Uses BlocProvider and BlocConsumer

2. **QuizResultPage** (`pages/quiz_result_page.dart`)
   - Detailed results summary
   - Answer review mode
   - Retake quiz option

### Widgets

1. **QuestionWidget** (`widgets/question_widget.dart`)
   - Displays questions with answers
   - Handles answer selection
   - Shows correct/incorrect answers in review mode
   - Supports question images and explanations

2. **QuizTimer** (`widgets/quiz_timer.dart`)
   - Countdown timer display
   - Color-coded based on remaining time:
     - Red: < 1 minute
     - Orange: < 25% of total time
     - Blue: Normal

## Quiz Flow

### 1. Quiz Introduction
```dart
// Load quiz by ID
context.read<QuizBloc>().add(QuizEvent.loadQuiz(quizId));

// State: QuizState.quizLoaded
// Displays:
// - Quiz title and description
// - Number of questions
// - Time limit
// - Passing score
// - Max attempts
```

### 2. Start Quiz
```dart
// Start quiz
context.read<QuizBloc>().add(const QuizEvent.startQuiz());

// State: QuizState.quizInProgress
// - Initializes timer (if quiz has time limit)
// - Tracks answers in Map<String, List<String>>
// - Manages current question index
```

### 3. Answer Questions
```dart
// Answer a question
context.read<QuizBloc>().add(
  QuizEvent.answerQuestion(
    questionId: question.id,
    selectedAnswerIds: ['answer-id-1', 'answer-id-2'], // For multiple choice
  ),
);

// For single choice: ['answer-id']
// For multiple choice: ['answer-id-1', 'answer-id-2', ...]
```

### 4. Submit Quiz
```dart
// Manual submit
context.read<QuizBloc>().add(const QuizEvent.submitQuiz());

// Auto-submit when timer expires
// - Timer automatically triggers submitQuiz event
// - Calculates time spent
// - Sends answers to backend
```

### 5. View Results
```dart
// State: QuizState.quizSubmitted
// Navigate to QuizResultPage with result data
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => QuizResultPage(
      result: result,
      quiz: quiz,
      questions: questions,
      userAnswers: userAnswers,
    ),
  ),
);
```

## Quiz BLoC

### Events

```dart
@freezed
class QuizEvent with _$QuizEvent {
  // Load quiz with questions
  const factory QuizEvent.loadQuiz(String quizId) = LoadQuizEvent;

  // Start quiz (initializes timer and state)
  const factory QuizEvent.startQuiz() = StartQuizEvent;

  // Answer a question
  const factory QuizEvent.answerQuestion({
    required String questionId,
    required List<String> selectedAnswerIds,
  }) = AnswerQuestionEvent;

  // Submit quiz for grading
  const factory QuizEvent.submitQuiz() = SubmitQuizEvent;

  // Load existing quiz result
  const factory QuizEvent.loadQuizResult(String resultId) = LoadQuizResultEvent;
}
```

### States

```dart
@freezed
class QuizState with _$QuizState {
  // Initial state
  const factory QuizState.initial() = QuizInitial;

  // Loading quiz or submitting
  const factory QuizState.loading() = QuizLoading;

  // Quiz loaded, showing intro
  const factory QuizState.quizLoaded({
    required QuizEntity quiz,
    required List<QuestionEntity> questions,
  }) = QuizLoaded;

  // Quiz in progress
  const factory QuizState.quizInProgress({
    required QuizEntity quiz,
    required List<QuestionEntity> questions,
    required Map<String, List<String>> answers,
    required int currentQuestionIndex,
    required DateTime startTime,
    int? timeRemaining, // in seconds
  }) = QuizInProgress;

  // Quiz submitted, showing results
  const factory QuizState.quizSubmitted({
    required QuizResultEntity result,
    required QuizEntity quiz,
    required List<QuestionEntity> questions,
    required Map<String, List<String>> userAnswers,
  }) = QuizSubmitted;

  // Error state
  const factory QuizState.error({
    required String message,
  }) = QuizError;
}
```

## Timer Management

The QuizBloc manages a countdown timer for timed quizzes:

```dart
// Start timer when quiz starts
void _startTimer(int totalSeconds) {
  _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    // Update timeRemaining in state
    // Auto-submit when time expires
  });
}

// Cancel timer on BLoC close
@override
Future<void> close() {
  _timer?.cancel();
  return super.close();
}
```

## Question Types

### Single Choice
- User can select only one answer
- Previous selection is replaced

```dart
// In QuestionWidget
if (question.questionType == QuestionType.singleChoice) {
  onAnswerSelected([answerId]); // Single item list
}
```

### Multiple Choice
- User can select multiple answers
- Toggle selection on/off

```dart
if (question.questionType == QuestionType.multipleChoice) {
  final newSelection = List<String>.from(selectedAnswerIds);
  if (newSelection.contains(answerId)) {
    newSelection.remove(answerId);
  } else {
    newSelection.add(answerId);
  }
  onAnswerSelected(newSelection);
}
```

### True/False
- Special case of single choice
- Only two answers

## Answer Review

The QuestionWidget supports review mode to show correct answers:

```dart
QuestionWidget(
  question: question,
  answers: question.answers,
  selectedAnswerIds: userAnswers[question.id] ?? [],
  onAnswerSelected: (_) {}, // No-op in review mode
  showCorrectAnswers: true,  // Show correct/incorrect indicators
  isReview: true,            // Disable interactions, show explanations
)
```

**Visual Indicators:**
- ✓ Green border and check icon for correct answers
- ✗ Red border and cancel icon for incorrect selected answers
- Explanation box shown below answers (if available)

## Navigation

### Quiz Routes

```dart
// Route to quiz page
GoRoute(
  path: 'quizzes/:quizId',
  name: 'quiz',
  builder: (context, state) {
    final quizId = state.pathParameters['quizId']!;
    return QuizPage(quizId: quizId);
  },
),

// From course detail or lesson page
context.goNamed('quiz', pathParameters: {'quizId': quiz.id});
```

### Navigation Flow

1. Course Detail → Quiz List → Quiz Page
2. Lesson Page → Quiz Page (if lesson has quiz)
3. Quiz Page → Quiz Result Page (after submission)
4. Quiz Result Page → Back to Course Detail

## Use Cases

The QuizBloc uses the following use cases from the common package:

1. **GetLessonQuizUseCase**
   - Loads quiz for a specific lesson
   - Returns quiz with questions

2. **GetCourseQuizzesUseCase**
   - Loads all quizzes for a course
   - Used in course detail page

3. **SubmitQuizUseCase**
   - Submits quiz answers for grading
   - Accepts: quizId, answers map, timeSpent
   - Returns: QuizResultEntity

4. **GetQuizResultsUseCase**
   - Loads quiz attempt history
   - Used for viewing past results

## Entities

### QuizEntity
```dart
class QuizEntity {
  final String id;
  final String title;
  final String description;
  final int? timeLimit; // in seconds
  final int passingScore; // percentage
  final int? maxAttempts;
  final bool isPublished;
  // ...
}
```

### QuestionEntity
```dart
class QuestionEntity {
  final String id;
  final String quizId;
  final QuestionType questionType; // singleChoice, multipleChoice, trueFalse
  final String questionText;
  final String? imageUrl;
  final int points;
  final String? explanation;
  final List<AnswerEntity> answers;
  // ...
}
```

### AnswerEntity
```dart
class AnswerEntity {
  final String id;
  final String questionId;
  final String answerText;
  final bool isCorrect;
  // ...
}
```

### QuizResultEntity
```dart
class QuizResultEntity {
  final String id;
  final String quizId;
  final String userId;
  final double score; // percentage
  final int correctAnswers;
  final int totalQuestions;
  final int timeSpent; // in seconds
  final bool passed;
  // ...
}
```

## Error Handling

```dart
// In QuizPage BlocConsumer
BlocConsumer<QuizBloc, QuizState>(
  listener: (context, state) {
    state.whenOrNull(
      error: (message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      },
    );
  },
  builder: (context, state) {
    return state.when(
      error: (message) => _buildErrorState(context, message),
      // ... other states
    );
  },
)
```

## Testing

### Unit Tests

```dart
// Test QuizBloc events
test('should emit QuizLoaded when LoadQuiz succeeds', () async {
  // Arrange
  when(() => mockGetLessonQuizUseCase(any()))
      .thenAnswer((_) async => Right(quizWithQuestions));

  // Act
  bloc.add(QuizEvent.loadQuiz('quiz-1'));

  // Assert
  await expectLater(
    bloc.stream,
    emitsInOrder([
      const QuizState.loading(),
      QuizState.quizLoaded(quiz: quiz, questions: questions),
    ]),
  );
});
```

### Widget Tests

```dart
testWidgets('QuestionWidget displays question and answers', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: QuestionWidget(
          question: mockQuestion,
          answers: mockAnswers,
          selectedAnswerIds: [],
          onAnswerSelected: (_) {},
        ),
      ),
    ),
  );

  expect(find.text(mockQuestion.questionText), findsOneWidget);
  expect(find.text(mockAnswers[0].answerText), findsOneWidget);
});
```

## Integration Example

Complete example of quiz feature integration:

```dart
class CourseDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(course.title),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Lessons'),
              Tab(text: 'Quizzes'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LessonsTab(lessons: lessons),
            QuizzesTab(quizzes: quizzes),
          ],
        ),
      ),
    );
  }
}

class QuizzesTab extends StatelessWidget {
  final List<QuizEntity> quizzes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quizzes.length,
      itemBuilder: (context, index) {
        final quiz = quizzes[index];
        return ListTile(
          title: Text(quiz.title),
          subtitle: Text(quiz.description),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            // Navigate to quiz
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizPage(quizId: quiz.id),
              ),
            );
          },
        );
      },
    );
  }
}
```

## Future Enhancements

1. **Offline Support**
   - Cache quiz questions for offline taking
   - Queue submissions for when online

2. **Analytics**
   - Track time spent per question
   - Identify difficult questions
   - Performance over time

3. **Rich Question Types**
   - Fill in the blank
   - Drag and drop
   - Code snippets with syntax highlighting

4. **Adaptive Learning**
   - Adjust difficulty based on performance
   - Recommend related quizzes

5. **Social Features**
   - Leaderboards
   - Compare scores with peers
   - Share achievements
