// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'task_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TaskListState _$TaskListStateFromJson(Map<String, dynamic> json) {
  return _TaskListState.fromJson(json);
}

class _$TaskListStateTearOff {
  const _$TaskListStateTearOff();

// ignore: unused_element
  _TaskListState call(
      {OAuth2Token authToken,
      User authUser,
      List<Task> tasks,
      int totalCount = 0,
      int page = 1,
      int perPage = _taskListPerPage,
      int maxPage = 1,
      bool isLastFetched = true,
      bool isFetching = false,
      bool isError = false,
      int errorStatusCode = 0,
      String errorBody = ''}) {
    return _TaskListState(
      authToken: authToken,
      authUser: authUser,
      tasks: tasks,
      totalCount: totalCount,
      page: page,
      perPage: perPage,
      maxPage: maxPage,
      isLastFetched: isLastFetched,
      isFetching: isFetching,
      isError: isError,
      errorStatusCode: errorStatusCode,
      errorBody: errorBody,
    );
  }
}

// ignore: unused_element
const $TaskListState = _$TaskListStateTearOff();

mixin _$TaskListState {
  OAuth2Token get authToken;
  User get authUser;
  List<Task> get tasks;
  int get totalCount;
  int get page;
  int get perPage;
  int get maxPage;
  bool get isLastFetched;
  bool get isFetching;
  bool get isError;
  int get errorStatusCode;
  String get errorBody;

  Map<String, dynamic> toJson();
  $TaskListStateCopyWith<TaskListState> get copyWith;
}

abstract class $TaskListStateCopyWith<$Res> {
  factory $TaskListStateCopyWith(
          TaskListState value, $Res Function(TaskListState) then) =
      _$TaskListStateCopyWithImpl<$Res>;
  $Res call(
      {OAuth2Token authToken,
      User authUser,
      List<Task> tasks,
      int totalCount,
      int page,
      int perPage,
      int maxPage,
      bool isLastFetched,
      bool isFetching,
      bool isError,
      int errorStatusCode,
      String errorBody});
}

class _$TaskListStateCopyWithImpl<$Res>
    implements $TaskListStateCopyWith<$Res> {
  _$TaskListStateCopyWithImpl(this._value, this._then);

  final TaskListState _value;
  // ignore: unused_field
  final $Res Function(TaskListState) _then;

  @override
  $Res call({
    Object authToken = freezed,
    Object authUser = freezed,
    Object tasks = freezed,
    Object totalCount = freezed,
    Object page = freezed,
    Object perPage = freezed,
    Object maxPage = freezed,
    Object isLastFetched = freezed,
    Object isFetching = freezed,
    Object isError = freezed,
    Object errorStatusCode = freezed,
    Object errorBody = freezed,
  }) {
    return _then(_value.copyWith(
      authToken:
          authToken == freezed ? _value.authToken : authToken as OAuth2Token,
      authUser: authUser == freezed ? _value.authUser : authUser as User,
      tasks: tasks == freezed ? _value.tasks : tasks as List<Task>,
      totalCount: totalCount == freezed ? _value.totalCount : totalCount as int,
      page: page == freezed ? _value.page : page as int,
      perPage: perPage == freezed ? _value.perPage : perPage as int,
      maxPage: maxPage == freezed ? _value.maxPage : maxPage as int,
      isLastFetched: isLastFetched == freezed
          ? _value.isLastFetched
          : isLastFetched as bool,
      isFetching:
          isFetching == freezed ? _value.isFetching : isFetching as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
      errorStatusCode: errorStatusCode == freezed
          ? _value.errorStatusCode
          : errorStatusCode as int,
      errorBody: errorBody == freezed ? _value.errorBody : errorBody as String,
    ));
  }
}

abstract class _$TaskListStateCopyWith<$Res>
    implements $TaskListStateCopyWith<$Res> {
  factory _$TaskListStateCopyWith(
          _TaskListState value, $Res Function(_TaskListState) then) =
      __$TaskListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {OAuth2Token authToken,
      User authUser,
      List<Task> tasks,
      int totalCount,
      int page,
      int perPage,
      int maxPage,
      bool isLastFetched,
      bool isFetching,
      bool isError,
      int errorStatusCode,
      String errorBody});
}

class __$TaskListStateCopyWithImpl<$Res>
    extends _$TaskListStateCopyWithImpl<$Res>
    implements _$TaskListStateCopyWith<$Res> {
  __$TaskListStateCopyWithImpl(
      _TaskListState _value, $Res Function(_TaskListState) _then)
      : super(_value, (v) => _then(v as _TaskListState));

  @override
  _TaskListState get _value => super._value as _TaskListState;

  @override
  $Res call({
    Object authToken = freezed,
    Object authUser = freezed,
    Object tasks = freezed,
    Object totalCount = freezed,
    Object page = freezed,
    Object perPage = freezed,
    Object maxPage = freezed,
    Object isLastFetched = freezed,
    Object isFetching = freezed,
    Object isError = freezed,
    Object errorStatusCode = freezed,
    Object errorBody = freezed,
  }) {
    return _then(_TaskListState(
      authToken:
          authToken == freezed ? _value.authToken : authToken as OAuth2Token,
      authUser: authUser == freezed ? _value.authUser : authUser as User,
      tasks: tasks == freezed ? _value.tasks : tasks as List<Task>,
      totalCount: totalCount == freezed ? _value.totalCount : totalCount as int,
      page: page == freezed ? _value.page : page as int,
      perPage: perPage == freezed ? _value.perPage : perPage as int,
      maxPage: maxPage == freezed ? _value.maxPage : maxPage as int,
      isLastFetched: isLastFetched == freezed
          ? _value.isLastFetched
          : isLastFetched as bool,
      isFetching:
          isFetching == freezed ? _value.isFetching : isFetching as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
      errorStatusCode: errorStatusCode == freezed
          ? _value.errorStatusCode
          : errorStatusCode as int,
      errorBody: errorBody == freezed ? _value.errorBody : errorBody as String,
    ));
  }
}

