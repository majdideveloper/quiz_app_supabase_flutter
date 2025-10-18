// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CourseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )
    coursesLoaded,
    required TResult Function(CourseEntity course) courseDetailLoaded,
    required TResult Function(CourseEntity course, List<LessonEntity> lessons)
    courseLessonsLoaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult? Function(CourseEntity course)? courseDetailLoaded,
    TResult? Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult Function(CourseEntity course)? courseDetailLoaded,
    TResult Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseInitial value) initial,
    required TResult Function(CourseLoading value) loading,
    required TResult Function(CoursesLoaded value) coursesLoaded,
    required TResult Function(CourseDetailLoaded value) courseDetailLoaded,
    required TResult Function(CourseLessonsLoaded value) courseLessonsLoaded,
    required TResult Function(CourseError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseInitial value)? initial,
    TResult? Function(CourseLoading value)? loading,
    TResult? Function(CoursesLoaded value)? coursesLoaded,
    TResult? Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult? Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult? Function(CourseError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseInitial value)? initial,
    TResult Function(CourseLoading value)? loading,
    TResult Function(CoursesLoaded value)? coursesLoaded,
    TResult Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult Function(CourseError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseStateCopyWith<$Res> {
  factory $CourseStateCopyWith(
    CourseState value,
    $Res Function(CourseState) then,
  ) = _$CourseStateCopyWithImpl<$Res, CourseState>;
}

/// @nodoc
class _$CourseStateCopyWithImpl<$Res, $Val extends CourseState>
    implements $CourseStateCopyWith<$Res> {
  _$CourseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CourseInitialImplCopyWith<$Res> {
  factory _$$CourseInitialImplCopyWith(
    _$CourseInitialImpl value,
    $Res Function(_$CourseInitialImpl) then,
  ) = __$$CourseInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CourseInitialImplCopyWithImpl<$Res>
    extends _$CourseStateCopyWithImpl<$Res, _$CourseInitialImpl>
    implements _$$CourseInitialImplCopyWith<$Res> {
  __$$CourseInitialImplCopyWithImpl(
    _$CourseInitialImpl _value,
    $Res Function(_$CourseInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CourseInitialImpl implements CourseInitial {
  const _$CourseInitialImpl();

  @override
  String toString() {
    return 'CourseState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CourseInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )
    coursesLoaded,
    required TResult Function(CourseEntity course) courseDetailLoaded,
    required TResult Function(CourseEntity course, List<LessonEntity> lessons)
    courseLessonsLoaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult? Function(CourseEntity course)? courseDetailLoaded,
    TResult? Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult Function(CourseEntity course)? courseDetailLoaded,
    TResult Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseInitial value) initial,
    required TResult Function(CourseLoading value) loading,
    required TResult Function(CoursesLoaded value) coursesLoaded,
    required TResult Function(CourseDetailLoaded value) courseDetailLoaded,
    required TResult Function(CourseLessonsLoaded value) courseLessonsLoaded,
    required TResult Function(CourseError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseInitial value)? initial,
    TResult? Function(CourseLoading value)? loading,
    TResult? Function(CoursesLoaded value)? coursesLoaded,
    TResult? Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult? Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult? Function(CourseError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseInitial value)? initial,
    TResult Function(CourseLoading value)? loading,
    TResult Function(CoursesLoaded value)? coursesLoaded,
    TResult Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult Function(CourseError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CourseInitial implements CourseState {
  const factory CourseInitial() = _$CourseInitialImpl;
}

/// @nodoc
abstract class _$$CourseLoadingImplCopyWith<$Res> {
  factory _$$CourseLoadingImplCopyWith(
    _$CourseLoadingImpl value,
    $Res Function(_$CourseLoadingImpl) then,
  ) = __$$CourseLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CourseLoadingImplCopyWithImpl<$Res>
    extends _$CourseStateCopyWithImpl<$Res, _$CourseLoadingImpl>
    implements _$$CourseLoadingImplCopyWith<$Res> {
  __$$CourseLoadingImplCopyWithImpl(
    _$CourseLoadingImpl _value,
    $Res Function(_$CourseLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CourseLoadingImpl implements CourseLoading {
  const _$CourseLoadingImpl();

  @override
  String toString() {
    return 'CourseState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CourseLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )
    coursesLoaded,
    required TResult Function(CourseEntity course) courseDetailLoaded,
    required TResult Function(CourseEntity course, List<LessonEntity> lessons)
    courseLessonsLoaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult? Function(CourseEntity course)? courseDetailLoaded,
    TResult? Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult Function(CourseEntity course)? courseDetailLoaded,
    TResult Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseInitial value) initial,
    required TResult Function(CourseLoading value) loading,
    required TResult Function(CoursesLoaded value) coursesLoaded,
    required TResult Function(CourseDetailLoaded value) courseDetailLoaded,
    required TResult Function(CourseLessonsLoaded value) courseLessonsLoaded,
    required TResult Function(CourseError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseInitial value)? initial,
    TResult? Function(CourseLoading value)? loading,
    TResult? Function(CoursesLoaded value)? coursesLoaded,
    TResult? Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult? Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult? Function(CourseError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseInitial value)? initial,
    TResult Function(CourseLoading value)? loading,
    TResult Function(CoursesLoaded value)? coursesLoaded,
    TResult Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult Function(CourseError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CourseLoading implements CourseState {
  const factory CourseLoading() = _$CourseLoadingImpl;
}

/// @nodoc
abstract class _$$CoursesLoadedImplCopyWith<$Res> {
  factory _$$CoursesLoadedImplCopyWith(
    _$CoursesLoadedImpl value,
    $Res Function(_$CoursesLoadedImpl) then,
  ) = __$$CoursesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    List<CourseEntity> courses,
    CourseCategory? selectedCategory,
    CourseLevel? selectedLevel,
    String? searchQuery,
  });
}

/// @nodoc
class __$$CoursesLoadedImplCopyWithImpl<$Res>
    extends _$CourseStateCopyWithImpl<$Res, _$CoursesLoadedImpl>
    implements _$$CoursesLoadedImplCopyWith<$Res> {
  __$$CoursesLoadedImplCopyWithImpl(
    _$CoursesLoadedImpl _value,
    $Res Function(_$CoursesLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courses = null,
    Object? selectedCategory = freezed,
    Object? selectedLevel = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(
      _$CoursesLoadedImpl(
        courses:
            null == courses
                ? _value._courses
                : courses // ignore: cast_nullable_to_non_nullable
                    as List<CourseEntity>,
        selectedCategory:
            freezed == selectedCategory
                ? _value.selectedCategory
                : selectedCategory // ignore: cast_nullable_to_non_nullable
                    as CourseCategory?,
        selectedLevel:
            freezed == selectedLevel
                ? _value.selectedLevel
                : selectedLevel // ignore: cast_nullable_to_non_nullable
                    as CourseLevel?,
        searchQuery:
            freezed == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$CoursesLoadedImpl implements CoursesLoaded {
  const _$CoursesLoadedImpl({
    required final List<CourseEntity> courses,
    this.selectedCategory,
    this.selectedLevel,
    this.searchQuery,
  }) : _courses = courses;

  final List<CourseEntity> _courses;
  @override
  List<CourseEntity> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  @override
  final CourseCategory? selectedCategory;
  @override
  final CourseLevel? selectedLevel;
  @override
  final String? searchQuery;

  @override
  String toString() {
    return 'CourseState.coursesLoaded(courses: $courses, selectedCategory: $selectedCategory, selectedLevel: $selectedLevel, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoursesLoadedImpl &&
            const DeepCollectionEquality().equals(other._courses, _courses) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedLevel, selectedLevel) ||
                other.selectedLevel == selectedLevel) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_courses),
    selectedCategory,
    selectedLevel,
    searchQuery,
  );

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoursesLoadedImplCopyWith<_$CoursesLoadedImpl> get copyWith =>
      __$$CoursesLoadedImplCopyWithImpl<_$CoursesLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )
    coursesLoaded,
    required TResult Function(CourseEntity course) courseDetailLoaded,
    required TResult Function(CourseEntity course, List<LessonEntity> lessons)
    courseLessonsLoaded,
    required TResult Function(String message) error,
  }) {
    return coursesLoaded(courses, selectedCategory, selectedLevel, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult? Function(CourseEntity course)? courseDetailLoaded,
    TResult? Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult? Function(String message)? error,
  }) {
    return coursesLoaded?.call(
      courses,
      selectedCategory,
      selectedLevel,
      searchQuery,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult Function(CourseEntity course)? courseDetailLoaded,
    TResult Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (coursesLoaded != null) {
      return coursesLoaded(
        courses,
        selectedCategory,
        selectedLevel,
        searchQuery,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseInitial value) initial,
    required TResult Function(CourseLoading value) loading,
    required TResult Function(CoursesLoaded value) coursesLoaded,
    required TResult Function(CourseDetailLoaded value) courseDetailLoaded,
    required TResult Function(CourseLessonsLoaded value) courseLessonsLoaded,
    required TResult Function(CourseError value) error,
  }) {
    return coursesLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseInitial value)? initial,
    TResult? Function(CourseLoading value)? loading,
    TResult? Function(CoursesLoaded value)? coursesLoaded,
    TResult? Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult? Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult? Function(CourseError value)? error,
  }) {
    return coursesLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseInitial value)? initial,
    TResult Function(CourseLoading value)? loading,
    TResult Function(CoursesLoaded value)? coursesLoaded,
    TResult Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult Function(CourseError value)? error,
    required TResult orElse(),
  }) {
    if (coursesLoaded != null) {
      return coursesLoaded(this);
    }
    return orElse();
  }
}

abstract class CoursesLoaded implements CourseState {
  const factory CoursesLoaded({
    required final List<CourseEntity> courses,
    final CourseCategory? selectedCategory,
    final CourseLevel? selectedLevel,
    final String? searchQuery,
  }) = _$CoursesLoadedImpl;

  List<CourseEntity> get courses;
  CourseCategory? get selectedCategory;
  CourseLevel? get selectedLevel;
  String? get searchQuery;

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoursesLoadedImplCopyWith<_$CoursesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CourseDetailLoadedImplCopyWith<$Res> {
  factory _$$CourseDetailLoadedImplCopyWith(
    _$CourseDetailLoadedImpl value,
    $Res Function(_$CourseDetailLoadedImpl) then,
  ) = __$$CourseDetailLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CourseEntity course});

  $CourseEntityCopyWith<$Res> get course;
}

/// @nodoc
class __$$CourseDetailLoadedImplCopyWithImpl<$Res>
    extends _$CourseStateCopyWithImpl<$Res, _$CourseDetailLoadedImpl>
    implements _$$CourseDetailLoadedImplCopyWith<$Res> {
  __$$CourseDetailLoadedImplCopyWithImpl(
    _$CourseDetailLoadedImpl _value,
    $Res Function(_$CourseDetailLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? course = null}) {
    return _then(
      _$CourseDetailLoadedImpl(
        course:
            null == course
                ? _value.course
                : course // ignore: cast_nullable_to_non_nullable
                    as CourseEntity,
      ),
    );
  }

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseEntityCopyWith<$Res> get course {
    return $CourseEntityCopyWith<$Res>(_value.course, (value) {
      return _then(_value.copyWith(course: value));
    });
  }
}

/// @nodoc

class _$CourseDetailLoadedImpl implements CourseDetailLoaded {
  const _$CourseDetailLoadedImpl({required this.course});

  @override
  final CourseEntity course;

  @override
  String toString() {
    return 'CourseState.courseDetailLoaded(course: $course)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDetailLoadedImpl &&
            (identical(other.course, course) || other.course == course));
  }

  @override
  int get hashCode => Object.hash(runtimeType, course);

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDetailLoadedImplCopyWith<_$CourseDetailLoadedImpl> get copyWith =>
      __$$CourseDetailLoadedImplCopyWithImpl<_$CourseDetailLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )
    coursesLoaded,
    required TResult Function(CourseEntity course) courseDetailLoaded,
    required TResult Function(CourseEntity course, List<LessonEntity> lessons)
    courseLessonsLoaded,
    required TResult Function(String message) error,
  }) {
    return courseDetailLoaded(course);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult? Function(CourseEntity course)? courseDetailLoaded,
    TResult? Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult? Function(String message)? error,
  }) {
    return courseDetailLoaded?.call(course);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult Function(CourseEntity course)? courseDetailLoaded,
    TResult Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (courseDetailLoaded != null) {
      return courseDetailLoaded(course);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseInitial value) initial,
    required TResult Function(CourseLoading value) loading,
    required TResult Function(CoursesLoaded value) coursesLoaded,
    required TResult Function(CourseDetailLoaded value) courseDetailLoaded,
    required TResult Function(CourseLessonsLoaded value) courseLessonsLoaded,
    required TResult Function(CourseError value) error,
  }) {
    return courseDetailLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseInitial value)? initial,
    TResult? Function(CourseLoading value)? loading,
    TResult? Function(CoursesLoaded value)? coursesLoaded,
    TResult? Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult? Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult? Function(CourseError value)? error,
  }) {
    return courseDetailLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseInitial value)? initial,
    TResult Function(CourseLoading value)? loading,
    TResult Function(CoursesLoaded value)? coursesLoaded,
    TResult Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult Function(CourseError value)? error,
    required TResult orElse(),
  }) {
    if (courseDetailLoaded != null) {
      return courseDetailLoaded(this);
    }
    return orElse();
  }
}

