// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../../common.dart' as _i607;
import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/get_current_user_usecase.dart'
    as _i17;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/courses/data/datasources/course_remote_datasource.dart'
    as _i888;
import '../../features/courses/data/repositories/course_repository_impl.dart'
    as _i657;
import '../../features/courses/domain/repositories/course_repository.dart'
    as _i749;
import '../../features/courses/domain/usecases/filter_courses_usecase.dart'
    as _i702;
import '../../features/courses/domain/usecases/get_course_by_id_usecase.dart'
    as _i876;
import '../../features/courses/domain/usecases/get_course_lessons_usecase.dart'
    as _i1055;
import '../../features/courses/domain/usecases/get_courses_usecase.dart'
    as _i50;
import '../../features/courses/domain/usecases/search_courses_usecase.dart'
    as _i1061;
import '../../features/courses/presentation/bloc/course_bloc.dart' as _i63;
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart'
    as _i652;
import '../../features/enrollment/data/datasources/enrollment_remote_datasource.dart'
    as _i517;
import '../../features/enrollment/data/repositories/enrollment_repository_impl.dart'
    as _i752;
import '../../features/enrollment/domain/repositories/enrollment_repository.dart'
    as _i149;
import '../../features/enrollment/domain/usecases/enroll_in_course_usecase.dart'
    as _i740;
import '../../features/enrollment/domain/usecases/get_user_enrollments_usecase.dart'
    as _i676;
import '../../features/enrollment/domain/usecases/update_lesson_progress_usecase.dart'
    as _i913;
import '../../features/profile/data/datasources/profile_remote_datasource.dart'
    as _i327;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i334;
import '../../features/profile/domain/repositories/profile_repository.dart'
    as _i894;
import '../../features/profile/domain/usecases/get_profile_usecase.dart'
    as _i965;
import '../../features/profile/domain/usecases/update_profile_usecase.dart'
    as _i478;
import '../../features/quizzes/data/datasources/quiz_remote_datasource.dart'
    as _i413;
import '../../features/quizzes/data/repositories/quiz_repository_impl.dart'
    as _i983;
import '../../features/quizzes/domain/repositories/quiz_repository.dart'
    as _i950;
import '../../features/quizzes/domain/usecases/get_course_quizzes_usecase.dart'
    as _i945;
import '../../features/quizzes/domain/usecases/get_lesson_quiz_usecase.dart'
    as _i477;
import '../../features/quizzes/domain/usecases/get_quiz_results_usecase.dart'
    as _i95;
import '../../features/quizzes/domain/usecases/get_user_quiz_history_usecase.dart'
    as _i883;
import '../../features/quizzes/domain/usecases/submit_quiz_usecase.dart'
    as _i122;
