// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CourseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCourses,
    required TResult Function(String courseId) loadCourseById,
    required TResult Function(String courseId) loadCourseLessons,
    required TResult Function(String query) searchCourses,
    required TResult Function(CourseCategory category) filterByCategory,
    required TResult Function(CourseLevel level) filterByLevel,
    required TResult Function() clearFilters,
    required TResult Function() refreshCourses,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCourses,
    TResult? Function(String courseId)? loadCourseById,
    TResult? Function(String courseId)? loadCourseLessons,
    TResult? Function(String query)? searchCourses,
    TResult? Function(CourseCategory category)? filterByCategory,
    TResult? Function(CourseLevel level)? filterByLevel,
    TResult? Function()? clearFilters,
    TResult? Function()? refreshCourses,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCourses,
    TResult Function(String courseId)? loadCourseById,
    TResult Function(String courseId)? loadCourseLessons,
    TResult Function(String query)? searchCourses,
    TResult Function(CourseCategory category)? filterByCategory,
    TResult Function(CourseLevel level)? filterByLevel,
    TResult Function()? clearFilters,
    TResult Function()? refreshCourses,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCoursesEvent value) loadCourses,
    required TResult Function(LoadCourseByIdEvent value) loadCourseById,
    required TResult Function(LoadCourseLessonsEvent value) loadCourseLessons,
    required TResult Function(SearchCoursesEvent value) searchCourses,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(FilterByLevelEvent value) filterByLevel,
    required TResult Function(ClearFiltersEvent value) clearFilters,
    required TResult Function(RefreshCoursesEvent value) refreshCourses,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCoursesEvent value)? loadCourses,
    TResult? Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult? Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult? Function(SearchCoursesEvent value)? searchCourses,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(FilterByLevelEvent value)? filterByLevel,
    TResult? Function(ClearFiltersEvent value)? clearFilters,
    TResult? Function(RefreshCoursesEvent value)? refreshCourses,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoursesEvent value)? loadCourses,
    TResult Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult Function(SearchCoursesEvent value)? searchCourses,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(FilterByLevelEvent value)? filterByLevel,
    TResult Function(ClearFiltersEvent value)? clearFilters,
    TResult Function(RefreshCoursesEvent value)? refreshCourses,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseEventCopyWith<$Res> {
  factory $CourseEventCopyWith(
    CourseEvent value,
    $Res Function(CourseEvent) then,
  ) = _$CourseEventCopyWithImpl<$Res, CourseEvent>;
}

/// @nodoc
class _$CourseEventCopyWithImpl<$Res, $Val extends CourseEvent>
    implements $CourseEventCopyWith<$Res> {
  _$CourseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadCoursesEventImplCopyWith<$Res> {
  factory _$$LoadCoursesEventImplCopyWith(
    _$LoadCoursesEventImpl value,
    $Res Function(_$LoadCoursesEventImpl) then,
  ) = __$$LoadCoursesEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCoursesEventImplCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$LoadCoursesEventImpl>
    implements _$$LoadCoursesEventImplCopyWith<$Res> {
  __$$LoadCoursesEventImplCopyWithImpl(
    _$LoadCoursesEventImpl _value,
    $Res Function(_$LoadCoursesEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadCoursesEventImpl implements LoadCoursesEvent {
  const _$LoadCoursesEventImpl();

  @override
  String toString() {
    return 'CourseEvent.loadCourses()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadCoursesEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCourses,
    required TResult Function(String courseId) loadCourseById,
    required TResult Function(String courseId) loadCourseLessons,
    required TResult Function(String query) searchCourses,
    required TResult Function(CourseCategory category) filterByCategory,
    required TResult Function(CourseLevel level) filterByLevel,
    required TResult Function() clearFilters,
    required TResult Function() refreshCourses,
  }) {
    return loadCourses();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCourses,
    TResult? Function(String courseId)? loadCourseById,
    TResult? Function(String courseId)? loadCourseLessons,
    TResult? Function(String query)? searchCourses,
    TResult? Function(CourseCategory category)? filterByCategory,
    TResult? Function(CourseLevel level)? filterByLevel,
    TResult? Function()? clearFilters,
    TResult? Function()? refreshCourses,
  }) {
    return loadCourses?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCourses,
    TResult Function(String courseId)? loadCourseById,
    TResult Function(String courseId)? loadCourseLessons,
    TResult Function(String query)? searchCourses,
    TResult Function(CourseCategory category)? filterByCategory,
    TResult Function(CourseLevel level)? filterByLevel,
    TResult Function()? clearFilters,
    TResult Function()? refreshCourses,
    required TResult orElse(),
  }) {
    if (loadCourses != null) {
      return loadCourses();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCoursesEvent value) loadCourses,
    required TResult Function(LoadCourseByIdEvent value) loadCourseById,
    required TResult Function(LoadCourseLessonsEvent value) loadCourseLessons,
    required TResult Function(SearchCoursesEvent value) searchCourses,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(FilterByLevelEvent value) filterByLevel,
    required TResult Function(ClearFiltersEvent value) clearFilters,
    required TResult Function(RefreshCoursesEvent value) refreshCourses,
  }) {
    return loadCourses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCoursesEvent value)? loadCourses,
    TResult? Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult? Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult? Function(SearchCoursesEvent value)? searchCourses,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(FilterByLevelEvent value)? filterByLevel,
    TResult? Function(ClearFiltersEvent value)? clearFilters,
    TResult? Function(RefreshCoursesEvent value)? refreshCourses,
  }) {
    return loadCourses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoursesEvent value)? loadCourses,
    TResult Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult Function(SearchCoursesEvent value)? searchCourses,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(FilterByLevelEvent value)? filterByLevel,
    TResult Function(ClearFiltersEvent value)? clearFilters,
    TResult Function(RefreshCoursesEvent value)? refreshCourses,
    required TResult orElse(),
  }) {
    if (loadCourses != null) {
      return loadCourses(this);
    }
    return orElse();
  }
}