@JsonSerializable()
class _$_TaskListState implements _TaskListState {
  const _$_TaskListState(
      {this.authToken,
      this.authUser,
      this.tasks,
      this.totalCount = 0,
      this.page = 1,
      this.perPage = _taskListPerPage,
      this.maxPage = 1,
      this.isLastFetched = true,
      this.isFetching = false,
      this.isError = false,
      this.errorStatusCode = 0,
      this.errorBody = ''})
      : assert(totalCount != null),
        assert(page != null),
        assert(perPage != null),
        assert(maxPage != null),
        assert(isLastFetched != null),
        assert(isFetching != null),
        assert(isError != null),
        assert(errorStatusCode != null),
        assert(errorBody != null);

  factory _$_TaskListState.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskListStateFromJson(json);

  @override
  final OAuth2Token authToken;
  @override
  final User authUser;
  @override
  final List<Task> tasks;
  @JsonKey(defaultValue: 0)
  @override
  final int totalCount;
  @JsonKey(defaultValue: 1)
  @override
  final int page;
  @JsonKey(defaultValue: _taskListPerPage)
  @override
  final int perPage;
  @JsonKey(defaultValue: 1)
  @override
  final int maxPage;
  @JsonKey(defaultValue: true)
  @override
  final bool isLastFetched;
  @JsonKey(defaultValue: false)
  @override
  final bool isFetching;
  @JsonKey(defaultValue: false)
  @override
  final bool isError;
  @JsonKey(defaultValue: 0)
  @override
  final int errorStatusCode;
  @JsonKey(defaultValue: '')
  @override
  final String errorBody;

  @override
  String toString() {
    return 'TaskListState(authToken: $authToken, authUser: $authUser, tasks: $tasks, totalCount: $totalCount, page: $page, perPage: $perPage, maxPage: $maxPage, isLastFetched: $isLastFetched, isFetching: $isFetching, isError: $isError, errorStatusCode: $errorStatusCode, errorBody: $errorBody)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskListState &&
            (identical(other.authToken, authToken) ||
                const DeepCollectionEquality()
                    .equals(other.authToken, authToken)) &&
            (identical(other.authUser, authUser) ||
                const DeepCollectionEquality()
                    .equals(other.authUser, authUser)) &&
            (identical(other.tasks, tasks) ||
                const DeepCollectionEquality().equals(other.tasks, tasks)) &&
            (identical(other.totalCount, totalCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalCount, totalCount)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.perPage, perPage) ||
                const DeepCollectionEquality()
                    .equals(other.perPage, perPage)) &&
            (identical(other.maxPage, maxPage) ||
                const DeepCollectionEquality()
                    .equals(other.maxPage, maxPage)) &&
            (identical(other.isLastFetched, isLastFetched) ||
                const DeepCollectionEquality()
                    .equals(other.isLastFetched, isLastFetched)) &&
            (identical(other.isFetching, isFetching) ||
                const DeepCollectionEquality()
                    .equals(other.isFetching, isFetching)) &&
            (identical(other.isError, isError) ||
                const DeepCollectionEquality()
                    .equals(other.isError, isError)) &&
            (identical(other.errorStatusCode, errorStatusCode) ||
                const DeepCollectionEquality()
                    .equals(other.errorStatusCode, errorStatusCode)) &&
            (identical(other.errorBody, errorBody) ||
                const DeepCollectionEquality()
                    .equals(other.errorBody, errorBody)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(authToken) ^
      const DeepCollectionEquality().hash(authUser) ^
      const DeepCollectionEquality().hash(tasks) ^
      const DeepCollectionEquality().hash(totalCount) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(perPage) ^
      const DeepCollectionEquality().hash(maxPage) ^
      const DeepCollectionEquality().hash(isLastFetched) ^
      const DeepCollectionEquality().hash(isFetching) ^
      const DeepCollectionEquality().hash(isError) ^
      const DeepCollectionEquality().hash(errorStatusCode) ^
      const DeepCollectionEquality().hash(errorBody);

  @override
  _$TaskListStateCopyWith<_TaskListState> get copyWith =>
      __$TaskListStateCopyWithImpl<_TaskListState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskListStateToJson(this);
  }
}

abstract class _TaskListState implements TaskListState {
  const factory _TaskListState(
      {OAuth2Token authToken,
      User authUser,
      List<Task> tasks,
      int totalCount,
      int page,
      int perPage,
      int maxPage,
      bool isLastFetched,
      bool isFetching,
      bool isError,
      int errorStatusCode,
      String errorBody}) = _$_TaskListState;

  factory _TaskListState.fromJson(Map<String, dynamic> json) =
      _$_TaskListState.fromJson;

  @override
  OAuth2Token get authToken;
  @override
  User get authUser;
  @override
  List<Task> get tasks;
  @override
  int get totalCount;
  @override
  int get page;
  @override
  int get perPage;
  @override
  int get maxPage;
  @override
  bool get isLastFetched;
  @override
  bool get isFetching;
  @override
  bool get isError;
  @override
  int get errorStatusCode;
  @override
  String get errorBody;
  @override
  _$TaskListStateCopyWith<_TaskListState> get copyWith;
}