abstract class CourseDetailLoaded implements CourseState {
  const factory CourseDetailLoaded({required final CourseEntity course}) =
      _$CourseDetailLoadedImpl;

  CourseEntity get course;

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseDetailLoadedImplCopyWith<_$CourseDetailLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CourseLessonsLoadedImplCopyWith<$Res> {
  factory _$$CourseLessonsLoadedImplCopyWith(
    _$CourseLessonsLoadedImpl value,
    $Res Function(_$CourseLessonsLoadedImpl) then,
  ) = __$$CourseLessonsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CourseEntity course, List<LessonEntity> lessons});

  $CourseEntityCopyWith<$Res> get course;
}

/// @nodoc
class __$$CourseLessonsLoadedImplCopyWithImpl<$Res>
    extends _$CourseStateCopyWithImpl<$Res, _$CourseLessonsLoadedImpl>
    implements _$$CourseLessonsLoadedImplCopyWith<$Res> {
  __$$CourseLessonsLoadedImplCopyWithImpl(
    _$CourseLessonsLoadedImpl _value,
    $Res Function(_$CourseLessonsLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? course = null, Object? lessons = null}) {
    return _then(
      _$CourseLessonsLoadedImpl(
        course:
            null == course
                ? _value.course
                : course // ignore: cast_nullable_to_non_nullable
                    as CourseEntity,
        lessons:
            null == lessons
                ? _value._lessons
                : lessons // ignore: cast_nullable_to_non_nullable
                    as List<LessonEntity>,
      ),
    );
  }

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseEntityCopyWith<$Res> get course {
    return $CourseEntityCopyWith<$Res>(_value.course, (value) {
      return _then(_value.copyWith(course: value));
    });
  }
}