abstract class LoadCoursesEvent implements CourseEvent {
  const factory LoadCoursesEvent() = _$LoadCoursesEventImpl;
}

/// @nodoc
abstract class _$$LoadCourseByIdEventImplCopyWith<$Res> {
  factory _$$LoadCourseByIdEventImplCopyWith(
    _$LoadCourseByIdEventImpl value,
    $Res Function(_$LoadCourseByIdEventImpl) then,
  ) = __$$LoadCourseByIdEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String courseId});
}

/// @nodoc
class __$$LoadCourseByIdEventImplCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$LoadCourseByIdEventImpl>
    implements _$$LoadCourseByIdEventImplCopyWith<$Res> {
  __$$LoadCourseByIdEventImplCopyWithImpl(
    _$LoadCourseByIdEventImpl _value,
    $Res Function(_$LoadCourseByIdEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? courseId = null}) {
    return _then(
      _$LoadCourseByIdEventImpl(
        null == courseId
            ? _value.courseId
            : courseId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadCourseByIdEventImpl implements LoadCourseByIdEvent {
  const _$LoadCourseByIdEventImpl(this.courseId);

  @override
  final String courseId;

  @override
  String toString() {
    return 'CourseEvent.loadCourseById(courseId: $courseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadCourseByIdEventImpl &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId);

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadCourseByIdEventImplCopyWith<_$LoadCourseByIdEventImpl> get copyWith =>
      __$$LoadCourseByIdEventImplCopyWithImpl<_$LoadCourseByIdEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCourses,
    required TResult Function(String courseId) loadCourseById,
    required TResult Function(String courseId) loadCourseLessons,
    required TResult Function(String query) searchCourses,
    required TResult Function(CourseCategory category) filterByCategory,
    required TResult Function(CourseLevel level) filterByLevel,
    required TResult Function() clearFilters,
    required TResult Function() refreshCourses,
  }) {
    return loadCourseById(courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCourses,
    TResult? Function(String courseId)? loadCourseById,
    TResult? Function(String courseId)? loadCourseLessons,
    TResult? Function(String query)? searchCourses,
    TResult? Function(CourseCategory category)? filterByCategory,
    TResult? Function(CourseLevel level)? filterByLevel,
    TResult? Function()? clearFilters,
    TResult? Function()? refreshCourses,
  }) {
    return loadCourseById?.call(courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCourses,
    TResult Function(String courseId)? loadCourseById,
    TResult Function(String courseId)? loadCourseLessons,
    TResult Function(String query)? searchCourses,
    TResult Function(CourseCategory category)? filterByCategory,
    TResult Function(CourseLevel level)? filterByLevel,
    TResult Function()? clearFilters,
    TResult Function()? refreshCourses,
    required TResult orElse(),
  }) {
    if (loadCourseById != null) {
      return loadCourseById(courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCoursesEvent value) loadCourses,
    required TResult Function(LoadCourseByIdEvent value) loadCourseById,
    required TResult Function(LoadCourseLessonsEvent value) loadCourseLessons,
    required TResult Function(SearchCoursesEvent value) searchCourses,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(FilterByLevelEvent value) filterByLevel,
    required TResult Function(ClearFiltersEvent value) clearFilters,
    required TResult Function(RefreshCoursesEvent value) refreshCourses,
  }) {
    return loadCourseById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCoursesEvent value)? loadCourses,
    TResult? Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult? Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult? Function(SearchCoursesEvent value)? searchCourses,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(FilterByLevelEvent value)? filterByLevel,
    TResult? Function(ClearFiltersEvent value)? clearFilters,
    TResult? Function(RefreshCoursesEvent value)? refreshCourses,
  }) {
    return loadCourseById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoursesEvent value)? loadCourses,
    TResult Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult Function(SearchCoursesEvent value)? searchCourses,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(FilterByLevelEvent value)? filterByLevel,
    TResult Function(ClearFiltersEvent value)? clearFilters,
    TResult Function(RefreshCoursesEvent value)? refreshCourses,
    required TResult orElse(),
  }) {
    if (loadCourseById != null) {
      return loadCourseById(this);
    }
    return orElse();
  }
}

