import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'admin_event.dart';
import 'admin_state.dart';
import '../../domain/entities/admin_stats_entity.dart';

@injectable
class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(const AdminState.initial()) {
    on<LoadDashboardStats>(_onLoadDashboardStats);
    on<LoadAllUsers>(_onLoadAllUsers);
    on<LoadAllCourses>(_onLoadAllCourses);
    on<LoadAllQuizzes>(_onLoadAllQuizzes);
    on<ToggleUserStatus>(_onToggleUserStatus);
    on<DeleteUser>(_onDeleteUser);
    on<ToggleCoursePublished>(_onToggleCoursePublished);
    on<DeleteCourse>(_onDeleteCourse);
    on<ToggleQuizPublished>(_onToggleQuizPublished);
    on<DeleteQuiz>(_onDeleteQuiz);
  }

  Future<void> _onLoadDashboardStats(
    LoadDashboardStats event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(const AdminState.loading());

      // TODO: Remplacer par des vraies données depuis le repository
      await Future.delayed(const Duration(seconds: 1));

      const stats = AdminStatsEntity(
        totalUsers: 150,
        totalCourses: 25,
        totalQuizzes: 80,
        totalEnrollments: 320,
        activeUsers: 120,
        publishedCourses: 20,
        completedQuizzes: 245,
        averageQuizScore: 78.5,
      );

      emit(AdminState.dashboardLoaded(stats: stats));
    } catch (e) {
      emit(AdminState.error(e.toString()));
    }
  }

  Future<void> _onLoadAllUsers(
    LoadAllUsers event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(const AdminState.loading());

      // TODO: Charger depuis le repository
      await Future.delayed(const Duration(seconds: 1));

      emit(const AdminState.usersLoaded(users: []));
    } catch (e) {
      emit(AdminState.error(e.toString()));
    }
  }

  Future<void> _onLoadAllCourses(
    LoadAllCourses event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(const AdminState.loading());

      // TODO: Charger depuis le repository
      await Future.delayed(const Duration(seconds: 1));

      emit(const AdminState.coursesLoaded(courses: []));
    } catch (e) {
      emit(AdminState.error(e.toString()));
    }
  }

  Future<void> _onLoadAllQuizzes(
    LoadAllQuizzes event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(const AdminState.loading());

      // TODO: Charger depuis le repository
      await Future.delayed(const Duration(seconds: 1));

      emit(const AdminState.quizzesLoaded(quizzes: []));
    } catch (e) {
      emit(AdminState.error(e.toString()));
    }
  }

  Future<void> _onToggleUserStatus(
    ToggleUserStatus event,
    Emitter<AdminState> emit,
  ) async {
    try {
      // TODO: Mettre à jour le statut utilisateur
      // Puis recharger la liste
      add(const LoadAllUsers());
    } catch (e) {
      emit(AdminState.error(e.toString()));
    }
  }

  Future<void> _onDeleteUser(
    DeleteUser event,
    Emitter<AdminState> emit,
  ) async {
    try {
      // TODO: Supprimer l'utilisateur
      // Puis recharger la liste
      add(const LoadAllUsers());
    } catch (e) {
      emit(AdminState.error(e.toString()));
    }
  }

  Future<void> _onToggleCoursePublished(
    ToggleCoursePublished event,
    Emitter<AdminState> emit,
  ) async {
    try {
      // TODO: Mettre à jour le statut publié du cours
      add(const LoadAllCourses());
    } catch (e) {
      emit(AdminState.error(e.toString()));
    }
  }

  Future<void> _onDeleteCourse(
    DeleteCourse event,
    Emitter<AdminState> emit,
  ) async {
    try {
      // TODO: Supprimer le cours
      add(const LoadAllCourses());
    } catch (e) {
      emit(AdminState.error(e.toString()));
    }
  }

  Future<void> _onToggleQuizPublished(
    ToggleQuizPublished event,
    Emitter<AdminState> emit,
  ) async {
    try {
      // TODO: Mettre à jour le statut publié du quiz
      add(const LoadAllQuizzes());
    } catch (e) {
      emit(AdminState.error(e.toString()));
    }
  }

  Future<void> _onDeleteQuiz(
    DeleteQuiz event,
    Emitter<AdminState> emit,
  ) async {
    try {
      // TODO: Supprimer le quiz
      add(const LoadAllQuizzes());
    } catch (e) {
      emit(AdminState.error(e.toString()));
    }
  }
}