import '../../features/quizzes/presentation/bloc/quiz_bloc.dart' as _i51;
import 'injection_container.dart' as _i809;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.lazySingleton<_i888.CourseRemoteDataSource>(
      () => _i888.CourseRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i327.ProfileRemoteDataSource>(
      () => _i327.ProfileRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i894.ProfileRepository>(
      () => _i334.ProfileRepositoryImpl(gh<_i327.ProfileRemoteDataSource>()),
    );
    gh.lazySingleton<_i478.UpdateProfileUseCase>(
      () => _i478.UpdateProfileUseCase(gh<_i894.ProfileRepository>()),
    );
    gh.lazySingleton<_i965.GetProfileUseCase>(
      () => _i965.GetProfileUseCase(gh<_i894.ProfileRepository>()),
    );
    gh.lazySingleton<_i517.EnrollmentRemoteDataSource>(
      () => _i517.EnrollmentRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i161.AuthRemoteDataSource>(
      () => _i161.AuthRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i413.QuizRemoteDataSource>(
      () => _i413.QuizRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i749.CourseRepository>(
      () => _i657.CourseRepositoryImpl(gh<_i888.CourseRemoteDataSource>()),
    );
    gh.lazySingleton<_i149.EnrollmentRepository>(
      () => _i752.EnrollmentRepositoryImpl(
        gh<_i517.EnrollmentRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i950.QuizRepository>(
      () => _i983.QuizRepositoryImpl(gh<_i413.QuizRemoteDataSource>()),
    );
    gh.lazySingleton<_i122.SubmitQuizUseCase>(
      () => _i122.SubmitQuizUseCase(gh<_i950.QuizRepository>()),
    );
    gh.lazySingleton<_i477.GetLessonQuizUseCase>(
      () => _i477.GetLessonQuizUseCase(gh<_i950.QuizRepository>()),
    );
    gh.lazySingleton<_i95.GetQuizResultsUseCase>(
      () => _i95.GetQuizResultsUseCase(gh<_i950.QuizRepository>()),
    );
    gh.lazySingleton<_i883.GetUserQuizHistoryUseCase>(
      () => _i883.GetUserQuizHistoryUseCase(gh<_i950.QuizRepository>()),
    );
    gh.lazySingleton<_i945.GetCourseQuizzesUseCase>(
      () => _i945.GetCourseQuizzesUseCase(gh<_i950.QuizRepository>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(gh<_i161.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i876.GetCourseByIdUseCase>(
      () => _i876.GetCourseByIdUseCase(gh<_i749.CourseRepository>()),
    );
    gh.lazySingleton<_i1061.SearchCoursesUseCase>(
      () => _i1061.SearchCoursesUseCase(gh<_i749.CourseRepository>()),
    );
    gh.lazySingleton<_i1055.GetCourseLessonsUseCase>(
      () => _i1055.GetCourseLessonsUseCase(gh<_i749.CourseRepository>()),
    );
    gh.lazySingleton<_i50.GetCoursesUseCase>(
      () => _i50.GetCoursesUseCase(gh<_i749.CourseRepository>()),
    );
    gh.lazySingleton<_i702.FilterCoursesUseCase>(
      () => _i702.FilterCoursesUseCase(gh<_i749.CourseRepository>()),
    );
    gh.lazySingleton<_i913.UpdateLessonProgressUseCase>(
      () => _i913.UpdateLessonProgressUseCase(gh<_i149.EnrollmentRepository>()),
    );
    gh.lazySingleton<_i740.EnrollInCourseUseCase>(
      () => _i740.EnrollInCourseUseCase(gh<_i149.EnrollmentRepository>()),
    );
    gh.lazySingleton<_i676.GetUserEnrollmentsUseCase>(
      () => _i676.GetUserEnrollmentsUseCase(gh<_i149.EnrollmentRepository>()),
    );
    gh.factory<_i652.DashboardBloc>(
      () => _i652.DashboardBloc(
        gh<_i607.GetProfileUseCase>(),
        gh<_i607.GetUserEnrollmentsUseCase>(),
      ),
    );
    gh.lazySingleton<_i941.RegisterUseCase>(
      () => _i941.RegisterUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i48.LogoutUseCase>(
      () => _i48.LogoutUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i17.GetCurrentUserUseCase>(
      () => _i17.GetCurrentUserUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        loginUseCase: gh<_i607.LoginUseCase>(),
        registerUseCase: gh<_i607.RegisterUseCase>(),
        logoutUseCase: gh<_i607.LogoutUseCase>(),
        getCurrentUserUseCase: gh<_i607.GetCurrentUserUseCase>(),
      ),
    );
    gh.factory<_i63.CourseBloc>(
      () => _i63.CourseBloc(
        gh<_i607.GetCoursesUseCase>(),
        gh<_i607.GetCourseByIdUseCase>(),
        gh<_i607.GetCourseLessonsUseCase>(),
        gh<_i607.SearchCoursesUseCase>(),
        gh<_i607.FilterCoursesUseCase>(),
      ),
    );
    gh.factory<_i51.QuizBloc>(
      () => _i51.QuizBloc(
        gh<_i607.SubmitQuizUseCase>(),
        gh<_i607.QuizRepository>(),
        gh<_i607.GetCurrentUserUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i809.RegisterModule {}