abstract class LoadCourseByIdEvent implements CourseEvent {
  const factory LoadCourseByIdEvent(final String courseId) =
      _$LoadCourseByIdEventImpl;

  String get courseId;

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadCourseByIdEventImplCopyWith<_$LoadCourseByIdEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadCourseLessonsEventImplCopyWith<$Res> {
  factory _$$LoadCourseLessonsEventImplCopyWith(
    _$LoadCourseLessonsEventImpl value,
    $Res Function(_$LoadCourseLessonsEventImpl) then,
  ) = __$$LoadCourseLessonsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String courseId});
}

/// @nodoc
class __$$LoadCourseLessonsEventImplCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$LoadCourseLessonsEventImpl>
    implements _$$LoadCourseLessonsEventImplCopyWith<$Res> {
  __$$LoadCourseLessonsEventImplCopyWithImpl(
    _$LoadCourseLessonsEventImpl _value,
    $Res Function(_$LoadCourseLessonsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? courseId = null}) {
    return _then(
      _$LoadCourseLessonsEventImpl(
        null == courseId
            ? _value.courseId
            : courseId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadCourseLessonsEventImpl implements LoadCourseLessonsEvent {
  const _$LoadCourseLessonsEventImpl(this.courseId);

  @override
  final String courseId;

  @override
  String toString() {
    return 'CourseEvent.loadCourseLessons(courseId: $courseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadCourseLessonsEventImpl &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId);

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadCourseLessonsEventImplCopyWith<_$LoadCourseLessonsEventImpl>
  get copyWith =>
      __$$LoadCourseLessonsEventImplCopyWithImpl<_$LoadCourseLessonsEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCourses,
    required TResult Function(String courseId) loadCourseById,
    required TResult Function(String courseId) loadCourseLessons,
    required TResult Function(String query) searchCourses,
    required TResult Function(CourseCategory category) filterByCategory,
    required TResult Function(CourseLevel level) filterByLevel,
    required TResult Function() clearFilters,
    required TResult Function() refreshCourses,
  }) {
    return loadCourseLessons(courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCourses,
    TResult? Function(String courseId)? loadCourseById,
    TResult? Function(String courseId)? loadCourseLessons,
    TResult? Function(String query)? searchCourses,
    TResult? Function(CourseCategory category)? filterByCategory,
    TResult? Function(CourseLevel level)? filterByLevel,
    TResult? Function()? clearFilters,
    TResult? Function()? refreshCourses,
  }) {
    return loadCourseLessons?.call(courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCourses,
    TResult Function(String courseId)? loadCourseById,
    TResult Function(String courseId)? loadCourseLessons,
    TResult Function(String query)? searchCourses,
    TResult Function(CourseCategory category)? filterByCategory,
    TResult Function(CourseLevel level)? filterByLevel,
    TResult Function()? clearFilters,
    TResult Function()? refreshCourses,
    required TResult orElse(),
  }) {
    if (loadCourseLessons != null) {
      return loadCourseLessons(courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCoursesEvent value) loadCourses,
    required TResult Function(LoadCourseByIdEvent value) loadCourseById,
    required TResult Function(LoadCourseLessonsEvent value) loadCourseLessons,
    required TResult Function(SearchCoursesEvent value) searchCourses,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(FilterByLevelEvent value) filterByLevel,
    required TResult Function(ClearFiltersEvent value) clearFilters,
    required TResult Function(RefreshCoursesEvent value) refreshCourses,
  }) {
    return loadCourseLessons(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCoursesEvent value)? loadCourses,
    TResult? Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult? Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult? Function(SearchCoursesEvent value)? searchCourses,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(FilterByLevelEvent value)? filterByLevel,
    TResult? Function(ClearFiltersEvent value)? clearFilters,
    TResult? Function(RefreshCoursesEvent value)? refreshCourses,
  }) {
    return loadCourseLessons?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoursesEvent value)? loadCourses,
    TResult Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult Function(SearchCoursesEvent value)? searchCourses,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(FilterByLevelEvent value)? filterByLevel,
    TResult Function(ClearFiltersEvent value)? clearFilters,
    TResult Function(RefreshCoursesEvent value)? refreshCourses,
    required TResult orElse(),
  }) {
    if (loadCourseLessons != null) {
      return loadCourseLessons(this);
    }
    return orElse();
  }
}

