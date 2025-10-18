// Profile feature exports

// Import UserRole from auth (shared enum)
export '../auth/domain/entities/user_entity.dart' show UserRole;

// Domain layer
export 'domain/entities/profile_entity.dart';
export 'domain/repositories/profile_repository.dart';
export 'domain/usecases/get_profile_usecase.dart';
export 'domain/usecases/update_profile_usecase.dart';
export 'domain/usecases/upload_avatar_usecase.dart';
export 'domain/usecases/delete_avatar_usecase.dart';
export 'domain/usecases/update_preferences_usecase.dart';

// Data layer
export 'data/datasources/profile_remote_datasource.dart';
export 'data/models/profile_model.dart';
export 'data/repositories/profile_repository_impl.dart';

// Presentation - BLoC
export 'presentation/bloc/profile_bloc.dart';
export 'presentation/bloc/profile_event.dart';
export 'presentation/bloc/profile_state.dart';
