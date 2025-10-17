// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:common/common.dart' as _i107;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        loginUseCase: gh<_i107.LoginUseCase>(),
        registerUseCase: gh<_i107.RegisterUseCase>(),
        logoutUseCase: gh<_i107.LogoutUseCase>(),
        getCurrentUserUseCase: gh<_i107.GetCurrentUserUseCase>(),
      ),
    );
    return this;
  }
}