abstract class LoadCourseLessonsEvent implements CourseEvent {
  const factory LoadCourseLessonsEvent(final String courseId) =
      _$LoadCourseLessonsEventImpl;

  String get courseId;

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadCourseLessonsEventImplCopyWith<_$LoadCourseLessonsEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchCoursesEventImplCopyWith<$Res> {
  factory _$$SearchCoursesEventImplCopyWith(
    _$SearchCoursesEventImpl value,
    $Res Function(_$SearchCoursesEventImpl) then,
  ) = __$$SearchCoursesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchCoursesEventImplCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$SearchCoursesEventImpl>
    implements _$$SearchCoursesEventImplCopyWith<$Res> {
  __$$SearchCoursesEventImplCopyWithImpl(
    _$SearchCoursesEventImpl _value,
    $Res Function(_$SearchCoursesEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = null}) {
    return _then(
      _$SearchCoursesEventImpl(
        null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$SearchCoursesEventImpl implements SearchCoursesEvent {
  const _$SearchCoursesEventImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'CourseEvent.searchCourses(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchCoursesEventImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCoursesEventImplCopyWith<_$SearchCoursesEventImpl> get copyWith =>
      __$$SearchCoursesEventImplCopyWithImpl<_$SearchCoursesEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCourses,
    required TResult Function(String courseId) loadCourseById,
    required TResult Function(String courseId) loadCourseLessons,
    required TResult Function(String query) searchCourses,
    required TResult Function(CourseCategory category) filterByCategory,
    required TResult Function(CourseLevel level) filterByLevel,
    required TResult Function() clearFilters,
    required TResult Function() refreshCourses,
  }) {
    return searchCourses(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCourses,
    TResult? Function(String courseId)? loadCourseById,
    TResult? Function(String courseId)? loadCourseLessons,
    TResult? Function(String query)? searchCourses,
    TResult? Function(CourseCategory category)? filterByCategory,
    TResult? Function(CourseLevel level)? filterByLevel,
    TResult? Function()? clearFilters,
    TResult? Function()? refreshCourses,
  }) {
    return searchCourses?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCourses,
    TResult Function(String courseId)? loadCourseById,
    TResult Function(String courseId)? loadCourseLessons,
    TResult Function(String query)? searchCourses,
    TResult Function(CourseCategory category)? filterByCategory,
    TResult Function(CourseLevel level)? filterByLevel,
    TResult Function()? clearFilters,
    TResult Function()? refreshCourses,
    required TResult orElse(),
  }) {
    if (searchCourses != null) {
      return searchCourses(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCoursesEvent value) loadCourses,
    required TResult Function(LoadCourseByIdEvent value) loadCourseById,
    required TResult Function(LoadCourseLessonsEvent value) loadCourseLessons,
    required TResult Function(SearchCoursesEvent value) searchCourses,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(FilterByLevelEvent value) filterByLevel,
    required TResult Function(ClearFiltersEvent value) clearFilters,
    required TResult Function(RefreshCoursesEvent value) refreshCourses,
  }) {
    return searchCourses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCoursesEvent value)? loadCourses,
    TResult? Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult? Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult? Function(SearchCoursesEvent value)? searchCourses,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(FilterByLevelEvent value)? filterByLevel,
    TResult? Function(ClearFiltersEvent value)? clearFilters,
    TResult? Function(RefreshCoursesEvent value)? refreshCourses,
  }) {
    return searchCourses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoursesEvent value)? loadCourses,
    TResult Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult Function(SearchCoursesEvent value)? searchCourses,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(FilterByLevelEvent value)? filterByLevel,
    TResult Function(ClearFiltersEvent value)? clearFilters,
    TResult Function(RefreshCoursesEvent value)? refreshCourses,
    required TResult orElse(),
  }) {
    if (searchCourses != null) {
      return searchCourses(this);
    }
    return orElse();
  }
}