/// @nodoc

class _$CourseLessonsLoadedImpl implements CourseLessonsLoaded {
  const _$CourseLessonsLoadedImpl({
    required this.course,
    required final List<LessonEntity> lessons,
  }) : _lessons = lessons;

  @override
  final CourseEntity course;
  final List<LessonEntity> _lessons;
  @override
  List<LessonEntity> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

  @override
  String toString() {
    return 'CourseState.courseLessonsLoaded(course: $course, lessons: $lessons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseLessonsLoadedImpl &&
            (identical(other.course, course) || other.course == course) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    course,
    const DeepCollectionEquality().hash(_lessons),
  );

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseLessonsLoadedImplCopyWith<_$CourseLessonsLoadedImpl> get copyWith =>
      __$$CourseLessonsLoadedImplCopyWithImpl<_$CourseLessonsLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )
    coursesLoaded,
    required TResult Function(CourseEntity course) courseDetailLoaded,
    required TResult Function(CourseEntity course, List<LessonEntity> lessons)
    courseLessonsLoaded,
    required TResult Function(String message) error,
  }) {
    return courseLessonsLoaded(course, lessons);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult? Function(CourseEntity course)? courseDetailLoaded,
    TResult? Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult? Function(String message)? error,
  }) {
    return courseLessonsLoaded?.call(course, lessons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult Function(CourseEntity course)? courseDetailLoaded,
    TResult Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (courseLessonsLoaded != null) {
      return courseLessonsLoaded(course, lessons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseInitial value) initial,
    required TResult Function(CourseLoading value) loading,
    required TResult Function(CoursesLoaded value) coursesLoaded,
    required TResult Function(CourseDetailLoaded value) courseDetailLoaded,
    required TResult Function(CourseLessonsLoaded value) courseLessonsLoaded,
    required TResult Function(CourseError value) error,
  }) {
    return courseLessonsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseInitial value)? initial,
    TResult? Function(CourseLoading value)? loading,
    TResult? Function(CoursesLoaded value)? coursesLoaded,
    TResult? Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult? Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult? Function(CourseError value)? error,
  }) {
    return courseLessonsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseInitial value)? initial,
    TResult Function(CourseLoading value)? loading,
    TResult Function(CoursesLoaded value)? coursesLoaded,
    TResult Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult Function(CourseError value)? error,
    required TResult orElse(),
  }) {
    if (courseLessonsLoaded != null) {
      return courseLessonsLoaded(this);
    }
    return orElse();
  }
}

