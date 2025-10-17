import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_entity.freezed.dart';

/// Quiz entity representing a quiz in a course
///
/// This is the domain layer representation of a quiz in the Formation Métiers app.
/// Each quiz can be associated with a lesson (lesson quiz) or a course (midterm/final exam).
///
/// Properties:
/// - [id]: Unique identifier (UUID)
/// - [courseId]: ID of the parent course
/// - [lessonId]: ID of the associated lesson (optional, for lesson quizzes)
/// - [title]: Quiz title
/// - [description]: Quiz description
/// - [quizType]: Type of quiz (lesson, midterm, final)
/// - [passingScore]: Minimum score to pass (0-100)
/// - [timeLimit]: Time limit in minutes (optional)
/// - [questionsCount]: Number of questions in the quiz
/// - [maxAttempts]: Maximum number of attempts allowed (optional)
/// - [shuffleQuestions]: Whether to shuffle questions
/// - [shuffleAnswers]: Whether to shuffle answer options
/// - [showCorrectAnswers]: Whether to show correct answers after submission
/// - [isActive]: Whether the quiz is active and available
/// - [createdAt]: Quiz creation timestamp
/// - [updatedAt]: Last update timestamp
@freezed
class QuizEntity with _$QuizEntity {
  const factory QuizEntity({
    required String id,
    required String courseId,
    String? lessonId,
    required String title,
    required String description,
    required QuizType quizType,
    required int passingScore,
    int? timeLimit,
    required int questionsCount,
    int? maxAttempts,
    @Default(true) bool shuffleQuestions,
    @Default(true) bool shuffleAnswers,
    @Default(true) bool showCorrectAnswers,
    @Default(true) bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _QuizEntity;

  const QuizEntity._();

  /// Check if this is a lesson quiz
  bool get isLessonQuiz => lessonId != null && quizType == QuizType.lesson;

  /// Check if this is a midterm exam
  bool get isMidterm => quizType == QuizType.midterm;

  /// Check if this is a final exam
  bool get isFinalExam => quizType == QuizType.finalExam;

  /// Check if the quiz has a time limit
  bool get hasTimeLimit => timeLimit != null && timeLimit! > 0;

  /// Check if the quiz has limited attempts
  bool get hasMaxAttempts => maxAttempts != null && maxAttempts! > 0;

  /// Get formatted time limit (e.g., "30 min" or "1h 30min")
  String get formattedTimeLimit {
    if (timeLimit == null || timeLimit! == 0) return 'Illimité';

    if (timeLimit! < 60) {
      return '$timeLimit min';
    }

    final hours = timeLimit! ~/ 60;
    final minutes = timeLimit! % 60;

    if (minutes == 0) {
      return '$hours h';
    }

    return '$hours h $minutes min';
  }

  /// Get formatted attempts (e.g., "3 tentatives" or "Illimité")
  String get formattedMaxAttempts {
    if (maxAttempts == null || maxAttempts! == 0) return 'Illimité';
    return '$maxAttempts ${maxAttempts! == 1 ? 'tentative' : 'tentatives'}';
  }

  /// Get quiz type display name in French
  String get quizTypeDisplayName {
    switch (quizType) {
      case QuizType.lesson:
        return 'Quiz de leçon';
      case QuizType.midterm:
        return 'Examen de mi-session';
      case QuizType.finalExam:
        return 'Examen final';
    }
  }

  /// Get difficulty indicator based on passing score
  QuizDifficulty get difficulty {
    if (passingScore >= 80) return QuizDifficulty.hard;
    if (passingScore >= 60) return QuizDifficulty.medium;
    return QuizDifficulty.easy;
  }

  /// Get difficulty display name in French
  String get difficultyDisplayName {
    switch (difficulty) {
      case QuizDifficulty.easy:
        return 'Facile';
      case QuizDifficulty.medium:
        return 'Moyen';
      case QuizDifficulty.hard:
        return 'Difficile';
    }
  }
}

/// Quiz type enumeration
///
/// Represents the type of quiz:
/// - [lesson]: Quiz associated with a specific lesson
/// - [midterm]: Midterm exam covering multiple lessons
/// - [finalExam]: Final exam covering the entire course
enum QuizType {
  @JsonValue('lesson')
  lesson,
  @JsonValue('midterm')
  midterm,
  @JsonValue('final')
  finalExam,
}

/// Quiz difficulty enumeration
///
/// Represents the difficulty level based on passing score:
/// - [easy]: Passing score < 60
/// - [medium]: Passing score 60-79
/// - [hard]: Passing score >= 80
enum QuizDifficulty {
  easy,
  medium,
  hard,
}