abstract class SearchCoursesEvent implements CourseEvent {
  const factory SearchCoursesEvent(final String query) =
      _$SearchCoursesEventImpl;

  String get query;

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchCoursesEventImplCopyWith<_$SearchCoursesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterByCategoryEventImplCopyWith<$Res> {
  factory _$$FilterByCategoryEventImplCopyWith(
    _$FilterByCategoryEventImpl value,
    $Res Function(_$FilterByCategoryEventImpl) then,
  ) = __$$FilterByCategoryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CourseCategory category});
}

/// @nodoc
class __$$FilterByCategoryEventImplCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$FilterByCategoryEventImpl>
    implements _$$FilterByCategoryEventImplCopyWith<$Res> {
  __$$FilterByCategoryEventImplCopyWithImpl(
    _$FilterByCategoryEventImpl _value,
    $Res Function(_$FilterByCategoryEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? category = null}) {
    return _then(
      _$FilterByCategoryEventImpl(
        null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                as CourseCategory,
      ),
    );
  }
}

/// @nodoc

class _$FilterByCategoryEventImpl implements FilterByCategoryEvent {
  const _$FilterByCategoryEventImpl(this.category);

  @override
  final CourseCategory category;

  @override
  String toString() {
    return 'CourseEvent.filterByCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByCategoryEventImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByCategoryEventImplCopyWith<_$FilterByCategoryEventImpl>
  get copyWith =>
      __$$FilterByCategoryEventImplCopyWithImpl<_$FilterByCategoryEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCourses,
    required TResult Function(String courseId) loadCourseById,
    required TResult Function(String courseId) loadCourseLessons,
    required TResult Function(String query) searchCourses,
    required TResult Function(CourseCategory category) filterByCategory,
    required TResult Function(CourseLevel level) filterByLevel,
    required TResult Function() clearFilters,
    required TResult Function() refreshCourses,
  }) {
    return filterByCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCourses,
    TResult? Function(String courseId)? loadCourseById,
    TResult? Function(String courseId)? loadCourseLessons,
    TResult? Function(String query)? searchCourses,
    TResult? Function(CourseCategory category)? filterByCategory,
    TResult? Function(CourseLevel level)? filterByLevel,
    TResult? Function()? clearFilters,
    TResult? Function()? refreshCourses,
  }) {
    return filterByCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCourses,
    TResult Function(String courseId)? loadCourseById,
    TResult Function(String courseId)? loadCourseLessons,
    TResult Function(String query)? searchCourses,
    TResult Function(CourseCategory category)? filterByCategory,
    TResult Function(CourseLevel level)? filterByLevel,
    TResult Function()? clearFilters,
    TResult Function()? refreshCourses,
    required TResult orElse(),
  }) {
    if (filterByCategory != null) {
      return filterByCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCoursesEvent value) loadCourses,
    required TResult Function(LoadCourseByIdEvent value) loadCourseById,
    required TResult Function(LoadCourseLessonsEvent value) loadCourseLessons,
    required TResult Function(SearchCoursesEvent value) searchCourses,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(FilterByLevelEvent value) filterByLevel,
    required TResult Function(ClearFiltersEvent value) clearFilters,
    required TResult Function(RefreshCoursesEvent value) refreshCourses,
  }) {
    return filterByCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCoursesEvent value)? loadCourses,
    TResult? Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult? Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult? Function(SearchCoursesEvent value)? searchCourses,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(FilterByLevelEvent value)? filterByLevel,
    TResult? Function(ClearFiltersEvent value)? clearFilters,
    TResult? Function(RefreshCoursesEvent value)? refreshCourses,
  }) {
    return filterByCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoursesEvent value)? loadCourses,
    TResult Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult Function(SearchCoursesEvent value)? searchCourses,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(FilterByLevelEvent value)? filterByLevel,
    TResult Function(ClearFiltersEvent value)? clearFilters,
    TResult Function(RefreshCoursesEvent value)? refreshCourses,
    required TResult orElse(),
  }) {
    if (filterByCategory != null) {
      return filterByCategory(this);
    }
    return orElse();
  }
}

