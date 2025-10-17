import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/answer_entity.dart';
import '../entities/question_entity.dart';
import '../entities/quiz_entity.dart';
import '../entities/quiz_result_entity.dart';

/// Quiz repository interface
///
/// This interface defines the contract for quiz-related data operations in the domain layer.
/// Implementations should handle all quiz, question, answer, and result operations
/// and return Either for proper error handling.
///
/// All methods return Either<Failure, T> where:
/// - Left: Contains a Failure object describing what went wrong
/// - Right: Contains the successful result
abstract class QuizRepository {
  /// Get quiz for a specific lesson
  ///
  /// Returns the quiz associated with a lesson.
  ///
  /// Parameters:
  /// - [lessonId]: The lesson ID
  ///
  /// Possible failures:
  /// - [NotFoundFailure]: Quiz not found for this lesson
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, QuizEntity>> getLessonQuiz(String lessonId);

  /// Get all quizzes for a course
  ///
  /// Returns all quizzes (lesson, midterm, final) for a course.
  ///
  /// Parameters:
  /// - [courseId]: The course ID
  ///
  /// Possible failures:
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, List<QuizEntity>>> getCourseQuizzes(String courseId);

  /// Get quiz by ID with questions and answers
  ///
  /// Returns a quiz with all its questions and answer options.
  ///
  /// Parameters:
  /// - [quizId]: The quiz ID
  ///
  /// Possible failures:
  /// - [NotFoundFailure]: Quiz not found
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, QuizEntity>> getQuizById(String quizId);

  /// Get questions for a quiz
  ///
  /// Returns all questions for a quiz, ordered by orderIndex.
  ///
  /// Parameters:
  /// - [quizId]: The quiz ID
  ///
  /// Possible failures:
  /// - [NotFoundFailure]: Quiz not found
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, List<QuestionEntity>>> getQuizQuestions(String quizId);

  /// Get answers for a question
  ///
  /// Returns all answer options for a question, ordered by orderIndex.
  ///
  /// Parameters:
  /// - [questionId]: The question ID
  ///
  /// Possible failures:
  /// - [NotFoundFailure]: Question not found
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, List<AnswerEntity>>> getQuestionAnswers(
    String questionId,
  );

  /// Submit quiz attempt
  ///
  /// Submits a user's quiz attempt and calculates the result.
  ///
  /// Parameters:
  /// - [quizId]: The quiz ID
  /// - [userId]: The user ID
  /// - [answers]: Map of question ID to selected answer ID(s)
  /// - [timeSpent]: Time spent in seconds
  /// - [startedAt]: When the quiz was started
  ///
  /// Possible failures:
  /// - [NotFoundFailure]: Quiz not found
  /// - [ValidationFailure]: Invalid answers or attempt data
  /// - [AuthorizationFailure]: Max attempts exceeded
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database error
  Future<Either<Failure, QuizResultEntity>> submitQuiz({
    required String quizId,
    required String userId,
    required Map<String, List<String>> answers,
    required int timeSpent,
    required DateTime startedAt,
  });

  /// Get quiz result by ID
  ///
  /// Returns a specific quiz result.
  ///
  /// Parameters:
  /// - [resultId]: The quiz result ID
  ///
  /// Possible failures:
  /// - [NotFoundFailure]: Result not found
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, QuizResultEntity>> getQuizResultById(String resultId);

  /// Get user's quiz results for a specific quiz
  ///
  /// Returns all attempts by a user for a specific quiz.
  ///
  /// Parameters:
  /// - [quizId]: The quiz ID
  /// - [userId]: The user ID
  ///
  /// Possible failures:
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, List<QuizResultEntity>>> getUserQuizResults({
    required String quizId,
    required String userId,
  });

  /// Get user's quiz history
  ///
  /// Returns all quiz attempts by a user across all courses.
  ///
  /// Parameters:
  /// - [userId]: The user ID
  /// - [limit]: Maximum number of results to return (optional)
  ///
  /// Possible failures:
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, List<QuizResultEntity>>> getUserQuizHistory({
    required String userId,
    int? limit,
  });

  /// Get best score for a user on a quiz
  ///
  /// Returns the highest scoring attempt for a user on a specific quiz.
  ///
  /// Parameters:
  /// - [quizId]: The quiz ID
  /// - [userId]: The user ID
  ///
  /// Possible failures:
  /// - [NotFoundFailure]: No attempts found
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, QuizResultEntity>> getBestScore({
    required String quizId,
    required String userId,
  });

  /// Get number of attempts for a user on a quiz
  ///
  /// Returns the count of attempts a user has made on a specific quiz.
  ///
  /// Parameters:
  /// - [quizId]: The quiz ID
  /// - [userId]: The user ID
  ///
  /// Possible failures:
  /// - [NetworkFailure]: No internet connection
  /// - [ServerFailure]: Server error
  /// - [DatabaseFailure]: Database query error
  Future<Either<Failure, int>> getUserAttemptCount({
    required String quizId,
    required String userId,
  });
}