abstract class CourseLessonsLoaded implements CourseState {
  const factory CourseLessonsLoaded({
    required final CourseEntity course,
    required final List<LessonEntity> lessons,
  }) = _$CourseLessonsLoadedImpl;

  CourseEntity get course;
  List<LessonEntity> get lessons;

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseLessonsLoadedImplCopyWith<_$CourseLessonsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CourseErrorImplCopyWith<$Res> {
  factory _$$CourseErrorImplCopyWith(
    _$CourseErrorImpl value,
    $Res Function(_$CourseErrorImpl) then,
  ) = __$$CourseErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CourseErrorImplCopyWithImpl<$Res>
    extends _$CourseStateCopyWithImpl<$Res, _$CourseErrorImpl>
    implements _$$CourseErrorImplCopyWith<$Res> {
  __$$CourseErrorImplCopyWithImpl(
    _$CourseErrorImpl _value,
    $Res Function(_$CourseErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$CourseErrorImpl(
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$CourseErrorImpl implements CourseError {
  const _$CourseErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CourseState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseErrorImplCopyWith<_$CourseErrorImpl> get copyWith =>
      __$$CourseErrorImplCopyWithImpl<_$CourseErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )
    coursesLoaded,
    required TResult Function(CourseEntity course) courseDetailLoaded,
    required TResult Function(CourseEntity course, List<LessonEntity> lessons)
    courseLessonsLoaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult? Function(CourseEntity course)? courseDetailLoaded,
    TResult? Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<CourseEntity> courses,
      CourseCategory? selectedCategory,
      CourseLevel? selectedLevel,
      String? searchQuery,
    )?
    coursesLoaded,
    TResult Function(CourseEntity course)? courseDetailLoaded,
    TResult Function(CourseEntity course, List<LessonEntity> lessons)?
    courseLessonsLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CourseInitial value) initial,
    required TResult Function(CourseLoading value) loading,
    required TResult Function(CoursesLoaded value) coursesLoaded,
    required TResult Function(CourseDetailLoaded value) courseDetailLoaded,
    required TResult Function(CourseLessonsLoaded value) courseLessonsLoaded,
    required TResult Function(CourseError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CourseInitial value)? initial,
    TResult? Function(CourseLoading value)? loading,
    TResult? Function(CoursesLoaded value)? coursesLoaded,
    TResult? Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult? Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult? Function(CourseError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CourseInitial value)? initial,
    TResult Function(CourseLoading value)? loading,
    TResult Function(CoursesLoaded value)? coursesLoaded,
    TResult Function(CourseDetailLoaded value)? courseDetailLoaded,
    TResult Function(CourseLessonsLoaded value)? courseLessonsLoaded,
    TResult Function(CourseError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CourseError implements CourseState {
  const factory CourseError({required final String message}) =
      _$CourseErrorImpl;

  String get message;

  /// Create a copy of CourseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseErrorImplCopyWith<_$CourseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