abstract class FilterByCategoryEvent implements CourseEvent {
  const factory FilterByCategoryEvent(final CourseCategory category) =
      _$FilterByCategoryEventImpl;

  CourseCategory get category;

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterByCategoryEventImplCopyWith<_$FilterByCategoryEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterByLevelEventImplCopyWith<$Res> {
  factory _$$FilterByLevelEventImplCopyWith(
    _$FilterByLevelEventImpl value,
    $Res Function(_$FilterByLevelEventImpl) then,
  ) = __$$FilterByLevelEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CourseLevel level});
}

/// @nodoc
class __$$FilterByLevelEventImplCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$FilterByLevelEventImpl>
    implements _$$FilterByLevelEventImplCopyWith<$Res> {
  __$$FilterByLevelEventImplCopyWithImpl(
    _$FilterByLevelEventImpl _value,
    $Res Function(_$FilterByLevelEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? level = null}) {
    return _then(
      _$FilterByLevelEventImpl(
        null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                as CourseLevel,
      ),
    );
  }
}

/// @nodoc

class _$FilterByLevelEventImpl implements FilterByLevelEvent {
  const _$FilterByLevelEventImpl(this.level);

  @override
  final CourseLevel level;

  @override
  String toString() {
    return 'CourseEvent.filterByLevel(level: $level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByLevelEventImpl &&
            (identical(other.level, level) || other.level == level));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level);

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByLevelEventImplCopyWith<_$FilterByLevelEventImpl> get copyWith =>
      __$$FilterByLevelEventImplCopyWithImpl<_$FilterByLevelEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCourses,
    required TResult Function(String courseId) loadCourseById,
    required TResult Function(String courseId) loadCourseLessons,
    required TResult Function(String query) searchCourses,
    required TResult Function(CourseCategory category) filterByCategory,
    required TResult Function(CourseLevel level) filterByLevel,
    required TResult Function() clearFilters,
    required TResult Function() refreshCourses,
  }) {
    return filterByLevel(level);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCourses,
    TResult? Function(String courseId)? loadCourseById,
    TResult? Function(String courseId)? loadCourseLessons,
    TResult? Function(String query)? searchCourses,
    TResult? Function(CourseCategory category)? filterByCategory,
    TResult? Function(CourseLevel level)? filterByLevel,
    TResult? Function()? clearFilters,
    TResult? Function()? refreshCourses,
  }) {
    return filterByLevel?.call(level);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCourses,
    TResult Function(String courseId)? loadCourseById,
    TResult Function(String courseId)? loadCourseLessons,
    TResult Function(String query)? searchCourses,
    TResult Function(CourseCategory category)? filterByCategory,
    TResult Function(CourseLevel level)? filterByLevel,
    TResult Function()? clearFilters,
    TResult Function()? refreshCourses,
    required TResult orElse(),
  }) {
    if (filterByLevel != null) {
      return filterByLevel(level);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCoursesEvent value) loadCourses,
    required TResult Function(LoadCourseByIdEvent value) loadCourseById,
    required TResult Function(LoadCourseLessonsEvent value) loadCourseLessons,
    required TResult Function(SearchCoursesEvent value) searchCourses,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(FilterByLevelEvent value) filterByLevel,
    required TResult Function(ClearFiltersEvent value) clearFilters,
    required TResult Function(RefreshCoursesEvent value) refreshCourses,
  }) {
    return filterByLevel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCoursesEvent value)? loadCourses,
    TResult? Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult? Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult? Function(SearchCoursesEvent value)? searchCourses,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(FilterByLevelEvent value)? filterByLevel,
    TResult? Function(ClearFiltersEvent value)? clearFilters,
    TResult? Function(RefreshCoursesEvent value)? refreshCourses,
  }) {
    return filterByLevel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoursesEvent value)? loadCourses,
    TResult Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult Function(SearchCoursesEvent value)? searchCourses,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(FilterByLevelEvent value)? filterByLevel,
    TResult Function(ClearFiltersEvent value)? clearFilters,
    TResult Function(RefreshCoursesEvent value)? refreshCourses,
    required TResult orElse(),
  }) {
    if (filterByLevel != null) {
      return filterByLevel(this);
    }
    return orElse();
  }
}

abstract class FilterByLevelEvent implements CourseEvent {
  const factory FilterByLevelEvent(final CourseLevel level) =
      _$FilterByLevelEventImpl;

  CourseLevel get level;

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterByLevelEventImplCopyWith<_$FilterByLevelEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearFiltersEventImplCopyWith<$Res> {
  factory _$$ClearFiltersEventImplCopyWith(
    _$ClearFiltersEventImpl value,
    $Res Function(_$ClearFiltersEventImpl) then,
  ) = __$$ClearFiltersEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearFiltersEventImplCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$ClearFiltersEventImpl>
    implements _$$ClearFiltersEventImplCopyWith<$Res> {
  __$$ClearFiltersEventImplCopyWithImpl(
    _$ClearFiltersEventImpl _value,
    $Res Function(_$ClearFiltersEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearFiltersEventImpl implements ClearFiltersEvent {
  const _$ClearFiltersEventImpl();

  @override
  String toString() {
    return 'CourseEvent.clearFilters()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearFiltersEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCourses,
    required TResult Function(String courseId) loadCourseById,
    required TResult Function(String courseId) loadCourseLessons,
    required TResult Function(String query) searchCourses,
    required TResult Function(CourseCategory category) filterByCategory,
    required TResult Function(CourseLevel level) filterByLevel,
    required TResult Function() clearFilters,
    required TResult Function() refreshCourses,
  }) {
    return clearFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCourses,
    TResult? Function(String courseId)? loadCourseById,
    TResult? Function(String courseId)? loadCourseLessons,
    TResult? Function(String query)? searchCourses,
    TResult? Function(CourseCategory category)? filterByCategory,
    TResult? Function(CourseLevel level)? filterByLevel,
    TResult? Function()? clearFilters,
    TResult? Function()? refreshCourses,
  }) {
    return clearFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCourses,
    TResult Function(String courseId)? loadCourseById,
    TResult Function(String courseId)? loadCourseLessons,
    TResult Function(String query)? searchCourses,
    TResult Function(CourseCategory category)? filterByCategory,
    TResult Function(CourseLevel level)? filterByLevel,
    TResult Function()? clearFilters,
    TResult Function()? refreshCourses,
    required TResult orElse(),
  }) {
    if (clearFilters != null) {
      return clearFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCoursesEvent value) loadCourses,
    required TResult Function(LoadCourseByIdEvent value) loadCourseById,
    required TResult Function(LoadCourseLessonsEvent value) loadCourseLessons,
    required TResult Function(SearchCoursesEvent value) searchCourses,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(FilterByLevelEvent value) filterByLevel,
    required TResult Function(ClearFiltersEvent value) clearFilters,
    required TResult Function(RefreshCoursesEvent value) refreshCourses,
  }) {
    return clearFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCoursesEvent value)? loadCourses,
    TResult? Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult? Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult? Function(SearchCoursesEvent value)? searchCourses,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(FilterByLevelEvent value)? filterByLevel,
    TResult? Function(ClearFiltersEvent value)? clearFilters,
    TResult? Function(RefreshCoursesEvent value)? refreshCourses,
  }) {
    return clearFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoursesEvent value)? loadCourses,
    TResult Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult Function(SearchCoursesEvent value)? searchCourses,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(FilterByLevelEvent value)? filterByLevel,
    TResult Function(ClearFiltersEvent value)? clearFilters,
    TResult Function(RefreshCoursesEvent value)? refreshCourses,
    required TResult orElse(),
  }) {
    if (clearFilters != null) {
      return clearFilters(this);
    }
    return orElse();
  }
}

abstract class ClearFiltersEvent implements CourseEvent {
  const factory ClearFiltersEvent() = _$ClearFiltersEventImpl;
}

/// @nodoc
abstract class _$$RefreshCoursesEventImplCopyWith<$Res> {
  factory _$$RefreshCoursesEventImplCopyWith(
    _$RefreshCoursesEventImpl value,
    $Res Function(_$RefreshCoursesEventImpl) then,
  ) = __$$RefreshCoursesEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshCoursesEventImplCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$RefreshCoursesEventImpl>
    implements _$$RefreshCoursesEventImplCopyWith<$Res> {
  __$$RefreshCoursesEventImplCopyWithImpl(
    _$RefreshCoursesEventImpl _value,
    $Res Function(_$RefreshCoursesEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshCoursesEventImpl implements RefreshCoursesEvent {
  const _$RefreshCoursesEventImpl();

  @override
  String toString() {
    return 'CourseEvent.refreshCourses()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshCoursesEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCourses,
    required TResult Function(String courseId) loadCourseById,
    required TResult Function(String courseId) loadCourseLessons,
    required TResult Function(String query) searchCourses,
    required TResult Function(CourseCategory category) filterByCategory,
    required TResult Function(CourseLevel level) filterByLevel,
    required TResult Function() clearFilters,
    required TResult Function() refreshCourses,
  }) {
    return refreshCourses();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCourses,
    TResult? Function(String courseId)? loadCourseById,
    TResult? Function(String courseId)? loadCourseLessons,
    TResult? Function(String query)? searchCourses,
    TResult? Function(CourseCategory category)? filterByCategory,
    TResult? Function(CourseLevel level)? filterByLevel,
    TResult? Function()? clearFilters,
    TResult? Function()? refreshCourses,
  }) {
    return refreshCourses?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCourses,
    TResult Function(String courseId)? loadCourseById,
    TResult Function(String courseId)? loadCourseLessons,
    TResult Function(String query)? searchCourses,
    TResult Function(CourseCategory category)? filterByCategory,
    TResult Function(CourseLevel level)? filterByLevel,
    TResult Function()? clearFilters,
    TResult Function()? refreshCourses,
    required TResult orElse(),
  }) {
    if (refreshCourses != null) {
      return refreshCourses();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCoursesEvent value) loadCourses,
    required TResult Function(LoadCourseByIdEvent value) loadCourseById,
    required TResult Function(LoadCourseLessonsEvent value) loadCourseLessons,
    required TResult Function(SearchCoursesEvent value) searchCourses,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(FilterByLevelEvent value) filterByLevel,
    required TResult Function(ClearFiltersEvent value) clearFilters,
    required TResult Function(RefreshCoursesEvent value) refreshCourses,
  }) {
    return refreshCourses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCoursesEvent value)? loadCourses,
    TResult? Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult? Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult? Function(SearchCoursesEvent value)? searchCourses,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(FilterByLevelEvent value)? filterByLevel,
    TResult? Function(ClearFiltersEvent value)? clearFilters,
    TResult? Function(RefreshCoursesEvent value)? refreshCourses,
  }) {
    return refreshCourses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoursesEvent value)? loadCourses,
    TResult Function(LoadCourseByIdEvent value)? loadCourseById,
    TResult Function(LoadCourseLessonsEvent value)? loadCourseLessons,
    TResult Function(SearchCoursesEvent value)? searchCourses,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(FilterByLevelEvent value)? filterByLevel,
    TResult Function(ClearFiltersEvent value)? clearFilters,
    TResult Function(RefreshCoursesEvent value)? refreshCourses,
    required TResult orElse(),
  }) {
    if (refreshCourses != null) {
      return refreshCourses(this);
    }
    return orElse();
  }
}

abstract class RefreshCoursesEvent implements CourseEvent {
  const factory RefreshCoursesEvent() = _$RefreshCoursesEventImpl;
}
